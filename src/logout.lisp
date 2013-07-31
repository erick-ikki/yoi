
(in-package #:ws.ikki.yoi)
;; Esta accion reealiza el logout
(defaction logout ()
  (setf $usersession nil) ; remove login info
  (setf (ucw::frame.window-component (ucw::context.current-frame *context*))
	(call-as-window 'ikkiware-view
			:body (make-instance 'main-view				       
					     :menu-pag (make-instance 'menu-ikkiware2)))))
					    ; :stylesheet *style* simply throw away all the components
