   M S B A M L   `   `   `  ����J  FPerAsperaEditor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:PerAsperaEditor.UtilitiesPerAsperaEditor.Utilities  5      *    $PerAsperaEditor.Utilities.LoggerView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:PerAsperaEditor.Utilities     5      .��5	      ]� .+�5
   
   �� $��32��6   $	��Top=�6   ._�5      ��   �� Orientation$  
Horizontal=�6   $��Right=�62   $��Center=�6N   $	��4,0q�6i   .+�5      �� -   5        $��Clear��5      $	��1,0q�6)   $|�False��66   6H   d� 5      -   5         d�Name$ 
toggleInfo��5       d� 	IsChecked$
 TrueY�5      $
��Info��60   $	��1,0q�6?    � ToolTip$! Toggle Information Messages��6L   5   3   d� 5      -   5        $ toggleWarning��5      $
 TrueY�5      $��Warning��60   $	��1,0q�6B   $ Toggle Warning Messages��6O   5   6   d� 5      -   5        $ toggleError��5      $
 TrueY�5      $��Error��60   $	��1,0q�6@   $ Toggle Error Messages��6M   5   4   5      5      �� 5   
   -   5         ��Name$ scrollViewer��5   _   $
��Auto=�6   $
��Auto=�6:   .��5      �� ��6   �� &   PerAsperaEditor.Utilities.Logger   FilteredMessages �� Source# Z ��5      �� 5      .R�5      �� 5      ��5      �� 5       .R�5!      ]�  6$   �� *
Metadata+��5"      �� 5#   "    �� 
TargetType" ]�6(   .�5$   &   ��  �� Property � ��	 �� Value
	 ���� 6C   
 �� Triggers
 5%   &   P� 5&   *    P� Property �@J�IsMouseOver P� Value$
 True��6I   . �5'   .   ��  � ��
	 �����6K   5(   +   5*   #   .+�5-      �� $��5,0,5,0q�6Y   ��6(   �� *
DateTime+ �� StringFormat$ hh:mm:ss����5.   "   �� 5/   &   " ��6,   .�50   *   ��  � ��
	 ����6G   
 51   *   �� 52   .   +  %PerAsperaEditor.Utilities.MessageType   Warning �� Value# Z 6Z    �� Binding 6:   �� *MessageType+.a�53   2   ��  � ��
	 � ���6O   54   /   �� 55   .      Error# Z 6Z    6:   �� *MessageType+.a�56   2   ��  � ��
	 �  ��6O   57   /   59   '   5;      �� 5<      $
��Wrap=�6A   ��6(   �� *	Message+6A   5=      5>      5@      5B      5C      5D      