(defun _kpblc-get-interface-color ()
                                  ;|
	*    ���������� ��������� �� ������ ��������� ������
	|;
  (vla-getinterfaceobject *kpblc-acad* (strcat "AutoCAD.AcCmColor." (itoa (atoi (getvar "acadver")))))
) ;_ end of defun
