(defun _kpblc-conv-ent-to-ename (ent-value / _lst)
                                ;|
			*    ������� �������������� ����������� �������� � ename
			*    ��������� ������:
			  ent-value  ; ��������, ������� ���� ������������� � ��������. ����� ���� ������ ���������, vla-���������� ��� ������ �������.
			*    ���� �� ����������� �� ������ �� ��������� �����, ������������ nil
			*    ������� ������:
			(_kpblc-conv-ent-to-ename (entlast))
			(_kpblc-conv-ent-to-ename (vlax-ename->vla-object (entlast)))
   
   *    Convert value to ename
   *    Call parameters:
     ent-value  ; value to convert to ename. Could be as ename, vla-pointer or list
   *    Otherwise returns nil
   *    Call samples:
      (_kpblc-conv-ent-to-ename (entlast))
			(_kpblc-conv-ent-to-ename (vlax-ename->vla-object (entlast)))
			|;
  (cond
    ((= (type ent-value) 'vla-object) (vlax-vla-object->ename ent-value))
    ((= (type ent-value) 'ename) ent-value)
    ((and (= (type ent-value) 'str) (handent ent-value) (tblobjname "style" ent-value))
     (tblobjname "style" ent-value)
    )
    ((and (= (type ent-value) 'str) (handent ent-value) (tblobjname "dimstyle" ent-value))
     (tblobjname "dimstyle" ent-value)
    )
    ((and (= (type ent-value) 'str) (handent ent-value) (tblobjname "block" ent-value))
     (tblobjname "block" ent-value)
    )
    ((and (= (type ent-value) 'list) (cdr (assoc -1 ent-value)))
     (cdr (assoc -1 ent-value))
    )
    (t nil)
  ) ;_ end of cond
) ;_ end of defun