(defun _kpblc-error-sysvar-save-by-list (lst / res)
                                        ;|
  *    ���������� ��������� ��������� ���������� ��� ���������. ��������
  * ������������� ���������
  *    ��������� ������:
    lst  ������ ��������� ���������� ����
        '((<sysvar> . <value>) <...>)
  *    ���������� ������ �� ������� (�� �������� ����)
  |;
  (vl-remove nil
             (mapcar (function (lambda (x / tmp)
                                 (if (setq tmp (getvar (car x)))
                                   (progn (if (cdr x)
                                            (setvar (car x) (cdr x))
                                          ) ;_ end of if
                                          (cons (car x) tmp)
                                   ) ;_ end of progn
                                 ) ;_ end of if
                               ) ;_ end of lambda
                     ) ;_ end of function
                     lst
             ) ;_ end of mapcar
  ) ;_ end of vl-remove
) ;_ end of defun
