(defun _kpblc-string-replace (str old new)
                             ;|
*    ������� ������ ��������� ��������� �� �����. ������������������
*    ��������� ������:
  str  �������� ������
  old  ������ ������
  new  ����� ������
*    ��������� ������ ����������� ������: "str" -> "'_str'"
|;
  (_kpblc-conv-list-to-string (_kpblc-conv-string-to-list str old) new)
) ;_ end of defun
