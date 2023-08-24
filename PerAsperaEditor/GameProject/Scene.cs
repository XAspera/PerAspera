using PerAsperaEditor.Components;
using PerAsperaEditor.Utilities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace PerAsperaEditor.GameProject
{
    [DataContract]
    class Scene : ViewModelBase
    {
        private string _name;
        [DataMember]
        public string Name
        {
            get => _name;
            set
            {
                if (_name != value)
                {
                    _name = value;
                    OnPropertyChanged(nameof(Name));
                }
            }
        }

        [DataMember]
        public Project Project { get; private set; }

        [DataMember(Name = nameof(GameEntities))]
        private ObservableCollection<GameEntity> _gameEntities = new ObservableCollection<GameEntity>();
        public ReadOnlyObservableCollection<GameEntity> GameEntities { get; private set; }

        private bool _isActive;
        [DataMember]
        public bool IsActive
        {
            get => _isActive;
            set
            {
                if (_isActive != value)
                {
                    _isActive = value;
                    OnPropertyChanged(nameof(IsActive));
                }
            }
        }

        public ICommand AddGameEntityCommand { get; private set; }
        public ICommand RemoveGameEntityCommand { get; private set; }

        private void AddGameEntity(GameEntity entity)
        {
            Debug.Assert(!_gameEntities.Contains(entity));
            _gameEntities.Add(entity);
        }

        private void RemoveGameEntity(GameEntity entity)
        {
            Debug.Assert(_gameEntities.Contains(entity));
            _gameEntities.Remove(entity);
        }

        [OnDeserialized]
        private void OnDeserialized(StreamingContext context)
        {
            if (_gameEntities != null)
            {
                GameEntities = new ReadOnlyObservableCollection<GameEntity>(_gameEntities);
                OnPropertyChanged(nameof(GameEntities));
            }
            AddGameEntityCommand = new RelayCommand<GameEntity>(x =>
                {
                    AddGameEntity(x);
                    var newGameEntityIndex = GameEntities.Count - 1;

                    Project.HistoryAction.Add(new UndoRedoAction(
                        () => RemoveGameEntity(x),
                        () => _gameEntities.Insert(newGameEntityIndex, x),
                        $"Add Game Entity: {x.Name} to: {Name}"
                        ));
                });

            RemoveGameEntityCommand = new RelayCommand<GameEntity>(x =>
            {
                var gameEntityIndex = _gameEntities.IndexOf(x);
                RemoveGameEntity(x);

                Project.HistoryAction.Add(new UndoRedoAction(
                    () => _gameEntities.Insert(gameEntityIndex, x),
                    () => RemoveGameEntity(x),
                    $"Remove Game Entity: {x.Name} from: {Name}"
                    ));
            });

        }

        public Scene(Project project, string name)
        {
            Debug.Assert(project != null);
            Project = project;
            Name = name;

            OnDeserialized(new StreamingContext());
        }
    }
}
