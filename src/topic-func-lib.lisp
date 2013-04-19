(in-package #:ws.ikki.yoi)

(defun add-topic-on-db (tname tdescription imgpath)
  (db-connection) ; Se realiza la conexion a la base de datos
  (query (:insert-into 'topics
	  :set
	  'topic_id (:nextval "topic_id") ; Se ejecuta una secuencia con el nombre de topic_id
	  'creation_time (my-date (get-universal-time)) 
	  'topic_name tname
	  'topic_description tdescription
	  'topic_image_path imgpath
	  'topic_update (my-date (get-universal-time)) ))
  (db-disconnection))
