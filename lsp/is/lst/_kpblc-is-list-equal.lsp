(defun _kpblc-is-list-equal (lst1 lst2)
                            ;|
*    ���������, �������� �� ������������� ������ �����������.
*    ��������� ������:
  lst1    ������ ��� ���������
  lst2    ������ ��� ���������
|;
  (or (equal lst1 lst2)
      (and (= (length lst1) (length lst2))
           (listp (car lst1))
           (listp (car lst2))
           (apply (function and) (mapcar (function (lambda (x) (member x lst2))) lst1))
      ) ;_  end of and
  ) ;_  end of or
) ;_  end of defun
