(defun _kpblc-is-app-ncad () 
  ;|
    *    ���������, ��� ������� ���������� - nanoCAD
  |;
  (= (strcase (vl-filename-base (vla-get-fullname (vla-get-application (vlax-get-acad-object))))) "NCAD")
)