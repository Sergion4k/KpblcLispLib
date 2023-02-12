(defun _kpblc-block-insert-low-level (block-name lst / res x y z ang msg_pt msg_ang do_insert ins_point tmp_angle tmp_block unnamed_block cur_layer is_attr
                                      fun_subst exp_block put_point sysvar_lst sysvar lastent
                                     )
                                     ;|
*    ������������� ������� ����� �� ��������� ����������. �������� ����� ���
* ������ ���� ���������� � �����.
*    ��������� ������:
  block-name  ; ��� �����
  lst         ; ������ ������ ����:
      '(("pt" . <������������>)    ; ����� ������� �����. nil -> ������������ �������������
        ("msg_pt" . "����� �������")  ; ����������� ��� ����������� ����� �������. �� ������������, ���� ����� ���������� �������.
                                      ; nil -> "������� ����� ������� <������> : "
        ("msg_ang" . "���� ��������")  ; ����������� ��� ����������� ���� �������. nil -> "������� ���� �������� <0.0> : "
        ("x" . 1.)      ; ������� �� ��� �. nil -> 1.
        ("y" . 1.)      ; ������� �� ��� Y. nil -> ����� � x
        ("z" . 1.)      ; ������� �� Z. nil -> ����� � x
        ("ang" . 0.)      ; ���� �������� �����. nil -> ������������ ������������� ����� �������.
        ("multi" . t)      ; ��������� ���� ��� (nil ���� �������) ��� ��������� (t).
                           ; ����������� ������ ��� �������������� ��������� "pt".
        ("where" . <���� ���������>)  ; vla-��������� �� ������������, ���� ���������. nil -> �������� ������������
        ("layer" . <�������>)    ; ��� ����, � ������� ����������� ����. nil -> �������. ���� ��� ������������� ���������.
        ("attrot" . t)      ; ������������ ��� ��� ������ �� ������ ��������. nil -> �� ������������
                            ; t -> ������������� ���� ��������� ��������� ��� � �������� �����
        )
