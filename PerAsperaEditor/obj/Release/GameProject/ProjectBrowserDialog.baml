   M S B A M L   `   `   `  ���� J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  6    0PerAsperaEditor.GameProject.ProjectBrowserDialog   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ;local)clr-namespace:PerAsperaEditor.GameProject       � 
ResizeMode$  NoResize=� � WindowStartupLocation$ CenterScreen=� � Title$' !PerAsperaEditor - Project Browser��$	��600��$	��800��.��� 
����  � � RowDefinitions �� $
��auto ��� .+���  �� Orientation$ 
Horizontal=�$��Center=�$��	0,20,0,20q� � 	Resources  �� 
TargetType �� Property �� Value��%:   '��       �� " ��.���  �@��CornerRadius$ 15��.+�d� -   	 d�Name$	 openProjectButton��$��Open Project��$��32(�$��10q�
 d� 	IsChecked$

 TrueY�d� -   $	 createProjectButton��$��Create Project��$��32(�$��30,0,0,0q�$��10q�$
 FalseY��� -    ��Name$ browserContent��$ 
Horizontal=�$��1��.+�1   +PerAsperaEditor.GameProject.OpenProjectView  -     Name$ openProjectView��3   -PerAsperaEditor.GameProject.CreateProjectView  -     Name$ createProjectView��