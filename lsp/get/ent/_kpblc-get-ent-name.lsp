(defun _kpblc-get-ent-name (ent /)
                           ;|
*    ��������� �������� name ���������� ���������
*    ��������� ������:
  ent  ��������� �� �������������� ��������
    ����������� ��������
    ename
    vla-object
    string (����� ������� �������� �����)
|;
  (cond ((= (type ent) 'str) ent)
        ((_kpblc-property-get ent 'modelspace)
         (strcat (_kpblc-dir-path-and-splash (_kpblc-property-get ent 'path))
                 (_kpblc-property-get ent 'name)
         ) ;_ end of strcat
        )
        ((_kpblc-property-get ent 'effectivename))
        ((_kpblc-property-get ent 'name))
  ) ;_ end of cond
) ;_ end of defun
