(defun _kpblc-strcase (str)
                      ;|
*    ��������� ������ � ������ �������
*    ��������� ������:
  str    �������������� ������
*    ������� ������:
(_kpblc-strcase "������") ; "������"
|;
  (strcase (vl-string-translate "�����Ũ��������������������������" "��������������������������������" str)
           t
  ) ;_ end of strcase
) ;_ end of defun