*    �������������� ����������: ��������� msg_pt, msg_ang ����������� ������ ���� "where" = �������� ������������.
* �������� msg_pt �� �����������, ���� ����� pt. � ��������� ������ ang = 0. � ��������� ���� �������� ����� �� �����������.
*    ������� ������:
(_kpblc-block-insert-low-level "���32-16" (list (cons "multi" t) (cons "x" 1.)))
|;
  (defun fun_subst (lst-new lst-old)
    ;; lst-new - ������ ����� �������� ���
    ;; lst-old - �������������� ������
    (vl-remove-if-not
      (function (lambda (a) (cdr a)))
      (append (vl-remove-if (function (lambda (x) (cdr (assoc (car x) lst-new)))) lst-old) lst-new)
    ) ;_ end of vl-remove-if-not
  ) ;_ end of defun
  (setq x       (cond ((cdr (assoc "x" lst)))
                      (t 1.)
                ) ;_ end of cond
        y       (cond ((cdr (assoc "y" lst)))
                      (t x)
                ) ;_ end of cond
        z       (cond ((cdr (assoc "z" lst)))
                      (t x)
                ) ;_ end of cond
        ang     (cond ((cdr (assoc "ang" lst)))
                      (t 0.)
                      ;; ��� ����� ���� ������������� �� 0 �������� - ���
                      ;; ���������� �� ��������� �������.
                ) ;_ end of cond
        msg_pt  (cond ((cdr (assoc "msg_pt" lst)))
                      (t "������� ����� ������� <������> : ")
                ) ;_ end of cond
        msg_ang (cond ((cdr (assoc "msg_ang" lst)))
                      (t "������� ���� �������� <0.0> : ")
                ) ;_ end of cond
  ) ;_ end of setq
  (if (cdr (assoc "pt" lst))
    (progn
      (_kpblc-error-catch
        (function
          (lambda ()
            (setq res (vla-insertblock
                        (cond ((cdr (assoc "where" lst)))
                              (t (_kpblc-get-active-space-obj nil))
                        ) ;_ end of cond
                        (vlax-3d-point (cdr (assoc "pt" lst)))
                        block-name
                        x
                        y
                        z
                        ang
                      ) ;_ end of vla-insertblock
            ) ;_ end of setq
            (if (and (not (cdr (assoc "where" lst))) (not (cdr (assoc "ang" lst))))
              (progn (princ msg_ang) (vl-cmdf "_.change" (vlax-vla-object->ename res) "" "" "" pause))
            ) ;_ end of if
            (setq res (list res))
          ) ;_ end of lambda
        ) ;_ end of function
        (function (lambda (x) (_kpblc-error-print "_kpblc-block-insert-low-level" x)))
      ) ;_ end of _kpblc-error-catch
    ) ;_ end of progn
    ;; ����� ������� �� ������. ����� �� ���, ���������� _.change: _.insert ����� ���� �����
    (progn (setq do_insert t
                 ins_point (trans (list (- (* 2. (car (getvar "VSMIN")))) (- (* 2. (cadr (getvar "VSMIN")))) 0.0) 0 1)
                           ;;  unnamed_block (vla-add (vla-get-blocks *kpblc-adoc*) (vlax-3d-point '(0. 0. 0.)) "*U")
           ) ;_ end of setq
           (while do_insert
             (setq tmp_block (handent (vla-get-handle
                                        (vla-insertblock
                                          (_kpblc-get-active-space-obj *kpblc-adoc*)
                                          (vlax-3d-point ins_point)
                                          block-name
                                          x
                                          y
                                          z
                                          ang
                                        ) ;_ end of car
                                      ) ;_ end of vla-get-handle
                             ) ;_ end of handent
             ) ;_ end of setq
             (princ (strcat "\n" (vl-string-trim "\n" msg_pt)))
             (_kpblc-cmd-silence (list "_.change" tmp_block "" "" pause ""))
             (if (setq do_insert (not (equal (setq put_point (trans (cdr (assoc 10 (entget tmp_block))) tmp_block 0)) ins_point 1e-3)
                                 ) ;_ end of not
                 ) ;_ end of setq
               (progn (if (not (cdr (assoc "ang" lst)))
                        (progn (princ msg_ang) (_kpblc-cmd-silence (list "_.change" tmp_block "" "" "" pause)))
                      ) ;_ end of if
                      (if do_insert
                        (progn (if (and (= (getvar "attreq") 1) is_attr)
                                 (command "_.ddatte" (entlast))
                               ) ;_ end of if
                               (setq res (append res (list (vlax-ename->vla-object (entlast)))))
                        ) ;_ end of progn
                      ) ;_ end of if
               ) ;_ end of progn
               (vla-erase (_kpblc-conv-ent-to-vla tmp_block))
             ) ;_ end of if
             ;; (entdel tmp_block)
             (setq do_insert (and do_insert (cdr (assoc "multi" lst))))
           ) ;_ end of while
    ) ;_ end of progn
  ) ;_ end of if
  (foreach item res
    (mapcar
      (function
        (lambda (att)
          ;; ������������ ����� �������
          (mapcar (function
                    (lambda (prop)
                      (vl-catch-all-apply
                        (function
                          (lambda (/)
                            (vlax-put-property
                              att
                              prop
                              (vlax-3d-point
                                (trans (vlax-safearray->list (vlax-variant-value (vlax-get-property att prop)))
                                       (vlax-safearray->list
                                         (vlax-variant-value
                                           (vla-get-normal
                                             (cond ((car
                                                      (vl-remove-if-not
                                                        (function (lambda (x)
                                                                    (and (wcmatch (strcase (vla-get-objectname x)) "*ATTRIB*")
                                                                         (= (strcase (vla-get-tagstring x)) (strcase (vla-get-tagstring att)))
                                                                    ) ;_ end of and
                                                                  ) ;_ end of lambda
                                                        ) ;_ end of function
                                                        (_kpblc-conv-vla-to-list (vla-item (vla-get-blocks *kpblc-adoc*) (vla-get-name item)))
                                                      ) ;_ end of vl-remove-if-not
                                                    ) ;_ end of car
                                                   )
                                                   (t item)
                                             ) ;_ end of cond
                                           ) ;_ end of vla-get-normal
                                         ) ;_ end of vlax-variant-value
                                       ) ;_ end of vlax-safearray->list
                                       (_kpblc-conv-vla-to-list (vla-get-normal item))
                                ) ;_ end of trans
                              ) ;_ end of vlax-3d-point
                            ) ;_ end of vlax-put-property
                          ) ;_ end of lambda
                        ) ;_ end of function
                      ) ;_ end of vl-catch-all-apply
                    ) ;_ end of lambda
                  ) ;_ end of function
                  '("insertionpoint" "textalignmentpoint")
          ) ;_ end of mapcar
          (vla-put-normal att (vla-get-normal item))
        ) ;_ end of lambda
      ) ;_ end of function
      (_kpblc-block-attr-get-pointer-mask item "*")
    ) ;_ end of mapcar
  ) ;_ end of foreach
  res
) ;_ end of defun