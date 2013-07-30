(in-package #:ws.ikki.yoi)
;;;Este componente nos sirve para mostrar el previo de nuestra pagina ikkiware en modo edicion. Contiene 2 slots para saber el id-page y el preview-edit-contenido

(defcomponent preview-edit-page-component () 
  ((id-page :accessor id-page
	    :initarg :id-page
	    :documentation "Se define el slot id-page para mostrarse ")
   (preview-edit-contenido :initform ""
			   :accessor preview-edit-contenido
			   :initarg :preview-edit-contenido
			   :documentation " Se define el slot de preview para mandar la informacion a la funcion")))

(defmethod render  ((edit preview-edit-page-component))
  (<:form 
   (<:div :id "wrapper"
	  (<:div :id "contentwrap"
		 (<:div :id "content"
			;; Se envia la informacion de la pagina a la funcion preview-edit-show-page pasandole los valores a el slot
			(preview-edit-show-page (preview-edit-contenido edit)))))))
