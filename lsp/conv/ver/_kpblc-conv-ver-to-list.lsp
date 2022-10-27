(defun _kpblc-conv-ver-to-list (lst)
                               ;|
  *    ��������������� ���������� ������ � ������
  *    ��������� ������:
    lst  ��������:
      ������ ���� "Major.Minor.Assembly". ����������� �������� ���������� �� 0.
      ������ ���� '(Major Minor Assembly). ����������� �������� ���������� �� 0.
      ������ ���� '(("major" . <Major>) ("minor" . <Minor>) ("ass" . <Assembly>))
  *    ������� ������:
  _$ (_kpblc-conv-ver-to-list "0.2.6")
  (("major" . "0") ("minor" . "2") ("ass" . "6"))
  _$ (_kpblc-conv-ver-to-list ".6")
  (("major" . "0") ("minor" . "6") ("ass" . "0"))
  _$ (_kpblc-conv-ver-to-list "6")
  (("major" . "6") ("minor" . "0") ("ass" . "0"))
  _$ (_kpblc-conv-ver-to-list "..6")
  (("major" . "0") ("minor" . "0") ("ass" . "6"))
  |;
  (setq lst (_kpblc-conv-string-to-list (_kpblc-conv-ver-to-string lst) "."))
  (list (cons "major" (car lst)) (cons "minor" (cadr lst)) (cons "ass" (caddr lst)))
) ;_ end of defun
