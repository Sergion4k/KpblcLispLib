(defun _kpblc-selset-msg (msg fun-ssget / sysvar res)
                         ;|
*    ������ �������� � ���������������� ������������
*    ��������� ������:
  msg    ��������� �����������
  fun-ssget ������� ������������ ������, ��� ssget
*    ������� ������:
(_kpblc-selset-msg "�������� ����������" (function (lambda() (ssget "_+.:S:E" '((0 . "CIRCLE"))))))
|;
  (setq sysvar (_kpblc-error-sysvar-save-by-list '(("sysmon" . 0) ("cmdecho" . 0) ("menuecho" . 0) ("nomutt" . 1))))
  (princ (strcat "\n" (vl-string-trim " \n\t:" msg) " <������> : "))
  (setq res (vl-catch-all-apply fun-ssget))
  (_kpblc-error-sysvar-restore-by-list sysvar)
  (if (= (type res) 'pickset)
    res
  ) ;_ end of if
) ;_ end of defun
