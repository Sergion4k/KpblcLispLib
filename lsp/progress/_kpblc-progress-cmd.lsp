(defun _kpblc-progress-cmd (msg pos / lst)
                           ;|
*    ������� � ���.������ ��������� � "����������"
*    ��������� ������:
  msg    ��������� ���������
  pos    ������� ����������� ��������
|;
  (if msg
    (princ (strcat "\r" msg " : " (nth (rem pos 4) '("-" "\\" "|" "/"))))
    (princ (strcat "\r" (nth (rem pos 4) '("-" "\\" "|" "/"))))
  ) ;_ end of if
) ;_ end of defun
