(in-package #:ws.ikki.yoi)

;;; Componente para que el usuario borre el post

(defcomponent search-delete ()
  ())

;;; Metodo para ver el componente "search-delete"

(defmethod render :wrapping  ((sd search-delete ))
  (let ((search-delete-idpost 0)) 
    (<:div :id "wrapper"
	   (<:div :id "contentwrap"
		  (<:div :id "content"
			 (if (logged-in)
			     (progn
			       (<:div :id "post1"
				      ;; Se crea un formulario para que el usuario introduzca el id del post y lo pueda buscar
				      (<ucw:form
				       :function (constantly t)
				       (<:span :class "spsearchpost"
					       (<:div :class "searchtitle"
						      (<:as-html "Delete Post")))
				       (<:p :class "labelsearchpost" 
					    (<:as-html " Post Id : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp) 
					    (<ucw:input :type "text"
							:name "searchp"
							:accessor search-delete-idpost
							:value ""
							:class "inputsearchpost") 					    
					    (<ucw:submit :value "Delete Post"
							 :class "button-search"
							 :style "cursor:pointer"				 
							 ;; Esta accion le manda el id del post para que borre la informacion
							 :action ( call-component
								   $contenido (make-instance 'delete-component :post-id search-delete-idpost)))))))))))))