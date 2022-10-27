(defun _kpblc-objectidtoobject (obj id)
                               ;|
  *    ��������� ������� �� ��� ID
  *    ��������� ������:
    obj    ��������� �� ������ ���������
    id    �������� ID ����������� �������
  |;
  (if (and (> (vl-string-search "x64" (getvar "platform")) 0)
           (vlax-method-applicable-p obj 'objectidtoobject32)
      ) ;_ end of and
    (vla-objectidtoobject32 obj id)
    (vla-objectidtoobject obj id)
  ) ;_ end of if
) ;_ end of defun
