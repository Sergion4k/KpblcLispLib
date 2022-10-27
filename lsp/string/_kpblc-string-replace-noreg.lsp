(defun _kpblc-string-replace-noreg (str old new / base lst pos res)
                                   ;|
  *    ������� ������ ��������� ��������� �� �����. ������������������
  *    ��������� ������:
    str  �������� ������
    old  ������ ������
    new  ����� ������
  *    ��������� ������ ����������� ������: "str" -> "'_str'"
  *    ������� ������:
  (_kpblc-string-replace-noreg "Lib-cad" "Lib" "##")           ; "##-cad" 
  (_kpblc-string-replace-noreg "test string test string string" "TEST" "$") ; "$ string $ string string"
  |;
  (setq pos 1)
  (foreach item
                (setq base (_kpblc-conv-string-to-list (strcase str) (strcase old))
                      base (mapcar (function (lambda (x) (cons x (strlen x)))) base)
                ) ;_ end of setq
    (setq res (cons (substr str pos (cdr item)) res)
          pos (+ pos (cdr item) (strlen old))
    ) ;_ end of setq
  ) ;_ end of foreach
  (_kpblc-conv-list-to-string (reverse res) new)
) ;_ end of defun
