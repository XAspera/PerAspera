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
    class Project : ViewModelBase
    {
        public static string Extension = ".perAspera";
        [DataMember]
        public string ProjectName { get; private set; }
        [DataMember]
        public string ProjectPath { get; private set; }

        public string FullPath => $@"{ProjectPath}{ProjectName}\{ProjectName}{Extension}";

        [DataMember(Name = "Scenes")]
        private ObservableCollection<Scene> _scenes = new ObservableCollection<Scene>();
        public ReadOnlyObservableCollection<Scene> Scenes { get; private set; }

        private Scene _activeScene { get; set; }
        public Scene ActiveScene
        {
            get => _activeScene;
            set
            {
                if (_activeScene != value)
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

        public void Unload()
        {
            HistoryAction.Reset();
        }

        public static void Save(Project project)
        {
            Serializer.ToFile(project, project.FullPath);
            Logger.Log(MessageType.Info, $"Saved project to {project.FullPath}");
        }

        [OnDeserialized]
        private void OnDeserialized(StreamingContext context)
        {
            if (_scenes != null)
            {
                Scenes = new ReadOnlyObservableCollection<Scene>(_scenes);
                OnPropertyChanged(nameof(Scenes));
            }
            ActiveScene = Scenes.FirstOrDefault(x => x.IsActive);

            AddSceneCommand = new RelayCommand<object>(x =>
            {
                AddScene($"New Scene {Scenes.Count}");
                var newScene = Scenes.Last();
                var newSceneIndex = Scenes.Count - 1;

                HistoryAction.Add(new UndoRedoAction(
                    () => RemoveScene(newScene),
                    () => _scenes.Insert(newSceneIndex, newScene),
                    $"Add Scene: {newScene.Name}"
                    ));
            });

            RemoveSceneCommand = new RelayCommand<Scene>(x =>
            {
                var sceneIndex = _scenes.IndexOf(x);
                RemoveScene(x);

                HistoryAction.Add(new UndoRedoAction(
                    () => _scenes.Insert(sceneIndex, x),
                    () => RemoveScene(x),
                    $"Remove Scene: {x.Name}"
                    ));
            }, x => !x.IsActive);

            UndoCommand = new RelayCommand<object>(x => HistoryAction.UndoAction());
            RedoCommand = new RelayCommand<object>(x => HistoryAction.RedoAction());

            SaveCommand = new RelayCommand<object>(x => Save(this));

        }

        public static HistoryAction HistoryAction { get; } = new HistoryAction();

        public ICommand UndoCommand { get; private set; }
        public ICommand RedoCommand { get; private set; }

        public ICommand AddSceneCommand { get; private set; }
        public ICommand RemoveSceneCommand { get; private set; }
        public ICommand SaveCommand { get; private set; }

        public void AddScene(string sceneName)
        {
            Debug.Assert(!string.IsNullOrEmpty(sceneName));
            _scenes.Add(new Scene(this, sceneName));
        }

        public void RemoveScene(Scene scene)
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
