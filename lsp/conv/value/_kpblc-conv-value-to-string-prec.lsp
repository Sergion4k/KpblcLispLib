(defun _kpblc-conv-value-to-string-prec (value prec)
                                        ;|
  *    ��������������� �������� � ������, �������� 0 � ����� �� ��������� ��������.
  *    ��������� ������:
    value  ; ����������������� ��������. nil -> ��������� = ""
    prec   ; ����������� ��������. nil -> ��������� ����� ��� ��� prec = 1 (���������� �� �����). 0.1 - ���������� �� �������, 100  - ���������� �� �����
  *    � ��������� ��������� ������� ������� _kpblc-conv-value-to-string
  *    ������� ������:
  (_kpblc-conv-value-to-string-prec 938.852 0.1)   ; 938.9
  (_kpblc-conv-value-to-string-prec "938.852" 0.1) ; "938.9"
  (_kpblc-conv-value-to-string-prec " a938.852" 0.1) ; "0.0"
  (_kpblc-conv-value-to-string-prec 939 0.1)       ; "939.0"
  (_kpblc-conv-value-to-string-prec 939 0.001)     ; "939.000"
  (_kpblc-conv-value-to-string-prec 939.565665 0.001) ; "939.566"
  |;
  (if prec
    (cond ((= (type value) 'str) (_kpblc-conv-value-to-string-prec (atof value) prec))
          ((= (type value) 'int) (_kpblc-conv-value-to-string-prec (atof (itoa value)) prec))
          ((= (type value) 'real)
           (setq value (vl-princ-to-string (_kpblc-eval-value-round value prec)))
           (if (< prec 1.)
             (_kpblc-string-align
               value
               (+ (strlen (itoa (atoi value))) (strlen (itoa (fix (/ 1. prec)))))
               "0"
               nil
             ) ;_ end of _kpblc-string-align
             value
           ) ;_ end of if
          )
          ((not value) "")
          (t (vl-princ-to-string value))
    ) ;_ end of cond
    (_kpblc-conv-value-to-string-prec value 0)
  ) ;_ end of if
) ;_ end of defun
