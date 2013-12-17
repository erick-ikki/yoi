(in-package #:ws.ikki.yoi)

(defun db-add-post (topic-id  creation-time update-time post-name post-author post-abstract post_views xpost)
  ;; Se ejecuta el query para guardar la informacion en la base de datos.
  (with-database (query (:insert-into 'topic_posts
			 :set
			 'topic_id topic-id 
			 'creation_time  creation-time
			 'update_time update-time
			 'post_name post-name
			 'post_author post-author 
			 'post_abstract post-abstract
			 'post_views post_views 
			 'post  xpost))))

(defun found-post-on-db (post-id)
  (let ( (topic-post-data nil))
    ;; Se ejecuta el query para seleccionar  las propiedades del post
    (setf topic-post-data (with-database (query ( :select 'tpost_id
							  'topic_id 
							  'post_name
							  'post_author
							  'post_abstract 
							  'post 
							  'creation_time
						  :from 'topic_posts
						  :where (:='tpost_id post-id)))))
    ;; Se asignan las propiedades seleccionadas en el query a las variables locales 
    
    (car topic-post-data)))

(defun post-update (utpost-id utopic-id upost-name upost-author upost-abstract upost )
  ;; Se ejecuta el query para actualizar los datos.
  (with-database (query ( :update 'topic_posts 
			  :set    'topic_id utopic-id ; 
			  'update_time (my-date (get-universal-time))
			  'post_name upost-name
			  'post_author upost-author
			  'post_abstract upost-abstract
			  'post  upost
			  :where (:= 'tpost_id utpost-id ))))) ; Se pone una condicion para actualizar los datos


(defun delete-post-on-db (post-id)
  (with-database (query (:delete-from  'topic_posts 
			 :where (:= 'tpost_id post-id)))))