(defun _kpblc-ent-create-layer (name param-list / sub res tmp)
                               ;|
*    ������� �������� ���� �� ����� � ���.����������
*    ��������� ������:
  name         ; ��� ������������ ����
  param-list   ; ������ ������� ������������ ����
    '(("color" . <����>) ; ICA. nil -> 7. ��� ������� RGB ���� ���������� ������ Red Green Blue
      ("lineweight" . <���>); nil -> 9
      ("linetype" . <���>) ; nil -> "Continuous"
      ("linetypefile" . <����, ������ ������� �������� ����� �����>) ; nil -> acadiso.lin
      ("description" . <��������>) ; nil -> �� �������� ��� ������������� ��� "" ��� ������ ����
      ("where" . <��������� �� ��������, � ������� ���� ��������� ����>) ; nil -> ������� ��������
      ("noplot" . <�������� ��� ���>) ; nil -> ���� ����� ����������
      ("update" . <��������� ��������� ����>) ; nil -> ���� ���� ����������, �� ����� �������� "��� ����". t -> ��������� ���� ����� ��������� � ���������� � param-list
      )
*    ������� ������:
(_kpblc-ent-create-layer "qwer" nil)
(_kpblc-ent-create-layer "qwer1" '(("color" . 8)))
(_kpblc-ent-create-layer "qwer2" '(("color" 120 80 30)))
(_kpblc-ent-create-layer "qwer2" '(("color" 120 80 50) ("update" . t)))
|;
  (if (and name (= (type name) 'str))
    (progn

      (foreach elem (list '("color" . 7)
                          '("lineweight" . 9)
                          '("linetype" . "Continuous")
                          '("linetypefile" . "acadiso.lin")
                          (cons "where" *kpblc-adoc*)
                    ) ;_ end of list
        (if (not (cdr (assoc (car elem) param-list)))
          (setq param-list (cons elem param-list))
        ) ;_ end of if
      ) ;_ end of foreach

      (if (/= (type (vl-catch-all-apply
                      (function (lambda () (vla-item (vla-get-layers (cdr (assoc "where" param-list))) name)))
                    ) ;_ end of vl-catch-all-apply
              ) ;_ end of type
              'vla-object
          ) ;_ end of /=
        (setq param-list (_kpblc-list-add-or-subst param-list "update" t))
      ) ;_ end of if


      (_kpblc-error-catch
        (function
          (lambda ()

            (setq res (vla-add (vla-get-layers (cdr (assoc "where" param-list))) name))

            (if (cdr (assoc "update" param-list))
              (progn
                (if (= (type (cdr (assoc "color" param-list))) 'list)
                  (apply (function _kpblc-ent-modify-truecolor-set)
                         (cons res (cdr (assoc "color" param-list)))
                  ) ;_ end of apply
                  (vla-put-color res (max 1 (_kpblc-conv-value-to-int (cdr (assoc "color" param-list)))))
                ) ;_ end of if
                (vla-put-lineweight res (cdr (assoc "lineweight" param-list)))
                (vla-put-linetype
                  res
                  (_kpblc-linetype-load
                    (cdr (assoc "where" param-list))
                    (cdr (assoc "linetype" param-list))
                    (cdr (assoc "linetypefile" param-list))
                  ) ;_ end of _kpblc-linetype-load
                ) ;_ end of vla-put-linetype
                (vla-put-plottable res (_kpblc-conv-value-bool-to-vla (not (cdr (assoc "noplot" param-list)))))
                (if (cdr (assoc "description" param-list))
                  (vla-put-description res (cdr (assoc "description" param-list)))
                ) ;_ end of if
              ) ;_ end of progn
            ) ;_ end of if
            res
          ) ;_ end of lambda
        ) ;_ end of function
        '(lambda (x)
           (_kpblc-error-print (strcat "�������� ���� " name) x)
           (if res
             (vl-catch-all-apply (function (lambda () (vla-delete res))))
           ) ;_ end of if
           (setq res nil)
         ) ;_ end of lambda
      ) ;_ end of _kpblc-error-catch
    ) ;_ end of progn
  ) ;_ end of if
  res
) ;_ end of defun
