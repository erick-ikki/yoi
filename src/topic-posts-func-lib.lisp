(in-package #:ws.ikki.yoi)
;;;Funcion para crear un nuevo post realiza un insert en topic_posts
(defun db-add-post (topic-id creation-time update-time post-name post-author post-abstract post_views xpost)
  (db-disconnection)
  (db-connection)
  ;; Se ejecuta el query para guardar la informacion en la base de datos.
  (query (:insert-into 'topic_posts
	  :set
	  'topic_id topic-id 
	  'creation_time  creation-time
	  'update_time update-time
	  'post_name post-name
	  'post_author post-author 
	  'post_abstract post-abstract
	  'post_views post_views 
	  'post  xpost))
  (db-disconnection))


;;;Funcion que realiza un select en la base de datos para mostrarnos el post con la condicion where (:='tpost_id post-id)
(defun found-post-on-db (post-id)
  (let ( (topic-post-data nil))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;; Se ejecuta el query para seleccionar  las propiedades del post
    (setf topic-post-data (query ( :select 'tpost_id
					   'topic_id 
					   'post_name
					   'post_author
					   'post_abstract 
					   'post 
					   'creation_time
				   :from 'topic_posts
				   :where (:='tpost_id post-id))))
    ;; Se asignan las propiedades seleccionadas en el query a las variables locales 
    
    (db-disconnection)
    (car topic-post-data)))

;;;Funcion para seleccionar el nombre de la pag_ikki
(defun db-pages (unombre)
  (let ((page-post-data))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;; Se ejecuta el query para actualizar los datos.
    (setf page-post-data (query ( :select 'nombre
				  :from 'pag_ikki
				  :where (:= 'nombre unombre)))) ; Se pone una condicion para actualizar los datos
  (db-disconnection)
  (car page-post-data)))


;;;Funcion para borrar el topic_posts de nuestra base de datos cuando el tpost_id sea igual al post-id enviado por el usuario
(defun delete-post-on-db (post-id)
  (db-disconnection)
  (db-connection) ; Se realiza la conexion a la base de datos
  (query (:delete-from  'topic_posts 
	  :where (:= 'tpost_id post-id)))
  (db-disconnection))