(in-package #:ws.ikki.yoi)

(defaction set-layout-and-stylesheet ()
  (let ((layout nil)
	(stylesheet nil))
    (setf layout (call-component $contenido
				 (make-instance 'layout-post)))
    
    (setf stylesheet (call-component $contenido
				     (make-instance 'style-post :layout layout)))

    (set-stylesheet layout stylesheet)))