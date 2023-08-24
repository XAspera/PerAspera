using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using PerAsperaEditor.GameProject;
using PerAsperaEditor.Components;
using PerAsperaEditor.Utilities;

namespace PerAsperaEditor.Editors
{
    /// <summary>
    /// Interaction logic for ProjectLayoutView.xaml
    /// </summary>
    public partial class ProjectLayoutView : UserControl
    {
        public ProjectLayoutView()
        {
            InitializeComponent();
        }

        private void OnAddGameEntityButton_Click(object sender, RoutedEventArgs e)
        {
            var viewModel = (sender as Button).DataContext as Scene;
            viewModel.AddGameEntityCommand.Execute(new GameEntity(viewModel) { Name = "Empty Game Entity" });
        }

        private void OnGameEntities_ListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GameEntityView.Instance.DataContext = null;
            var listBox = sender as ListBox;
            var newSelection = listBox.SelectedItems.Cast<GameEntity>().ToList();
            var previousSelection = newSelection.Except(e.AddedItems.Cast<GameEntity>()).Concat(e.RemovedItems.Cast<GameEntity>()).ToList();

            Project.HistoryAction.Add(new UndoRedoAction(
                () =>
                {
                    listBox.UnselectAll();
                    previousSelection.ForEach(x => (listBox.ItemContainerGenerator.ContainerFromItem(x) as ListBoxItem).IsSelected = true);
                },
                () =>
                {
                    listBox.UnselectAll();
                    newSelection.ForEach(x => (listBox.ItemContainerGenerator.ContainerFromItem(x) as ListBoxItem).IsSelected = true);
                },
                "Selection Changed"
                ));


            MSGameEntity msGameEntity = null;
            if (newSelection.Any())
            {
                msGameEntity = new MSGameEntity(newSelection);
            }
            GameEntityView.Instance.DataContext = msGameEntity;
        }
    }
}
