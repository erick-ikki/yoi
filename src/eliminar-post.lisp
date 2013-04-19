
(in-package #:ws.ikki.yoi)

;;; componente para confirmar  eliminar el post

(defcomponent delete-component ()
  ((post-id :initform nil
	    :accessor post-id
	    :initarg :post-id)))

(defmethod render :wrapping  ((del delete-component ))
  (<:div :id "wrapper"
	 (<:div :id "contentwrap"
		(<:div :id "content"
		       (<:div :id "post1"
;; Se crea un formulario para que el usuario introduzca el id del post y lo pueda borrar
			      (<ucw:form
			       :function (constantly t)
			       (<:span :class "spsearchpost"
				       (<:div :class "searchtitle"
					      (<:as-html "Confirm")
					      (<:br) (<:br)
					       (<:as-html "Delete Post id: " (post-id del))))
			       (<:br)
			       (<:div :class "balign" 
				      (<ucw:submit :value "Delete"
						   :class "button-search"
						   :style "cursor:pointer"				 
;; Esta accion le manda el id del post para que busque la infromacion.
						   :action (delete-post (post-id del)))
				      
				      (<ucw:submit :value "Cancel"
						   :class "button-search"
						   :style "cursor:pointer"				 
;; Esta accion le manda el id del post para quw borre el post.
						   :action  ( call-component $contenido (make-instance
											 'search-delete))))))))))