using PerAsperaEditor.GameProject;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace PerAsperaEditor.Components
{
    internal class GameEntity : ViewModelBase
    {
        private string _name;

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

        public Scene ParentScene { get; set; }

        public GameEntity(Scene parentScene)
        {
            Debug.Assert(parentScene != null);
            ParentScene = parentScene;
        }
    }
}
