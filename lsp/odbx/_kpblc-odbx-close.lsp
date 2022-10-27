(defun _kpblc-odbx-close (conn)
                         ;|
*    �������� �����, ��������� ����� ����� _kpblc-odbx-*. � �������� ����������
*    ��������� ������:
  conn  ; ���������� � ObjectDBX, ��������� ����� ����� (_kpblc-odbx) ���� ������:
    '(("conn" . <ObjectDBXConnection>)  ; �� �� �����
      ("save" . t)      ; ��������� ��� ��� ���������
      ("file" . "c:\\temp\\tmp.dwg")  ; ���, ��� ������� ���������. nil -> ������������ �������
      )
*    ������ ������:
(setq doc (_kpblc-odbx-open "c:\\file.dwg" (setq conn (_kpblc-odbx))))
(_kpblc-odbx-close (cdr(assoc"conn" doc)))
(_kpblc-odbx-close doc)
|;
  (if (and (= (type conn) 'list) (cdr (assoc "save" conn)))
    (progn (vlax-invoke
             (cond ((cdr (assoc "conn" conn)))
                   (t (cdr (assoc "obj" conn)))
             ) ;_ end of cond
             'saveas
             (cond ((cdr (assoc "file" conn))
                    (strcat (_kpblc-dir-path-and-splash
                              (vl-filename-directory
                                (cond ((cdr (assoc "file" conn)))
                                      ((cdr (assoc "name" conn)))
                                ) ;_ end of cond
                              ) ;_ end of vl-filename-directory
                            ) ;_ end of _kpblc-dir-path-and-splash
                            (vl-filename-base
                              (cond ((cdr (assoc "file" conn)))
                                    ((cdr (assoc "name" conn)))
                              ) ;_ end of cond
                            ) ;_ end of vl-filename-base
                            ".dwg"
                    ) ;_ end of strcat
                   )
                   (t
                    (vla-get-name
                      (cond ((cdr (assoc "conn" conn)))
                            (t (cdr (assoc "obj" conn)))
                      ) ;_ end of cond
                    ) ;_ end of vla-get-name
                   )
             ) ;_ end of cond
           ) ;_ end of vlax-invoke
    ) ;_ end of progn
  ) ;_ end of if
  (vl-catch-all-apply
    '(lambda ()
       (vlax-release-object
         (if (= (type conn) 'list)
           (cond ((cdr (assoc "conn" conn)))
                 (t (cdr (assoc "obj" conn)))
           ) ;_ end of cond
           conn
         ) ;_ end of if
       ) ;_ end of vlax-release-object
     ) ;_ end of lambda
  ) ;_ end of vl-catch-all-apply
  (setq conn nil)
) ;_ end of defun
