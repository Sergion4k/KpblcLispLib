(defun _kpblc-get-path-menu-local ()
                                  ;|
  *    ��������� (�� �� �������!) ������� ��������� ����� ��������� ����
  |;
  (strcat (_kpblc-get-path-application)
          "\\menu\\"
          (_kpblc-acad-version-with-bit-and-loc)
          "\\"
          (_kpblc-get-profile-name)
  ) ;_ end of strcat
) ;_ end of defun
