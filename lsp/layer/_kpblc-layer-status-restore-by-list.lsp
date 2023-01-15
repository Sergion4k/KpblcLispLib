(defun _kpblc-layer-status-restore-by-list (doc lst-names lst-status / layer prg_pos prg_msg) 
  ;|
  *    ������� �������������� ��������� �����
  *    ��������� ������:
    doc        ; ��������� �� �������������� ��������
    lst-names  ; ������ ���� �����, ��������� ������� ���� ������������. nil -> ��� ����
    lst-status ; ������ ��������� �����, ����������� _kpblc-layer-status-save-by-list. nil -> ������ �� ��������
  |;
  (setq doc        (if (not doc) 
                     *kpblc-adoc*
                     doc
                   ) ;_ end of if
        lst-status (mapcar (function (lambda (x) (cons (cons (vla-get-name (car x)) (car x)) (cdr x)))) 
                           (vl-remove-if (function (lambda (x) (vlax-erased-p (car x)))) lst-status)
                   ) ;_ end of mapcar
        lst-names  (cond 
                     ((not lst-names) (mapcar (function (lambda (x) (caar x))) lst-status))
                     (t
                      (vl-remove-if 
                        (function (lambda (x) (vlax-erased-p (vla-item (vla-get-layers *kpblc-adoc*) x))))
                        lst-names
                      ) ;_ end of vl-remove-if
                     )
                   ) ;_ end of cond
        lst-names  (vl-remove-if-not 
                     (function 
                       (lambda (x) (member (strcase x) (mapcar (function strcase) (mapcar (function caar) lst-status))))
                     ) ;_ end of function
                     lst-names
                   ) ;_ end of vl-remove-if-not
        prg_msg    "�������������� ��������� �����"
        prg_pos    0
  ) ;_ end of setq
  (_kpblc-error-catch 
    (function 
      (lambda () 
        (foreach item lst-names 
          (if 
            (and 
              (= (type (setq layer (vl-catch-all-apply (function (lambda () (vla-item (vla-get-layers doc) item)))))) 
                 'vla-object
              ) ;_ end of =
              (not (vlax-erased-p layer))
            ) ;_ end of and
            (foreach prop (cdr (_kpblc-list-assoc item (mapcar '(lambda (x) (cons (caar x) (cdr x))) lst-status))) 
              (vl-catch-all-apply (function (lambda () (vlax-put-property layer (car prop) (cdr prop)))))
            ) ;_ end of foreach
          ) ;_ end of if
        ) ;_ end of foreach
      ) ;_ end of lambda
    ) ;_ end of function
    nil
  ) ;_ end of _kpblc-error-catch
) ;_ end of defun
