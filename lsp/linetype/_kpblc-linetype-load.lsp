(defun _kpblc-linetype-load (doc ltype-name ltype-file / ltype_normal ltype_list result)
                            ;|
*    ������� ��������� ���� ����� � ����. ��������� ���������
* ����������� �������.
*    ��������� ������:
  doc          ��������� �� ��������, ��� �������� ��������� ���������. nil -> �������
  ltype-name  ��� ���� ����� ��� ���������� ������
  ltype-file  ��� ����� �������� ���� �����. nil -> "acadiso.lin"�
*      ���� ���� � ��������� ���� ����� �� ����� �� �����
*      ��������� ����, ���� ��������� ������ ���� � ����.
*    ������� ������:
(_kpblc-linetype-load *kpblc-adoc* "center" nil)  ; ��� ������� ������ ���������� ������ � ����������
                                     ; t ��� ������
***  ��� ����� "Continuous" ��������� �� ������������ � �� ���� �� ���� �������
|;
  (if ltype-name
    (progn (setq ltype_list (_kpblc-get-linetype-list)
                 ltype-name (_kpblc-strcase ltype-name)
                 ) ;_ end of setq
           (if (not doc)
             (setq doc *kpblc-adoc*)
             ) ;_ end of if
           (if (or (not ltype-file) (not (findfile ltype-file)))
             (setq ltype-file "acadiso.lin")
             ) ;_ end of if
           (setq ltype_normal (cond ((not (vl-catch-all-apply (function (lambda () (vla-item (vla-get-linetypes doc) ltype-name)))))
                                     ltype-name
                                     )
                                    ((and (vl-string-search "419" (vlax-product-key))
                                          (member ltype-name (mapcar (function car) ltype_list))
                                          ) ;_ end of and
                                     (cdr (assoc ltype-name ltype_list))
                                     )
                                    ((and (vl-string-search "419" (vlax-product-key))
                                          (member ltype-name (mapcar (function cdr) ltype_list))
                                          ) ;_ end of and
                                     ltype_normal
                                     )
                                    (t ltype-name)
                                    ) ;_ end of cond
                 result       (cond ((or (not (vl-catch-all-error-p
                                                (vl-catch-all-apply (function (lambda () (vla-item (vla-get-linetypes doc) ltype_normal))))
                                                ) ;_ end of vl-catch-all-error-p
                                              ) ;_ end of not
                                         (not (vl-catch-all-error-p
                                                (vl-catch-all-apply
                                                  (function (lambda () (vla-load (vla-get-linetypes doc) ltype_normal ltype-file)))
                                                  ) ;_ end of vl-catch-all-apply
                                                ) ;_ end of vl-catch-all-error-p
                                              ) ;_ end of not
                                         ) ;_ end of or
                                     ltype_normal
                                     )
                                    (t "Continuous")
                                    ) ;_ end of cond
                 ) ;_ end of setq
           ) ;_ end of progn
    (setq result "Continuous")
    ) ;_ end of if
  result
  ) ;_ end of defun
