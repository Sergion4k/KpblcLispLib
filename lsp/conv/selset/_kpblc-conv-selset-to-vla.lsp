(defun _kpblc-conv-selset-to-vla (selset)
                                 ;|
  *    �������������� ������ ���������� � ������ vla-������������� ����������
  *    ��������� ������:
    selset  ; �����, �������������� (ssget)
  |;
  (mapcar (function _kpblc-conv-ent-to-vla) (_kpblc-conv-selset-to-ename selset))
) ;_ end of defun
