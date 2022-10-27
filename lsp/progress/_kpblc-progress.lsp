(defun _kpblc-progress (ref-lst)
                       ;|
*    ������ ������� _kpblc-progress-continue
*    ��������� ������:
  ref-lst   ������ ����������, ������������ �� ������, ����
    '(("msg" . <��������� ��������-����>) ; nil -> "Long operation
      ("len" . <����� ����� ���������>)   ; nil -> 32565
      ("pos" . <������� �������>)         ; nil -> 0
      )
*    ��� ���������� pos �������� len ���� "���������" pos. �������� ���������� � ����������� ���������� ���������. ������� �������� �������������

*    ������ �������������:
(defun test (/ lst count)
  (setq lst   '(("msg" . "Test len")
                ("len" . 1000000000.)
                ("pos" . 0)
                )
        count 0
        ) ;_ end of setq
  (_kpblc-progress-start (cdr (assoc "msg" lst)) (cdr (assoc "len" lst)))
  (while (< count (cdr (assoc "len" lst)))
    (_kpblc-progress 'lst)
    (setq count (1+ count))
    ) ;_ end of while
  (_kpblc-progress-end)
  (princ)
  ) ;_ end of defun
|;
  (cond ((not (cdr (assoc "msg" (eval ref-lst))))
         (set ref-lst (_kpblc-list-add-or-subst (eval ref-lst) "msg" "Long operation"))
         (_kpblc-progress ref-lst)
        )
        ((not (cdr (assoc "len" (eval ref-lst))))
         (set ref-lst (_kpblc-list-add-or-subst (eval ref-lst) "len" 32565))
         (_kpblc-progress ref-lst)
        )
        ((not (cdr (assoc "pos" (eval ref-lst))))
         (set ref-lst (_kpblc-list-add-or-subst (eval ref-lst) "pos" 0))
         (_kpblc-progress ref-lst)
        )
        (t
         (if (> (1+ (cdr (assoc "pos" (eval ref-lst)))) (cdr (assoc "len" (eval ref-lst))))
           (set ref-lst (_kpblc-list-add-or-subst (eval ref-lst) "pos" 0))
         ) ;_ end of if
         (_kpblc-progress-continue (cdr (assoc "msg" (eval ref-lst))) (cdr (assoc "pos" (eval ref-lst))))
         (if mdelay
           (mdelay 1)
         ) ;_ end of if
         (set ref-lst
              (_kpblc-list-add-or-subst (eval ref-lst) "pos" (1+ (cdr (assoc "pos" (eval ref-lst)))))
         ) ;_ end of set
        )
  ) ;_ end of cond
) ;_ end of defun
