using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerAsperaEditor.Utilities
{
    public interface IHistoryAction
    {
        string Name { get; }

        void UndoAction();

        void RedoAction();
    }

    public class UndoRedoAction : IHistoryAction
    {
        private Action _undoAction;
        private Action _redoAction;

        public string Name { get; }
        public void UndoAction() => _undoAction();
        public void RedoAction() => _redoAction();

        public UndoRedoAction(string name)
        {
            Name = name;   
        }

        public UndoRedoAction(Action undoAction, Action redoAction, string name) : this(name)
        {
            Debug.Assert(undoAction != null && redoAction != null);
            _undoAction = undoAction;
            _redoAction = redoAction;
        }
    }


    public class HistoryAction
    {
        private readonly ObservableCollection<IHistoryAction> _undoList = new ObservableCollection<IHistoryAction>();
        private readonly ObservableCollection<IHistoryAction> _redoList = new ObservableCollection<IHistoryAction>();

        public ReadOnlyObservableCollection<IHistoryAction> UndoList { get; }
        public ReadOnlyObservableCollection<IHistoryAction> RedoList { get; }

        public void Reset()
        {
            _undoList.Clear();
            _redoList.Clear();  
        }

        public void Add(IHistoryAction action)
        {
            _undoList.Add(action);
            _redoList.Clear();
        }

        public void UndoAction()
        {
            if (UndoList.Any())
            {
                var lastAction = _undoList.Last();
                _undoList.RemoveAt(_undoList.Count - 1);
                lastAction.UndoAction();
                _redoList.Insert(0, lastAction);
            }
        }

        public void RedoAction()
        {
            if (RedoList.Any())
            {
                var firstAction = _redoList.First();
                _redoList.RemoveAt(0);
                firstAction.RedoAction();
                _undoList.Add(firstAction);
            }
        }

        public HistoryAction()
        {
            UndoList = new ReadOnlyObservableCollection<IHistoryAction>(_undoList);
            RedoList = new ReadOnlyObservableCollection<IHistoryAction>(_redoList);
        }
    }
}
