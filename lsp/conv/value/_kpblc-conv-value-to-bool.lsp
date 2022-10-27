(defun _kpblc-conv-value-to-bool (value)
                                 ;|
  *    ������� �������������� ����������� �������� � �������� t|nil. ��� ��������� �������� ���������� nil.
  *    ��������� ������:
    value  ; ����������������� ��������
  *    ������� ������:
  (_kpblc-conv-value-to-bool "0")   ; nil
  (_kpblc-conv-value-to-bool "1")  ; T
  (_kpblc-conv-value-to-bool "-1")  ; T
  |;
  (cond ((and (= (type value) 'str) (= (vl-string-trim " 0" value) "")) nil)
        ((and (= (type value) 'str)
              (member (strcase (vl-string-trim " 0\t" value)) '("NO" "���" "FALSE" ""))
         ) ;_ end of and
         nil
        )
        ((= (type value) 'vl-catch-all-apply-error) nil)
        (t (not (member value '(0 "0" nil :vlax-false))))
  ) ;_ end of cond
) ;_ end of defun
