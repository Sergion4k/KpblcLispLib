(defun _kpblc-list-remove-nth (lst n / lstn)
                              ;|
*    �������� �� ������ �������� �� ������
*    ��������� ������:
  lst   ; �������������� ������
  n     ; ����� �������� (��������� � 0)
*    ������� ������:
(_kpblc-list-remove-nth '(0 1 2 3 1 2 3) 2) ; '(0 1 3 1 2 3)
|;
  (setq n (1+ n))
  (mapcar (function (lambda (x)
                      (if (not (zerop (setq n (1- n))))
                        (setq lstn (cons x lstn))
                      ) ;_ end of if
                    ) ;_ end of lambda
          ) ;_ end of function
          lst
  ) ;_ end of mapcar
  (reverse lstn)
) ;_ end of defun
