using PerAsperaEditor.Utilities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace PerAsperaEditor.GameProject
{
    [DataContract(Name = "Game")]
    public class Project : ViewModelBase
    {
        public static string Extension = ".perAspera";
        [DataMember]
        public string ProjectName { get; private set; }
        [DataMember]
        public string ProjectPath { get; private set; }

        public string FullPath => $"{ProjectPath}{ProjectName}{Extension}";

        [DataMember(Name = "Scenes")]
        private ObservableCollection<Scene> _scenes = new ObservableCollection<Scene>();
        public ReadOnlyObservableCollection<Scene> Scenes { get; private set; }

        private Scene _activeScene { get; set; }
        public Scene ActiveScene
        {
            get => _activeScene;
            set { 
                if(_activeScene != value)
                {
                    _activeScene = value;
                    OnPropertyChanged(nameof(ActiveScene));
                }
            }
        }

        public static Project Current => Application.Current.MainWindow.DataContext as Project;

        public static Project Load(string filePath)
        {
            Debug.Assert(File.Exists(filePath));
            return Serializer.FromFile<Project>(filePath);
        }

        public void Unload() { }

        public static void Save(Project project)
        {
            Serializer.ToFile(project, project.FullPath);
        }

        [OnDeserialized]
        private void OnDeserialized(StreamingContext context)
        {
            if(_scenes != null)
            {
                Scenes = new ReadOnlyObservableCollection<Scene>(_scenes);
                OnPropertyChanged(nameof(Scenes));

                ActiveScene = Scenes.FirstOrDefault(x => x.IsActive);

                AddScene = new RelayCommand<object>(x =>
                {
                    AddSceneInternal($"New Scene {Scenes.Count}");
                    var newScene = Scenes.Last();
                    var newSceneIndex = Scenes.Count - 1;

                    HistoryAction.Add(new UndoRedoAction(
                        () => RemoveSceneInternal(newScene),
                        () => _scenes.Insert(newSceneIndex, newScene),
                        $"Add Scene: {newScene.Name}"
                        ));
                });

                RemoveScene = new RelayCommand<Scene>(x =>
                {
                    var sceneIndex = _scenes.IndexOf(x);
                    RemoveSceneInternal(x);

                    HistoryAction.Add(new UndoRedoAction(
                        () => _scenes.Insert(sceneIndex, x),
                        () => RemoveSceneInternal(x),
                        $"Remove Scene: {x.Name}"
                        ));
                }, x => !x.IsActive);

                Undo = new RelayCommand<object>(x => HistoryAction.UndoAction());
                Redo = new RelayCommand<object>(x => HistoryAction.RedoAction());
            }
        }

        public static HistoryAction HistoryAction { get; } = new HistoryAction();

        public ICommand Undo { get; private set; }
        public ICommand Redo { get; private set; }

        public ICommand AddScene { get; private set; }
        public ICommand RemoveScene { get; private set; }

        public void AddSceneInternal(string sceneName)
        {
            Debug.Assert(!string.IsNullOrEmpty(sceneName));
            _scenes.Add(new Scene(this, sceneName));
        }

        public void RemoveSceneInternal(Scene scene)
        {
            Debug.Assert(scene != null && _scenes.Contains(scene));  
            _scenes.Remove(scene);
        }

        public Project(string name, string path)
        {
            ProjectName = name;
            ProjectPath = path;

            OnDeserialized(new StreamingContext());
        }
    }
}
