(in-package #:ws.ikki.yoi)
;;;Funcion que realiza un insert en la base de datos para ingresar un nuevo topic y mostrarlo dinamicamente en nuestro blog
(defun add-topic-on-db (tname tdescription imgpath)
  (db-disconnection)
  (db-connection) ; Se realiza la conexion a la base de datos
  (query (:insert-into 'topics
	  :set	 
	  'creation_time (my-date (get-universal-time)) 
	  'topic_name tname
	  'topic_description tdescription
	  'topic_image_path imgpath
	  'topic_update (my-date (get-universal-time)) ))
  (db-disconnection))

;;;Funcion para realizar un insert en la base de datos e ingresar un nuevo menu dinamicamente en nuestra pagina ikkiware.
(defun add-menu-on-db (tnombre ttitulo tcontenido)
  (db-disconnection)
  (db-connection); se realiza la conexion a la base de datos
  (query (:insert-into 'pag_ikki
	  :set 
	  'creation_time (my-date (get-universal-time))
	  'nombre tnombre
	  'titulo ttitulo
	  'contenido tcontenido
	  'menu_update (my-date (get-universal-time)) ))
  (db-disconnection))