(in-package #:ws.ikki.yoi)
;;; Se realiza un nuevo componente para mostrar el post a editar 
(defcomponent found-post-component ()
  ((tpost-id :initform nil
	     :accessor tpost-id
	     :initarg :tpost-id)
   (topic-id :initform 0
	     :accessor topic-id 
	     :initarg :topic-id)
   (post-name :initform 0 
	      :accessor  post-name 
	      :initarg :post-name)
   (post-author :initform 0
		:accessor post-author
		:initarg :post-author )
   (post-abstract :initform 0 
		  :accessor post-abstract
		  :initarg :post-abstract )
   (xpost :initform 0 
	  :accessor xpost
	  :initarg :xpost )

   (creation-time :initform 0 
	  :accessor creation-time
	  :initarg :creation-time )))
;; Se define su metodo render asignando a s para utilizarla en las siguientes variables locales asignadas por (let)
(defmethod render :wrapping ((s found-post-component ))
  (let ((edit-category "")
	(edit-title "")
	(edit-author "")
	(edit-summary "")
	(edit-post "")) 
    ;;Se crea un formulario para almacenar toda la informacion de nuestro componente a editar
    (<ucw:form  
     :function (constantly t)
     (<:div :id "wrapper"
	    (<:div :id "contentwrap"
		   (<:div :id "content"
			  (<:div :id "post1"
				 (<:div :class "foundtitle"
					(<:span :class "spfoundpost"
						(<:as-html "Edit Post")))
				 (<:p :class "labelfoundpost"
				      (<:as-html "Category : ")
				      ;;SE realiza un select a nuestra tabla 'topics de la categoria a la que pertenece o a la que quiere hacer referencia con su accessor edit-category en el que nos mostrara su id y su nombre
				      (<ucw:select :accessor edit-category 
						   :class "inputaddpost"
						   (db-disconnection)
						   (db-connection)
						   (doquery (:select 'topic_id
								     'topic_name
								     :from 'topics)
						       (topic-id topic-name)
						     ;; nos muestra solo el nombre  del topic en pantalla
						     (<ucw:option :value topic-id  (<:as-html topic-name ))))
				      (db-disconnection)
				      
				      (<:br)
				      (<:as-html "Title : ")
				      ;;Se invoca a el elemento input de tipo text y se ingresa en nombre del post
				      (<ucw:input :type "text" 
						  :name "edittitle"
						  :accessor edit-title
						  :value (post-name s)
						  :class "inputaddpost")
				      
				      (<:br)
				      (<:as-html "Author : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp)
				      ;;Se invoca a el elemento input de tipo text y se ingresa en nombre del autor
				      (<ucw:input :type "text" 
						  :name "editauthor"
						  :accessor edit-author 
						  :value (post-author s)
						  :class  "inputaddpost") 
				      
				      (<:br) 
				      (<:as-html "Summary : ")
				      ;;Se invoca a el elemento textarea  y se ingresa una breve descripcion o summary
				      (<ucw:textarea :rows "5" 
						     :cols "63"
						     :name "editsummary" 
						     :accessor edit-summary 
						     :class "inputaddpost"
						     (<:as-is (format nil "~A" (post-abstract s))))   
				      
				      (<:br)(<:as-html "Post : ") (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp)(<:&nbsp)
				      ;;Se invoca a el elemento textarea  y se ingresa la descripcion total de nuestro post 
				      (<ucw:textarea :rows "12"
						     :cols "63"
						     :name "editpost" 
						     :accessor edit-post 
						     :class  "inputaddpost"
						     (<:as-is (format nil "~A" (xpost s))))

				      ;;En el elemento submit se manda al boton publish para mandar la informacion a la accion para guardar los datos en nuestra bd
				      (<ucw:submit  :id "idsavepost"
						    :class "inputaddpost"
						    :style "cursor:pointer"
						    :value "Publish ->>"
						    :onmouseover (ps (submit_mouseover "idsavepost"))
						    :onmouseout  (ps (submit_mouseout "idsavepost"))
						    ;;Esta accion manda la informacion a actualizar con sus respectivos componentes a actualizar 
						    :action (edit-post-update (tpost-id s) edit-category edit-title edit-author edit-summary edit-post ))
				      
				      ;;En el elemento submit nos crea el boton de preview y llama alos componentes involucrados a preview
				      (<ucw:submit  :id "idepreviewpost"
						    :class "inputaddpost"
						    :style "cursor:pointer"
						    :value "Preview Post de edit ->"
						    :onmouseover (ps (submit_mouseover  "idepreviewpost"))
						    :onmouseout  (ps (submit_mouseout  "idepreviewpost"))
						    ;;Esta accion llama a los componentes a el slot contenido de la instancia preview-edit-post-component 
						    ;;En cada slot con el elemento a guardar 
						    :action (call-component $contenido
									    (make-instance
									     'preview-edit-post-component :preview-edit-post-id (tpost-id s)
													  :preview-edit-topic-id edit-category
													  :preview-edit-post-name edit-title
													  :preview-edit-post-author edit-author
													  :preview-edit-post-abstract edit-summary
													  :preview-edit-post edit-post
													  :preview-edit-creation-time (creation-time s))))))))))))

;;;; En este componente se muestra el post encontrado y se presenta al usuario para poder editarlo, además contine dos botones,
;;;; uno es para guardar los cambios en el post y el otro es para ver la vista previa