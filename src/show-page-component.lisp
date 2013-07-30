(in-package #:ws.ikki.yoi)

;;componente para mostrar el contenido de nuestra pagina  con un slot id-page 
(defcomponent show-page-component () 
  ((id-page :accessor id-page
	    :initarg :id-page)))

(defmethod render ((s show-page-component))
  (<:form  
   (<:div :id "contentwrap"
	  (<:div :id "content"
		 ;;muestra del menu por su variable global cont
		 (<:div (<:as-is *cont*)))))) 

;;componente para mostrar el contenido con su slot id-page  para poder saber que slot tiene y poder editarlo y el slot contenido para mostrarlo en forma de html
(defcomponent show-page-componente () 
  ((id-page :accessor id-page
	    :initarg :id-page
	    :documentation "slot para mostrar la pagina")
   (contenido :accessor contenido
	      :initarg :contenido
	      :documentation "slot para mostrar el contenido de la pagina")))

(defmethod render ((self show-page-componente))
  (<:form 
   (<:div :id "contentwrap"
	  (<:div :id "content"
		 (<:as-is (contenido self))))))