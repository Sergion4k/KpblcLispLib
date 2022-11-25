(defun _kpblc-get-scale-current (lst / dict elist canno)
                                ;|
*    ����������� �������� ��� ���������� (dimscale  / cannoscale, max)
*    ��������� ������:
  lst   ; ���� �� �� ��� �� ������, ��������� �� �������.
*    ������� ������:
(_kpblc-get-scale-current nil)
|;
  (if (and (setq canno (getvar "cannoscale"))
           (= (type
                (setq dict (vl-catch-all-apply
                             (function (lambda () (vla-item (vla-get-dictionaries *kpblc-adoc*) "acad_scalelist")))
                             ) ;_ end of vl-catch-all-apply
                      ) ;_ end of setq
                ) ;_ end of type
              'vla-object
              ) ;_ end of =
           ) ;_ end of and
    (progn (setq elist (entget
                         (car
                           (vl-remove-if-not
                             (function (lambda (x) (= (cdr (assoc 300 (entget x))) canno)))
                             (mapcar (function cdr)
                                     (vl-remove-if-not (function (lambda (x) (= (car x) 350))) (entget (vlax-vla-object->ename dict)))
                                     ) ;_ end of mapcar
                             ) ;_ end of vl-remove-if-not
                           ) ;_ end of car
                         ) ;_ end of entget
                 ) ;_ end of setq
           (max (apply (function /) (mapcar (function (lambda (x) (cdr (assoc x elist)))) '(141 140)))
                (getvar "dimscale")
                ) ;_ end of max
           ) ;_ end of progn
    (getvar "dimscale")
    ) ;_ end of if
  ) ;_ end of defun
