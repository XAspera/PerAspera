   M S B A M L   `   `   `  ����J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:PerAsperaEditor.EditorsPerAsperaEditor.Editors  5      I)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  5      /    )PerAsperaEditor.Editors.ProjectLayoutView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      7local%clr-namespace:PerAsperaEditor.Editors     5      :proj)clr-namespace:PerAsperaEditor.GameProject     5      .��5      �   � RowDefinitions  5   
   �� 5      $��32 �6   �� 5      .+�5   
   �� $��	Add Scene��6   $��0��6%   $��96��62   $��20,0,0,0q�6=   $
��Left=�5      $��Center=�6,   $|�False��6H   ��5      �� *AddSceneCommand+�� 5   
   $��1��6   $
��Auto=�6$   $
��Auto=�6I   .��5      �� ��6   �� *Scenes+��5      �� 5      .R�5      �� 5      ��5      �� 5      .R�5      9�  9� 
IsExpanded 6#   �� *
IsActive+ �� Mode$ OneWay=���5      � 5    "   .+�5!   &   ��  �� Orientation$ 
Horizontal=�61   .+�5"   *   �� ��64   �� *Name+�� 5#   *   $��Remove��61   $
��20,0q�6B   $|�False��6P   ��5$   1   �� * DataContext.RemoveSceneCommand+ �� RelativeSource ��  �� AncestorType UserControl��5%   1   �� �� 5&   *   -   5        $��+��5&   1   $
��20,0q�6=   $|�False��6K   {�5'   U   �� *
IsActive+5(   '   5)   #   .��5+      �� -   5         �� SelectionMode$ Extended=�5+   j   ��6&   �� *GameEntities+{�6K   �� *
IsActive+��5-   "   �� 5.   &   .R�5/   *   �  � ColumnDefinitions 50   .   �� 51   2   $	��500 �6C   �� 52   2   $
��Auto �6C   .+�54   .   �� $��0��6N   ��68   �� *Name+6N   �� 55   .   $��Remove��65   $��20,0,0,0q�56   R   $��1��6d   ��55   F   �� *%#ParentScene.RemoveGameEntityCommand+��56   5   �� 6d   57   +   58   '   5:      5;      5<      5>      5?      5@      5A      