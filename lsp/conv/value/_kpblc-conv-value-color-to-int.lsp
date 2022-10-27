(defun _kpblc-conv-value-color-to-int (color)
                                      ;|
  *    ������� �������������� ����������� �������� ����� � integer ���
  * ��������� ������.
  *    ��������� ������:
    color  ; �������������� ����. nil -> "bylayer"
  |;
  (cond ((not color) (_kpblc-conv-value-color-to-int "bylayer"))
        ((= (type color) 'str)
         (cond ((= (strcase color t) "bylayer") 256)
               ((= (strcase color t) "byblock") 0)
               (t (_kpblc-conv-value-color-to-int "bylayer"))
         ) ;_ end of cond
        )
        (t color)
  ) ;_ end of cond
) ;_ end of defun
