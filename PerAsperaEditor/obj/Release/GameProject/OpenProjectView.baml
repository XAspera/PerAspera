   M S B A M L   `   `   `  ���� J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  1    +PerAsperaEditor.GameProject.OpenProjectView   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:PerAsperaEditor.GameProject     $	��800��  � DataContext  -  'PerAsperaEditor.GameProject.OpenProject  .���� 
�������.+���  �� Orientation$ 
Horizontal=�$��Center=�$��0,30,0,0q�.+��� -    ��Name$ projectsListBox��$	��600��$	��250�� �� SelectedIndex$ 0������ *
Projects+ � 	Resources  �� 
TargetType �� Property �� Value��%:   '��       �� " ��.���  �@��CornerRadius$ 15������ .R�� $��35��$	��555��$��15q� � ColumnDefinitions �� $��2* ��� $��* ��� $��* �.+��� $��0��$��Center=�$��18(�$
��Bold"����� *Project.ProjectName+�� $��2��$��Right=�$��Center=�$��15(����� *Date+�� 	 ��Name$	 	Separator��	
 �� X1$
 0��	 �� X2$ 0��	 �� Y1$ 0��	 �� Y2$ 35�� J� SnapsToDevicePixels$
 True��$��1��
���   �$	��1.5��$��Center=����� " �� �� 	Resources ��%:   '��       �� " ��.���  �@��CornerRadius$ 15��.�-   �� $ 
Horizontal=�$��Center=�$��0,30,0,0q�.+��� -   $
��Open��$	��100�� �� 	IsDefault$
 True���� $
��Exit��$	��100��$��30,0,0,0q� �� IsCancel$
 True��