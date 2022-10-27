(defun _kpblc-is-ent-block-ref
                               (ent / name)
                               ;|
*    ���������, �������� �� ���������� �������� ������ (� ��� ���� �� ������� ������)
*    ��������� ������:
  ent    ��������� �� ������������� ��������
|;
  (and (setq ent (_kpblc-conv-ent-to-vla ent))
       (wcmatch (strcase (vla-get-objectname ent)) "*BLOCKREF*")
       (not (vlax-property-available-p ent 'path))
       (not (_kpblc-conv-value-to-bool (_kpblc-property-get ent 'isxref)))
  ) ;_ end of and
) ;_ end of defun
