(in-package #:ws.ikki.yoi)

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
