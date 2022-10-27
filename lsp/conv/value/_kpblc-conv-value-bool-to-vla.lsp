(defun _kpblc-conv-value-bool-to-vla (value)
                                     ;|
  *    ������� ����������� ����������� �������� � :vlax-true ���� :vlax-false
  *    ��������� ������:
    value  ; �������������� ��������
  *    ������� ������:
  (_kpblc-conv-value-bool-to-vla "n")
  (_kpblc-conv-value-bool-to-vla -1)
  |;
  (cond ((= (type value) 'str)
         (if (or (member (strcase (substr value 1 1) t) '("n" "�" "0")) (member (strcase value t) '("false")))
           :vlax-false
           :vlax-true
         ) ;_ end of if
        )
        (t
         (if (member value '(nil 0. 0 :vlax-false))
           :vlax-false
           :vlax-true
         ) ;_ end of if
        )
  ) ;_ end of cond
) ;_ end of defun
