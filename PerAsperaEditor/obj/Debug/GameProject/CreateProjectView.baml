   M S B A M L   `   `   `  ����J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  5      3    -PerAsperaEditor.GameProject.CreateProjectView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:PerAsperaEditor.GameProject     5      $	��800��5        � DataContext  5      /  )PerAsperaEditor.GameProject.CreateProject  5   
   .��5      �� 
����ح�.+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��Center=�6.   $��0,30,0,0q�6K   .+�5      �� -   5         ��Name$ templateListBox��5   ?   $	��200��5      $	��250��6"    �� SelectedIndex$ 0��5   X   ��6   �� *ProjectTemplates+ � 	Resources 5       �� 
TargetType �� Property �� Value��%_   '��       �� 5      " ��6   .�5      ��  �@��CornerRadius$ 15��69   5      5      ��5      �� 5      .R�5      �� $ 
Horizontal=�6%   $��35��6>   .+�5      �� $��35��6%   $��0,0,5,0q�60    �� CornerRadius$ 15��6A   ��5   "   �� 5   &   	 �� ImageSource	 61   �� *Icon+5      �� 5       $��Center=�6E   $��15(�6`   ��6(   �� *ProjectType+6`   5!      5"      ��5$      �� 5%      " ��6   
 �� 	Resources
 5&      ��%_   '��       �� 5'      " ��6$   .�5(   "   ��  �@��CornerRadius$ 15��6A   5)      5*      5+      5-      �� 5.      $	��400��6   $	��250��6!   $��5,0,0,0q�6.   $ 15��6?   ��5/      �� 50      	 6!   ��  �� Path$ SelectedItem.Screenshot� �� ElementName$ templateListBox��52      53      �� 54   
   $ 
Horizontal=�6   $��Center=�6.   $��0,30,0,0q�6K   .+�55      �� $
��Name��6   $��50��6$   �� 56      $	��550��6   ��6"   �� *ProjectName+ �� UpdateSourceTrigger$ PropertyChanged=�57      �� 58   
   $ 
Horizontal=�6   $��Center=�6.   $��0,5,0,0q�6K   .+�59      �� $
��Path��6   $��50��6$   �� 5:      $	��500��6   ��6"   �� *ProjectPath+$ PropertyChanged=��� 5;      $��Browse��6   $��45��6&   $��5,0,0,0q�61   5<      �� 5=   
   $ 
Horizontal=�6   $��Center=�6.   $��0,15,0,0q�6K   .+�5>      �� -   5        $��Create��5>      $	��100��6&    �� 	IsDefault$
 True��62   {�6C   �� *	IsValid+5?      �� 5@      $
��Exit��6   $	��100��6$   $��30,0,0,0q�60    �� IsCancel$
 True��6B   5A      �� 5B   
   $��0,20,0,0q�6   $��Center=�6@   ��6&   �� *
ErrorMsg+6@   5C      5D      