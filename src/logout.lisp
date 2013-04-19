
(in-package #:ws.ikki.yoi)

(defaction logout ()
  (setf $usersession nil) ; remove login info
  (setf (ucw::frame.window-component (ucw::context.current-frame *context*))
        (make-instance 'blog-window :stylesheet *style* ))) ; simply throw away all the components