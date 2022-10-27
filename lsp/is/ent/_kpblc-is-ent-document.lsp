(defun _kpblc-is-ent-document (ent)
                              ;|
*    ���������, �������� �� ���������� �������� ���������� �� ��������
*    ��������� ������:
  ent    vla-���������. nil -> ���������, ��� ����������� "��������" ��������
*    ���������� ���� vla-��������� �� ��������, ���� nil ��� ������.
|;
  (cond ((not ent) *kpblc-adoc*)
        ((equal ent *kpblc-adoc*) ent)
        ((and (= (type ent) 'vla-object) (vlax-property-available-p ent 'modelspace)) ent)
  ) ;_ end of cond
) ;_ end of defun
