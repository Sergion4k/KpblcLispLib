(defun _kpblc-acad-audit (/ _layer_status sysvar) 
  ;|
  *    ������ ������ �������� ���������, ��������� ������� ���������������� "dimpost". ������������ ������ vla-auditinfo.
  * ��������� ��� ���������� ������� ������ ACAD (�� ������� ���� � 2020 ������ ���� ��� ��� ���������)
  *    ��������� ������:
    ���
  *    ������� ������:
  (_kpblc-acad-audit)
  |;
  (setq sysvar (_kpblc-error-sysvar-save-by-list '(("dimpost" . ""))))
  (setq _layer_status (_kpblc-layer-status-save-by-list *kpblc-adoc* nil '(("thaw" . t) ("unlock" . t))))
  (vla-auditinfo *kpblc-adoc* :vlax-true)
  (_kpblc-error-sysvar-restore-by-list sysvar)
  (_kpblc-layer-status-restore-by-list *kpblc-adoc* nil _layer_status)
) ;_ end of defun
