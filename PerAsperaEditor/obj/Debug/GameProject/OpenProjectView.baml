   M S B A M L   `   `   `  ����J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PerAsperaEditor.GameProjectPerAsperaEditor.GameProject  5      1    +PerAsperaEditor.GameProject.OpenProjectView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:PerAsperaEditor.GameProject     5      $	��800��5        � DataContext  5      -  'PerAsperaEditor.GameProject.OpenProject  5   
   .��5      �� 
�������.+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��Center=�6.   $��0,30,0,0q�6K   .+�5      �� -   5         ��Name$ projectsListBox��5   /   $	��600��5      $	��250��6"    �� SelectedIndex$ 0��5   H   ��6   �� *
Projects+ � 	Resources 5       �� 
TargetType �� Property �� Value��%_   '��       �� 5      " ��6   .�5      ��  �@��CornerRadius$ 15��69   5      5      ��5      �� 5      .R�5      � $��35��6   $	��555��6+   $��15q�67    � ColumnDefinitions 5      �� 5   "   $��2* �63   �� 5   "   $��* �63   �� 5   "   $��* �63   .+�5       �� $��0��6M   $��Center=�6]   $��18(�6x   $
��Bold"�6�   ��6(   �� *Project.ProjectName+6�   �� 5!      $��2��6>   $��Right=�6N   $��Center=�6j   $��15(�6�   ��6(   �� *Date+6�   �� 5#      	 ��Name$	 	Separator��6#   	
 �� X1$
 0��66   	 �� X2$ 0��6=   	 �� Y1$ 0��6D   	 �� Y2$ 35��6K    J� SnapsToDevicePixels$
 True��6S   $��1��6n   
���   �$	��1.5��6�   $��Center=�6�   5$      5%      ��5'      �� 5(      " ��6    �� 	Resources 5)      ��%_   '��       �� 5*      " ��6$   .�5+   "   ��  �@��CornerRadius$ 15��6A   5,      5-      .�5.      -   5        5/      51      52      �� 54   
   $ 
Horizontal=�6   $��Center=�6.   $��0,30,0,0q�6K   .+�55      �� -   5        $
��Open��55      $	��100��6$    �� 	IsDefault$
 True��60   6A   �� 56      $
��Exit��6   $	��100��6$   $��30,0,0,0q�60    �� IsCancel$
 True��6B   57      59      5:      