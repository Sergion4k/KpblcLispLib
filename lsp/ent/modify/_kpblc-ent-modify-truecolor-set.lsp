(defun _kpblc-ent-modify-truecolor-set (ent red green blue / res color)
                                       ;|
  *    ������������� ��� ��������� TrueColor.
  *    ��������� ������:
    ent    ; ��������� �� �������������� ��������. �������� ������ ���� �������� ��� ��������� � �� ������
    red    ; Red ��� RGB. nil -> 0
    green  ; Green ��� RGB. nil -> 0
    blue   ; Blue ��� RGB. nil -> 0
  *    ���������� ename-��������� �� �������� ���� nil � ������ ������
  *    ������� ������:
  (_kpblc-ent-modify-truecolor-set (car (entsel)) 10 20 30)
  |;
  (_kpblc-error-catch
    (function
      (lambda ()
        (setq res (_kpblc-ent-modify ent 420 (_kpblc-conv-color-rgb-to-true red green blue)))
      ) ;_ end of lambda
    ) ;_ end of function
    '(lambda (x)
       nil
     ) ;_ end of lambda
  ) ;_ end of _kpblc-error-catch
) ;_ end of defun
