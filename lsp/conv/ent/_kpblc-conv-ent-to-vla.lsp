(defun _kpblc-conv-ent-to-vla (ent_value / res)
                              ;|
    *    ������� �������������� ����������� �������� � vla-���������.
    *    ��������� ������:
      ent_value  ��������, ������� ���� ������������� � ���������. ����� ���� ������ ���������, vla-���������� ��� ������
                 �������.
    *      ���� �� ����������� �� ������ �� ��������� �����, ������������ nil
    *    ������� ������:
      (_kpblc-conv-ent-to-vla (entlast))
      (_kpblc-conv-ent-to-vla (vlax-ename->vla-object (entlast)))
      |;
  (cond
    ((= (type ent_value) 'vla-object) ent_value)
    ((= (type ent_value) 'ename) (vlax-ename->vla-object ent_value))
    ((setq res (_kpblc-conv-ent-to-ename ent_value)) (vlax-ename->vla-object res))
  ) ;_ end of cond
) ;_ end of defun