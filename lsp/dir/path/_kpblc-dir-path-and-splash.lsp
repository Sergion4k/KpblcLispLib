(defun _kpblc-dir-path-and-splash (path)
                                  ;|
*    ���������� ���� �� ������ � �����
*    ��������� ������:
*  path  - �������������� ����
*    ������� ������:
(_kpblc-dir-path-and-splash "c:\\kpblc-cad")  ; "c:\\kpblc-cad\\"
|;
  (strcat (vl-string-right-trim "\\" path) "\\")
) ;_ end of defun
