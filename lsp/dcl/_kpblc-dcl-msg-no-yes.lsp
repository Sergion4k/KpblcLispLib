(defun _kpblc-dcl-msg-no-yes (title msg / dcl_file dcl_id dcl_res handle)
                             ;|
  *    ���������� ������ [�� / ���]. ������ �� ��������� - "���"
  *    ��������� ������:
    title   ; ��������� ����
    msg     ; ���������. ������ ��� ������
  *    ������� ������:
  (_kpblc-dcl-msg-yes-no (_kpblc-dcl-create-title-label "Title") "Message text")
  |;
  (_kpblc-dcl-msg-yes-no-low-level title msg nil)
) ;_ end of defun
