(in-package #:ws.ikki.yoi)

;;; Componente para que el usuario realice la busqueda del post

(defcomponent search-post-component ()
  ())

;;; Metodo para ver el componente "search-post-component"

(defmethod render :wrapping  ((s search-post-component ))
  (let ((search-idpost 0)) 
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
						      (<:as-html "Search Post by Id")))
				       (<:p :class "labelsearchpost" 
					    (<:as-html " Post Id : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp) 
					    (<ucw:input :type "text"
							:name "searchp"
							:accessor search-idpost
							:value ""
							:class "inputsearchpost") 

					    (<ucw:submit :value "Search Post"
							 :class "button-search"
							 :style "cursor:pointer"				 
							 ;; Esta accion le manda el id del post para que busque la infromacion.
							 :action (found-post search-idpost))))))))))))
#| Se crea un componente que el muestar al usuario una caja de texto a donde introduce el id del post para ser buscado,
este id de post se le envía a la función "found-post" para que encuentre al información y sea presentada al usuario
para poder editarlo.
|#
