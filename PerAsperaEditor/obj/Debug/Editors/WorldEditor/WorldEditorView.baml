   M S B A M L   `   `   `  ����J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:PerAsperaEditor.EditorsPerAsperaEditor.Editors  5      I)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  5      E'clr-namespace:PerAsperaEditor.UtilitiesPerAsperaEditor.Utilities  5      -    'PerAsperaEditor.Editors.WorldEditorView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      7local%clr-namespace:PerAsperaEditor.Editors     5      :proj)clr-namespace:PerAsperaEditor.GameProject     5      7utl'clr-namespace:PerAsperaEditor.Utilities     5      $
|�True��5
        J� InputBindings  5      �� 5   
   
 �� Key$ Z��65    �� 	Modifiers$
 Ctrlf�6=    �� Command 6   �� *UndoCommand+6=   �� 5   
   $ Y��65   $
 Ctrlf�6=    6   �� *RedoCommand+6=   �� 5   
   $ S��65   $
 Ctrlf�6=    6   �� *SaveCommand+6=   .��5      �  � RowDefinitions 5   
   �� 5      $��32 �6   �� 5      .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $
��Undo��6   ��6$   �� *UndoCommand+�� 5      $
��Redo��6   $��32,0,0,0q�6D   ��6$   �� *RedoCommand+6D   5      � 5   
   $��1��6    � ColumnDefinitions 5      �� 5       �� 5!      .+�5#      � $��0��6    5$      �� 5%      �� 5&      .+�5(      �� $��1��6   $��5��6,   $��Stretch=�67   $	��Top=�6U   �� 5)      $��1��6   .@�5*      �� $��History��6   .��5+      1   +PerAsperaEditor.Utilities.HistoryActionView  $��1��6V    � DataContext 60   �� *HistoryAction+6V   5,      �� 5-      $	��Log��6   .��5.      *   $PerAsperaEditor.Utilities.LoggerView  5/      50      52      �� 54      $��1��6   $��5��6+   $
��Left=�65   $��Stretch=�6P   � 56      $��1��6   $��5,0,0,0q�6#    57      �� 58      �� 59      .+�5;      �� $��1��6   $��5��6,   $��Stretch=�67   $	��Top=�6U   /   )PerAsperaEditor.Editors.ProjectLayoutView  5<      ,   &PerAsperaEditor.Editors.GameEntityView  5=      $��1��6'   5>      5?      5@      5A      