(defun _kpblc-error-sysvar-restore-by-list (lst)
                                           ;|
  *    �������������� ��������� ��������� ����������.
  *    ��������� ������:
    lst  ������ ��������� ����������, �������� ������� ����
      �������������� ����:
        '((<sysvar> . <value>) <...>)
  |;
  (foreach item (_kpblc-conv-list-to-list lst)
    (if (getvar (car item))
      (setvar (car item) (cadr item))
    ) ;_ end of if
  ) ;_ end of foreach
) ;_ end of defun
