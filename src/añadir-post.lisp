
(in-package #:ws.ikki.yoi)


;;; Se define el componente con 7 slots que muestra la vista previa cuando se esta añadiendo un post
(defcomponent preview-add-post-component () 
  ((preview-add-post-id :initform nil
                     :accessor preview-add-post-id
                     :initarg :preview-add-post-id)
   (preview-add-topic-id :initform nil
		     :accessor preview-add-topic-id
		     :initarg :preview-add-topic-id)
   (preview-add-post-name :initform ""
		      :accessor preview-add-post-name
		      :initarg :preview-add-post-name)
   (preview-add-post-author :initform ""
			:accessor preview-add-post-author   
			:initarg :preview-add-post-author)
   (preview-add-post-abstract :initform ""
			  :accessor preview-add-post-abstract
			  :initarg :preview-add-post-abstract)
   (preview-add-post :initform ""
		 :accessor preview-add-post  
		 :initarg :preview-add-post)

   (preview-add-creation-time :initform 0
			  :accessor preview-add-creation-time
			  :initarg :preview-add-creation-time )))

;;; Se define el metodo render para ver el componente "preview-add-post-component"

(defmethod render :wrapping  ((padd preview-add-post-component))
  (<:form  
   (<:div :id "wrapper"
	  (<:div :id "contentwrap"
		 (<:div :id "content"
;; Se envia la informacion a la funcion "preview-add-show-post" para ver el preview del post
			(preview-add-show-post (preview-add-topic-id padd)
					       (my-date (preview-add-creation-time padd))
					       (preview-add-post-name padd)
					       (preview-add-post-author padd)
					       (preview-add-post-abstract padd)
					       1
					       (preview-add-post padd)
					       (preview-add-post-id padd)))))))
#|
 Aquí se define el componente para mostrar la vista previa cuando se está agregando el post, en este componente se usa la función
 "preview-add-show-post" que esta nos mostrará el post.
|#

(defcomponent preview-add-page-component () 
  ((preview-add-page-id_pag :initform nil
                     :accessor preview-add-page-id
                     :initarg :preview-add-page-id)
   
   (preview-add-page-contenido :initform ""
		      :accessor preview-add-page-contenido
		      :initarg :preview-add-page-contenido)
   (preview-add-page-abstract :initform ""
			  :accessor preview-add-page-abstract
			  :initarg :preview-add-page-abstract)
   (preview-add-post :initform ""
		 :accessor preview-add-post  
		 :initarg :preview-add-post)

   (preview-add-creation-time :initform 0
			  :accessor preview-add-creation-time
			  :initarg :preview-add-creation-time )))

(defmethod render :wrapping  ((pad preview-add-page-component))
  (<:form  
   (<:div :id "wrapper"
	  (<:div :id "contentwrap"
		 (<:div :id "content"
;; Se envia la informacion a la funcion "preview-add-show-post" para ver el preview del post
			(preview-add-show-page (preview-add-page-id_pag  pad)
					       (my-date (preview-add-creation-time pad))
					       (preview-add-page-contenido pad)
					       (preview-add-page-abstract pad)
					       (preview-add-post pad)))))))

