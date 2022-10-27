(defun _kpblc-html-create-head-for-doc (title)
                                       ;|
*    ��������� ������ ��� ��������� ���� html-���������
*    ��������� ������:
  title  ; �������� ���� html-��������
*    ������� ������:
(_kpblc-html-create-head-for-doc "��������� �� UNI-������")
|;
  (append '("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">" "<html>" "<head>"
            "<meta content=\"text/html; charset=Windows-1251\"" "http-equiv=\"content-type\">"
           )
          (list (strcat "<title>" title "</title>"))
          (cdr (assoc "html" (vl-bb-ref '*kpblc-settings*)))
          '("</head>")
  ) ;_ end of append
) ;_ end of defun
