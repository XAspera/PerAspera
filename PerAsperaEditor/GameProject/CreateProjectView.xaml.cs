using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace PerAsperaEditor.GameProject
{
    /// <summary>
    /// Interaction logic for CreateProjectView.xaml
    /// </summary>
    public partial class CreateProjectView : UserControl
    {
        public CreateProjectView()
        {
            InitializeComponent();
        }

        private void OnCreateButton_Click(object sender, RoutedEventArgs e)
        {
            var viewModel = DataContext as CreateProject;
            var projectPath = viewModel.CreateProjectFiles(templateListBox.SelectedItem as ProjectTemplate);

            bool dialogResult = false;
            var win = Window.GetWindow(this);
            if(!string.IsNullOrEmpty(projectPath))
            {
                dialogResult = true;
                var project = OpenProject.Open(new ProjectData() { Date = DateTime.Now, Project = new Project(viewModel.ProjectName, projectPath) });
                win.DataContext = project;
            }
            win.DialogResult = dialogResult;
            win.Close(); 
        }
    }
}
