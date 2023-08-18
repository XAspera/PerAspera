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

namespace PerAsperaEditor.GameProject
{
    [DataContract]
    public class ProjectData
    {
        [DataMember]
        public Project Project { get; set; }

        [DataMember]
        public DateTime Date { get; set; }
    }

    [DataContract]
    public class ProjectDataList
    {
        [DataMember]
        public List<ProjectData> Projects { get; set; }
    }

    public class OpenProject : ViewModelBase
    {
        private static readonly string _applicationDataPath = $@"{Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData)}\PerAsperaEditor\";
        private static readonly string _projectDataPath;
        private static readonly ObservableCollection<ProjectData> _projects = new ObservableCollection<ProjectData>();
        public static ReadOnlyObservableCollection<ProjectData> Projects { get; }

        private static void ReadProjectData()
        {
            if (File.Exists(_projectDataPath))
            {
                var projects = Serializer.FromFile<ProjectDataList>(_projectDataPath).Projects.OrderBy(x => x.Date);
                _projects.Clear();
                foreach(var project in projects)
                {
                    if (File.Exists(project.Project.FullPath))
                    {
                        _projects.Add(project);
                    }
                }
            }

            foreach(var project in _projects)
            {
                Console.WriteLine(project.Project.ProjectName);
            }
        }

        private static void WriteProjectData()
        {
            var projects = Projects.OrderBy(x => x.Date).ToList();
            Serializer.ToFile(new ProjectDataList() { Projects = projects }, _projectDataPath);
        }

        public static Project Open(ProjectData projectData)
        {
            ReadProjectData();
            var project = Projects.FirstOrDefault(x => x.Project.FullPath.Equals(projectData.Project.FullPath));
            if(project != null)
            {
                project.Date = DateTime.Now;
            }
            else
            {
                project = projectData;
                project.Date = DateTime.Now;
                _projects.Add(project);
            }

            WriteProjectData();

            return Project.Load(project.Project.FullPath);
        }

        static OpenProject()
        {
            try
            {
                if(!Directory.Exists(_applicationDataPath)) Directory.CreateDirectory(_applicationDataPath);
                _projectDataPath = $@"{_applicationDataPath}ProjectData.xml";
                Projects = new ReadOnlyObservableCollection<ProjectData>(_projects);
                ReadProjectData();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                // TODO: set a proper log
            }
        }
    }
}
