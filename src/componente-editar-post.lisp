
(in-package #:ws.ikki.yoi)

;;; Se define el componente con 7 slots para el preview cuando se esta editando el post

(defcomponent preview-edit-post-component () 
  ((preview-edit-post-id :initform nil
                     :accessor preview-edit-post-id
                     :initarg :preview-edit-post-id)
   (preview-edit-topic-id :initform 000
		     :accessor preview-edit-topic-id
		     :initarg :preview-edit-topic-id)
   (preview-edit-post-name :initform ""
		      :accessor preview-edit-post-name
		      :initarg :preview-edit-post-name)
   (preview-edit-post-author :initform ""
			:accessor preview-edit-post-author   
			:initarg :preview-edit-post-author)
   (preview-edit-post-abstract :initform ""
			  :accessor preview-edit-post-abstract
			  :initarg :preview-edit-post-abstract)
   (preview-edit-post :initform ""
		 :accessor preview-edit-post  
		 :initarg :preview-edit-post)

   (preview-edit-creation-time :initform ""
			  :accessor preview-edit-creation-time
			  :initarg :preview-edit-creation-time )))

;_________________________________________________________________________________________________________________________________________
;;; Se define el metodo render para ver el componente "preview-edit-post-component"

(defmethod render :wrapping ((pedit preview-edit-post-component))
  (<:form 
   (<:div :id "wrapper"
	  (<:div :id "contentwrap"
		 (<:div :id "content"
;; Se envia la informacion del post a la funcion preview-edit-show-post
			( preview-edit-show-post (preview-edit-topic-id pedit)
						 (my-date (preview-edit-creation-time pedit))
						 (preview-edit-post-name pedit)
						 (preview-edit-post-author pedit)
						 (preview-edit-post-abstract pedit)
						 1
						 (preview-edit-post pedit)
						 (preview-edit-post-id pedit)))))))


#|
 Aquí se define el componente para mostrar la vista previa cuando se está editando el post, en este componente se usa la función
 "preview-edit-show-post" que esta nos mostrará el post.
|#
