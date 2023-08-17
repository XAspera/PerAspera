using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

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
        public ReadOnlyObservableCollection<Scene> Scenes { get; }

        public Project(string name, string path)
        {
            ProjectName = name;
            ProjectPath = path;

            _scenes.Add(new Scene(this, "DefaultScene"));
        }
    }
}
