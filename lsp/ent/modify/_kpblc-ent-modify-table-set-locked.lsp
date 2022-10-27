(defun _kpblc-ent-modify-table-set-locked (table / row col)
                                          ;|
*    ��������� ������ ������������ ����� �������
*    ��������� ������:
  table   ; vla-��������� �� �������. ��������� ����� �� �������������. ��� �������� ������������ ������
*    ������� ������:
(_kpblc-ent-modify-table-set-locked (vlax-ename->vla-object (car (entsel))))
|;
  (setq row 0)
  (while (< row (vla-get-rows table))
    (setq col 0)
    (while (< col (vla-get-columns table))
      (vla-setcellstate table row col (+ accellstatecontentlocked))
      (setq col (1+ col))
    ) ;_ end of while
    (setq row (1+ row))
  ) ;_ end of while
) ;_ end of defun
