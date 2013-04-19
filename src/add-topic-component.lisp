(in-package #:ws.ikki.yoi)

;;; Componente para que el usuario agregue un tema para los post

(defcomponent add-topic ()())

;;; Metodo para ver el componente "add-topic

(defmethod render :wrapping  ((at add-topic ))
  (let ((topic-name nil)
	(topic-description nil)
	(image-path nil)) 
    (<:div :id "wrapper"
	   (<:div :id "contentwrap"
		  (<:div :id "content"
			 (if (loggen-in)
			     (progn
			       (<:div :id "post1"
				      ;; Se crea un formulario para que el usuario introduzca la informacion de los temas para los posts
				      (<ucw:form
				       :function (constantly t)
				       (<:div :class "titleaddtopic"
					      (<:as-html "Add Topic"))
				       (<:p :class "labeladdtopic"
					    (<:as-html "Topic Name : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp) 
					    (<ucw:input :type "text"
							:name "tname"
							:accessor topic-name
							:value ""
							:class "inputaddtopic") 
					    (<:br)
					    (<:as-html "Topic Descrip.:")(<:&nbsp) (<:&nbsp)
					    (<ucw:input :type "text"
							:name "tdescription"
							:accessor topic-description
							:value ""
							:class "inputaddtopic") 
					    (<:br)
					    (<:as-html "Image Path : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp)  (<:&nbsp) 
					    (<ucw:input :type "text"
							:name "img-path"
							:accessor image-path
							:value ""
							:class "inputaddtopic") 
					    (<:div :class "balign"
						   (<ucw:submit :value "Add Topic"
								:class "inputaddtopic"
								:style "cursor:pointer"                               
								;; Esta accion  envia la informacion para que se almacene en la base de datos
								:action (add-topic-db topic-name topic-description image-path)))))))))))))