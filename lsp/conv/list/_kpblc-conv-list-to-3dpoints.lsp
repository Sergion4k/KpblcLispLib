(defun _kpblc-conv-list-to-3dpoints (lst / res)
                                    ;|
  *    ������� ����������� ������ ����� � ������ 3-������ �����.
  *    ��������� ������:
    lst  ������ �����
  *    ������� ������:
  (_kpblc-conv-list-to-3dpoints '(1 2 3 4 5 6)) ;-> ((1 2 3) (4 5 6))
  (_kpblc-conv-list-to-3dpoints '(1 2 3 4 5))   ;-> ((1 2 3) (4 5 0.))
  |;
  (cond ((not lst) nil)
        (t
         (setq res (cons (list (car lst)
                               (cond ((cadr lst))
                                     (t 0.)
                               ) ;_ end of cond
                               (cond ((caddr lst))
                                     (t 0.)
                               ) ;_ end of cond
                         ) ;_ end of list
                         (_kpblc-conv-list-to-3dpoints (cdddr lst))
                   ) ;_ end of cons
         ) ;_ end of setq
        )
  ) ;_ end of cond
  res
) ;_ end of defun
