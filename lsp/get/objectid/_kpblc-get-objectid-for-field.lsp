(defun _kpblc-get-objectid-for-field (obj / str)
                                     ;|
*    ��������� ���������� ������������� ������� ��� ������������� � �����. �������� ������ � ������� ���������
*    ��������� ������:
  obj  ; ��������� �� ������
*    ������� ������:
(_kpblc-get-objectid-for-field (car (entsel)))
|;
  (if (and (setq obj (_kpblc-conv-ent-to-ename obj))
           (setq str (cadr (_kpblc-conv-string-to-list (vl-princ-to-string obj) ":")))
      ) ;_ end of and
    (vl-string-trim ":<>" str)
  ) ;_ end of if
) ;_ end of defun
