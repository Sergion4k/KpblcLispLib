(defun _kpblc-autoload-autostart ()
                                 ;|
  *    ���������� ���������� ���������� ������ ���������
  |;
  (setq *kpblc-acad*  (vlax-get-acad-object)
        *kpblc-adoc*  (vla-get-activedocument *kpblc-acad*)
        *kpblc-model* (vla-get-modelspace *kpblc-adoc*)
  ) ;_ end of setq
) ;_ end of defun
