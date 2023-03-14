(defun _kpblc-error-sysvar-set-silence ()
                                        ;|
  *    ��� ������� ���������� � nanoCAD "�����" ����� � ���.������
  *    ���������� ������ ����������, ������� ����������� ��������������� ������������
  |;
  (if (_kpblc-is-app-ncad)
    (mapcar
      (function
        (lambda (x / temp)
          (setq temp (getvar (car x)))
          (setvar (car x) (cdr x))
          (cons (car x) temp)
        ) ;_ end of lambda
      ) ;_ end of function
      '(("cmdecho" . 0) ("nomutt" . 1))
    ) ;_ end of mapcar
  ) ;_ end of if
) ;_ end of defun
