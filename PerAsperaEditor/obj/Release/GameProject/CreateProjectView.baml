   M S B A M L   `   `   `  ���� J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  3    -PerAsperaEditor.GameProject.CreateProjectView   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ;local)clr-namespace:PerAsperaEditor.GameProject     $	��800��  � DataContext  /  )PerAsperaEditor.GameProject.CreateProject  .���� 
����ح�.+���  �� Orientation$ 
Horizontal=�$��Center=�$��0,30,0,0q�.+��� -    ��Name$ templateListBox��$	��200��$	��250�� �� SelectedIndex$ 0������ *ProjectTemplates+ � 	Resources  �� 
TargetType �� Property �� Value��%:   '��       �� " ��.���  �@��CornerRadius$ 15������ .R��� $ 
Horizontal=�$��35��.+��� $��35��$��0,0,5,0q� �� CornerRadius$ 15������ 	 �� ImageSource	 �� *Icon+�� $��Center=�$��15(����� *ProjectType+���� " ��
 �� 	Resources
 ��%:   '��       �� " ��.���  �@��CornerRadius$ 15���� $	��400��$	��250��$��5,0,0,0q�$ 15������ 	 ��  �� Path$ SelectedItem.Screenshot� �� ElementName$ templateListBox���� $ 
Horizontal=�$��Center=�$��0,30,0,0q�.+��� $
��Name��$��50���� $	��550������ *ProjectName+ �� UpdateSourceTrigger$ PropertyChanged=��� $ 
Horizontal=�$��Center=�$��0,5,0,0q�.+��� $
��Path��$��50���� $	��500������ *ProjectPath+$ PropertyChanged=��� $��Browse��$��45��$��5,0,0,0q��� $ 
Horizontal=�$��Center=�$��0,15,0,0q�.+��� -   $��Create��$	��100�� �� 	IsDefault$
 True��{��� *	IsValid+�� $
��Exit��$	��100��$��30,0,0,0q� �� IsCancel$
 True���� $��0,20,0,0q�$��Center=����� *
ErrorMsg+