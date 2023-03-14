(defun _kpblc-error-sysvar-save-by-list (sysvar-list / res silence)
                                        ;|
  *    ���������� ��������� ��������� ���������� ��� ���������. ��������
  * ������������� ���������
  *    ��������� ������:
    sysvar-list  ������ ��������� ���������� ����
        '((<sysvar> . <value>) <...>)
  *    ���������� ������ �� ��� (<����������> . <��������� ��������>)
  |;

  (setq silence (_kpblc-error-sysvar-set-silence))

  (setq res (vl-remove nil
                       (mapcar (function (lambda (x / tmp)
                                           (if (setq tmp (getvar (car x)))
                                             (progn (if (cdr x)
                                                      (setvar (car x) (cdr x))
                                                    ) ;_ end of if
                                                    (cons (strcase (car x) t) tmp)
                                             ) ;_ end of progn
                                           ) ;_ end of if
                                         ) ;_ end of lambda
                               ) ;_ end of function
                               sysvar-list
                       ) ;_ end of mapcar
            ) ;_ end of vl-remove
  ) ;_ end of setq

  (_kpblc-error-sysvar-restore-silence sysvar-list silence)

  res

) ;_ end of defun
