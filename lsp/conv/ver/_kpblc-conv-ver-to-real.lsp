(defun _kpblc-conv-ver-to-real (lst)
                               ;|
*    ��������������� ���������� ������ � ����� �����
*    ��������� ������:
  lst  ��������:
    ������ ���� "Major.Minor.Assembly". ����������� �������� ���������� �� 0.
    ������ ���� '(Major Minor Assembly). ����������� �������� ���������� �� 0.
    ������ ���� '(("major" . <Major>) ("minor" . <Minor>) ("ass" . <Assembly>))
*    ������� ������:
_$ (_kpblc-conv-ver-to-real "0.5.9")
50009.0
_$ (_kpblc-conv-ver-to-real "1.5.9")
1.0005e+008
_$ (_kpblc-conv-ver-to-real ".6.9")
60009.0
|;
  (atof
    (apply (function strcat)
           (mapcar (function (lambda (x) (_kpblc-string-align (_kpblc-conv-value-to-string x) 4 "0" t)))
                   (_kpblc-conv-string-to-list lst ".")
           ) ;_ end of mapcar
    ) ;_ end of apply
  ) ;_ end of atof
) ;_ end of defun
