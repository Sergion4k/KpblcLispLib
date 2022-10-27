(defun _kpblc-get-number-as-real-from-string (value)
  ;|
  *    ��������� ����� ������� �������� �� ������
  *    ��������� ������:
    value   ; �������������� ������ / ��������
  *    ������� ������:
  (_kpblc-get-number-as-real-from-string "asdf34.56asdf")    ; 34.56
  (_kpblc-get-number-as-real-from-string "asdf12334,56asdf") ; 12334.56
  |;
  (_kpblc-conv-value-to-real (_kpblc-get-number-as-string-from-string value))
  ) ;_ end of defun
