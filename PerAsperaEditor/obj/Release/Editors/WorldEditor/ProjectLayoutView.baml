   M S B A M L   `   `   `  ���� J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:PerAsperaEditor.EditorsPerAsperaEditor.Editors  I)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  /    )PerAsperaEditor.Editors.ProjectLayoutView   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     7local%clr-namespace:PerAsperaEditor.Editors     :proj)clr-namespace:PerAsperaEditor.GameProject     .���   � RowDefinitions  �� $��32 ��� .+��� $��	Add Scene��$��0��$��96��$��20,0,0,0q�$
��Left=�$��Center=�$|�False������ *AddSceneCommand+�� $��1��$
��Auto=�$
��Auto=�.���� ���� *Scenes+���� .R��� ���� .R�9�  9� 
IsExpanded �� *
IsActive+ �� Mode$ OneWay=���� .+���  �� Orientation$ 
Horizontal=�.+��� ���� *Name+�� $��Remove��$
��20,0q�$|�False������ * DataContext.RemoveSceneCommand+ �� RelativeSource ��  �� AncestorType UserControl���� �� -   $��+��$
��20,0q�$|�False��{��� *
IsActive+.���� -    �� SelectionMode$ Extended=����� *GameEntities+{��� *
IsActive+���� .R��  � ColumnDefinitions �� $	��500 ��� $
��Auto �.+��� $��0������ *Name+�� $��Remove��$��20,0,0,0q�$��1������ *%#ParentScene.RemoveGameEntityCommand+���� 