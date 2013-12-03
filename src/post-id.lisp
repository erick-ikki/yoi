
 (in-package #:ws.ikki.yoi)
;;; Componente para mostrar el post por id del post

(defcomponent show-post-component ( ) 
  ((showpost :initform nil
	     :accessor showpost
	     :initarg :showpost)))


;;; Metodo para ver el componente show-post-component

(defmethod render :wrapping  ((a show-post-component))
  (<:form  
   (<:div :id "wrapper"
	  (<:div :id "contentwrap"
		 (<:div :id "content"
;; Se ejecuta el query para seleccionar el post con el id asociado
			(with-database (doquery   (:select 'tpost_id
							   'post_name
							   'post 
							   'post_author
							   'creation_time 
						   :from 'topic_posts
				    :where (:= 'tpost_id (showpost a)))
					   (idpost titulo  contenido autor fecha)
					 ;; La informacion encontrada en la base de datos se envia a la funcion show-post
					 (show-post idpost titulo contenido autor (my-date fecha)))))))))



(defcomponent show-post-component1 ()
  ())

(defmethod render :wrapping  ((ax show-post-component1))
  (<:form  
   (<:div :id "wrapper"
	  (<:div :id "contentwrap"
		 (<:div :id "content"
			;; Se ejecuta el query para seleccionar el post con el id asociado
			(with-database (doquery   (:select 'tpost_id
					    'post_name
					    'post 
					    'post_author
					    'creation_time 
				    :from 'topic_posts
				    :where (:= 'tpost_id (id)))
			    (idpost titulo  contenido autor fecha)
;; La informacion encontrada en la base de datos se envia a la funcion show-post
			  (show-post idpost titulo contenido autor (my-date fecha)))))))))

