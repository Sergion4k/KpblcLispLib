(defun _kpblc-conv-value-to-int (value /)
                                ;|
  *    ����������� �������� � �����. ��� VLA-�������� ������������ nil.
  *    �������� ������ �� ��������������.
  |;
  (cond ((or (not value) (equal value :vlax-false)) 0)
        ((or (equal value t) (equal value :vlax-true)) 1)
        (t (atoi (_kpblc-conv-value-to-string value)))
  ) ;_ end of cond
) ;_ end of defun
