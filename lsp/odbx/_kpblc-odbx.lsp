(defun _kpblc-odbx (/)
                   ;|
*    ������� ���������� ��������� IAxDbDocument (��� ������ � ������� DWG ��� �� ��������). ���� ��������� �� ��������������, ���������� nil.
*    ����� - Fatty aka ���� jr. ����� ������ ��������� ��� ����� ������� � ��������������
*    ������� ������:
(_kpblc-odbx)
|;
  (vla-getinterfaceobject
    (vlax-get-acad-object)
    (strcat "ObjectDBX.AxDbDocument." (itoa (atoi (getvar "acadver"))))
  ) ;_ end of vla-getinterfaceobject
) ;_ end of defun
