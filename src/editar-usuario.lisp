
(in-package #:ws.ikki.yoi)

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

(defmethod render :wrapping ((s found-post-component ))
  (let ((edit-category "")
	(edit-title "")
	(edit-author "")
	(edit-summary "")
	(edit-post "")) 
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
				      (<ucw:select :accessor edit-category 
						   :class "inputaddpost"
						   (with-database (doquery (:select 'topic_id
										    'topic_name
										    :from 'topics)
								      (topic-id topic-name)
								    (<ucw:option :value topic-id  (<:as-html topic-name )))))
				      (<:br)
				      (<:as-html "Title : ")
				      (<ucw:input :type "text" 
						  :name "edittitle"
						  :accessor edit-title
						  :value (post-name s)
						  :class "inputaddpost")
				      (<:br)
				      (<:as-html "Author : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp)
				      (<ucw:input :type "text" 
						  :name "editauthor"
						  :accessor edit-author 
						  :value (post-author s)
						  :class  "inputaddpost") 
				      (<:br) 
				      (<:as-html "Summary : ")
				      (<ucw:textarea :rows "5" 
						     :cols "63"
						     :name "editsummary" 
						     :accessor edit-summary 
						     :class "inputaddpost"
						     (<:as-is (format nil "~A" (post-abstract s))))   
				      (<:br)(<:as-html "Post : ") (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp)(<:&nbsp)
				      (<ucw:textarea :rows "12"
						     :cols "63"
						     :name "editpost" 
						     :accessor edit-post 
						     :class  "inputaddpost"
						     (<:as-is (format nil "~A" (xpost s))))
				      (<ucw:submit  :id "idsavepost"
						    :class "inputaddpost"
						    :style "cursor:pointer"
						    :value "Publish >>"
						    :onmouseover (ps (submit_mouseover "idsavepost"))
						    :onmouseout  (ps (submit_mouseout "idsavepost"))
						    :action (edit-post-update (tpost-id s) edit-category edit-title edit-author edit-summary edit-post ))
				      
				      (<ucw:submit  :id "idepreviewpost"
						    :class "inputaddpost"
						    :style "cursor:pointer"
						    :value "Preview Post de edit >"
						    :onmouseover (ps (submit_mouseover  "idepreviewpost"))
						    :onmouseout  (ps (submit_mouseout  "idepreviewpost"))
						    
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