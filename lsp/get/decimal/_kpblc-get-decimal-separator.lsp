(defun _kpblc-get-decimal-separator ()
                                    ;|
	*    ���������� ������������� � ������� ����������� ����� � ������� �����
	|;
  (vl-registry-read "HKEY_CURRENT_USER\\Control panel\\International" "sDecimal")
) ;_ end of defun
