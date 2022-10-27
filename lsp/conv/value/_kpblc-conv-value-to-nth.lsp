(defun _kpblc-conv-value-to-nth (value lst)
                                ;|
  *    ��������������� ���������� �������� � ���������� ����� �������� � ������
  *    ��������� ������:
     value   ; ����������������� �������� (������ ��� �����)
     lst     ; ������, ������ �������� ���� �������������� ���������
  |;
  (cond ((and (= (type value) 'int) (< value (length lst))) value)
        ((and (= (type value) 'str)
              (= (_kpblc-conv-value-to-string (_kpblc-conv-value-to-int value)) value)
              (< (atoi value) (length lst))
         ) ;_ end of and
         (atoi value)
        )
        (t (vl-position value lst))
  ) ;_ end of cond
) ;_ end of defun
