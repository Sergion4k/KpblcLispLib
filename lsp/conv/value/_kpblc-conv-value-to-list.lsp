(defun _kpblc-conv-value-to-list (value)
                                 ;|
  *    �������������� ����������� �������� � ������
  *    ��������� ������:
    value  ; ����������������� ��������
  *    ������������ ��������: ������
  *    ������� ������:
  (_kpblc-conv-value-to-list '(1 . 2))  ; '(1 . 2)
  (_kpblc-conv-value-to-list 1)    ; '(1)
  (_kpblc-conv-value-to-list '(2  5 3))  ; '(2 5 3)
  (_kpblc-conv-value-to-list '((2 5 3)))  ; '((2 5 3))
  |;
  (if (= (type value) 'list)
    value
    (list value)
  ) ;_ end of if
) ;_ end of defun
