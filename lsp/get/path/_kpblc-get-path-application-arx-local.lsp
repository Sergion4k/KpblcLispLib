(defun _kpblc-get-path-application-arx-local ()
                                             ;|
  *    ���������� � ������� ���� ���������� �������� arx-������
  |;
  (_kpblc-dir-create
    (strcat (_kpblc-dir-path-no-splash (_kpblc-get-path-application))
            "\\arx\\"
            (_kpblc-acad-version-with-bit)
    ) ;_ end of strcat
  ) ;_ end of _kpblc-dir-create
) ;_ end of defun
