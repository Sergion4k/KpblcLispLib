(defun _kpblc-dir-path-no-splash (path)
                                 ;|
*    ���������� ���� ��� ����� � �����
*    ��������� ������:
*  path  - �������������� ����
*    ������� ������:
(_kpblc-dir-path-no-splash "c:\\kpblc-cad\\")  ; "c:\\kpblc-cad"
|;
  (vl-string-right-trim "\\" path)
) ;_ end of defun
