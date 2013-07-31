(in-package #:ws.ikki.yoi)
;;; Esta accion manda el layout y el estilo a dos componentes asigna el valor el del layout y el del estilo en dos variables locales
(defaction set-layout-and-stylesheet ()
  (let ((layout nil)
	(stylesheet nil))
    ;;asigna a layout el componente layout-post
    (setf layout (call-component $contenido
				 (make-instance 'layout-post)))
    ;;Asigna a stylesheet el componente style-post con su slot :layout
    (setf stylesheet (call-component $contenido
				     (make-instance 'style-post :layout layout)))
    ;;Asigna a set-stylesheet layout y stylesheet.
    (set-stylesheet layout stylesheet)))






