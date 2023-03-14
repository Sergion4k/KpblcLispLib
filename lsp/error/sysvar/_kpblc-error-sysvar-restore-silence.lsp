(defun _kpblc-error-sysvar-restore-silence (sysvar-list silence)
                                           ;|
  *    ��������������� "���������������" *Cad
  *    ��������� ������:
    sysvar-list  ; ������ ����������������� ��������� ����������
    silence      ; ��������� _kpblc-error-sysvar-set-silence
  |;
  (if silence
    (foreach sysvar (vl-remove-if
                      (function
                        (lambda (x)
                          (member (car x) (mapcar (function car) sysvar-list))
                        ) ;_ end of lambda
                      ) ;_ end of function
                      silence
                    ) ;_ end of vl-remove-if
      (setvar (car sysvar) (cdr sysvar))
    ) ;_ end of foreach
  ) ;_ end of if
) ;_ end of defun
