(in-package #:ws.ikki.yoi)
;;;Se define el componente contacto para mostrarla en nuestra pagina ikkiware 
(defcomponent contacto ()
  ())

(defmethod render ((self contacto ))
  (<:div :id "wrapper-c"
	 (<:div :id "contacto" 
		(<:div :id "texto-cabezal"
		       (<:div :class "texto3" "CONTACTO"))
		(<:div :id "texto-contacto" :class "texto" 
		       (<:p "¿Podemos ayudarte en algo?" )
		       "Por favor no dudes en contactarnos."
		       (<:br )
		       (<:a :href "mailto:info@ikkiware.com" :class "footer-texto2"
			    
			    (<:b "Mail:" "info@ikkiware.com"))
		       (<:br )
		       (<:b )
		       (<:b "Tel:" "+52 722 585 94 12"));;
		(<:div :id "imagen-contacto"))))
 
;;componentes para mostrar el contenido de nuestra accion
(defcomponent contacto2 ()
  ((contiene :accessor contiene
	     :initarg :contiene)))

(defmethod render ((objeto contacto2))
  (<:div :id "content"
	 (<:as-is (contiene objeto)))) 

(defcomponent contenidoxxx ()
  ((contiene :accessor contiene
	     :initarg :contiene)))

(defmethod render ((objeto contenidoxxx))
  (<:div :id "content"
	 (<:as-is (contiene objeto)))) 