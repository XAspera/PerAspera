using PerAsperaEditor.Utilities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerAsperaEditor.GameProject
{
    class CreateProject : ViewModelBase
    {
        // TODO: get a better path for template
        private string _templatePath = @"..\..\PerAsperaEditor\ProjectTemplates\";
        private string _projectName = "DefaultNewProject";
        public string ProjectName
        {
            get => _projectName;
            set
            {
                if (_projectName != value)
                {
                    _projectName = value;
                    ValidateProjectPath();
                    OnPropertyChanged(nameof(ProjectName));
                }
            }
        }

        private string _projectPath = $@"{Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)}\PerAsperaProjects\";
        public string ProjectPath
        {
            get => _projectPath;
            set
            {
                if (_projectPath != value)
                {
                    _projectPath = value;
                    ValidateProjectPath();
                    OnPropertyChanged(nameof(ProjectPath));
                }
            }
        }

        private bool _isValid;
        public bool IsValid
        {
            get => _isValid;
            set
            {
                if(_isValid != value)
                {
                    _isValid = value; 
                    OnPropertyChanged(nameof(IsValid));   
                }
            }
        }

        private string _errorMsg;
        public string ErrorMsg
        {
            get => _errorMsg;
            set
            {
                if (_errorMsg != value)
                {
                    _errorMsg = value;
                    OnPropertyChanged(nameof(ErrorMsg));
                }
            }
        }

        private ObservableCollection<ProjectTemplate> _projectTemplates = new ObservableCollection<ProjectTemplate>();
        public ReadOnlyObservableCollection<ProjectTemplate> ProjectTemplates { get; }

        private bool ValidateProjectPath()
        {
            var path = ProjectPath;
            if (!Path.EndsInDirectorySeparator(path)) path += @"\";
            path += $@"{ProjectName}";

            IsValid = false;
            if (string.IsNullOrWhiteSpace(ProjectName.Trim())) ErrorMsg = "Type in a Project Name.";
            else if (ProjectName.IndexOfAny(Path.GetInvalidFileNameChars()) != -1) ErrorMsg = "Invalid Character(s) used in Project Name.";
            else if (string.IsNullOrWhiteSpace(ProjectPath.Trim())) ErrorMsg = "Type in a Project Path.";
            else if (ProjectPath.IndexOfAny(Path.GetInvalidPathChars()) != -1) ErrorMsg = "Invalid Character(s) used in Project Path.";
            else if(Directory.Exists(path) && Directory.EnumerateFileSystemEntries(path).Any()) ErrorMsg = "Selected Project Folder already exists and is not empty.";
            else
            {
                ErrorMsg = string.Empty;
                IsValid = true;
            }

            return IsValid;
        }

        public string CreateProjectFiles(ProjectTemplate template)
        {
            ValidateProjectPath();
            if(!IsValid) return string.Empty;

            if (!Path.EndsInDirectorySeparator(ProjectPath)) ProjectPath += @"\";
            var path = $@"{ProjectPath}{ProjectName}\";

            try
            {
                if(!Directory.Exists(path)) Directory.CreateDirectory(path);
                foreach(var folder in template.Folders)
                {
                    Directory.CreateDirectory(Path.GetFullPath(Path.Combine(Path.GetDirectoryName(path), folder)));
                }
                var directoryInfo = new DirectoryInfo(path + @".PerAspera\");
                directoryInfo.Attributes |= FileAttributes.Hidden;
                File.Copy(template.IconPath, Path.GetFullPath(Path.Combine(directoryInfo.FullName, "Icon.png")));
                File.Copy(template.ScreenshotPath, Path.GetFullPath(Path.Combine(directoryInfo.FullName, "Screenshot.png")));

                var projectXml = File.ReadAllText(template.ProjectFilePath);
                projectXml = string.Format(projectXml, ProjectName, ProjectPath);
                var projectPath = Path.GetFullPath(Path.Combine(path, $"{ProjectName}{Project.Extension}"));
                File.WriteAllText(projectPath, projectXml);

                return path;

            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                Logger.Log(MessageType.Error, $"Failed to create {ProjectName}");
                throw;
            }
        }


        public CreateProject()
        {
            ProjectTemplates = new ReadOnlyObservableCollection<ProjectTemplate>(_projectTemplates);

            try
            {
                var templatesFiles = Directory.GetFiles(_templatePath, "template.xml", SearchOption.AllDirectories);
                Debug.Assert(templatesFiles.Any());

                foreach (var templatesFile in templatesFiles)
                {
                    var template = Serializer.FromFile<ProjectTemplate>(templatesFile);

                    template.IconPath = Path.GetFullPath(Path.Combine(Path.GetDirectoryName(templatesFile), "Icon.png"));
                    template.Icon = File.ReadAllBytes(template.IconPath);
                    template.ScreenshotPath = Path.GetFullPath(Path.Combine(Path.GetDirectoryName(templatesFile), "Screenshot.png"));
                    template.Screenshot = File.ReadAllBytes(template.ScreenshotPath);
                    template.ProjectFilePath = Path.GetFullPath(Path.Combine(Path.GetDirectoryName(templatesFile), template.ProjectFile));

                    _projectTemplates.Add(template);
                }

                ValidateProjectPath();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                Logger.Log(MessageType.Error, $"Failed to read project templates");
                throw;
            }

        }
    }
}
