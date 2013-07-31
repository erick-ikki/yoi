(in-package #:ws.ikki.yoi)
;;componente para buscar la pagina por su nombre
(defcomponent search-page-component ()
  ())

;;Metodo para buscar el nombre de la pagina 

(defmethod render ((objeto search-page-component))
  (let ((search-name nil))
    (<:div :id "contenetors"
	   (<:div :id "contentwrap"
		  (<:div :id "content"
			 (if (logged-in)
			     (progn 
			       (<:div :id "post1"
				      ;; Se crea un formulario para que el usuario introduzca el nombre de la pagina  y lo pueda buscar
				      (<ucw:form
				       :function (constantly t)
				       (<:span :class "spsearchpage"
					       (<:div :class "searchtitle"
						      (<:as-html "Search Component Page")))
				       
				       (<:p :class "labelsearchpage" 
					    (<:as-html " Name : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp) 
					    (<ucw:input :type "text"
							:name "searchp"
							:accessor search-name
							:value ""
							:class "inputsearchpage") 
					    
					    (<ucw:submit :value "Set Page"
							 :class "button-search"
							 :style "cursor:pointer"				 
							 ;; Esta accion le manda el nombre de la pagina para que busque la informacion.
							 :action (found-page search-name))))))))))))