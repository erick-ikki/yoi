(in-package #:ws.ikki.yoi)

(defcomponent show-all-abstract () 
  ())

;;; En este componente  se muestran los últimos 5 post mas recientes o los últimos  posts actualizados.
(defmethod render ((x show-all-abstract))
  (<:form  
   (<:div :id "contentwrap"
	  (<:div :id "content"
		 (db-connection) ; Se realiza la conexion a la base de datos
		 ;; Se ejecuta un select a la base de datos con los ultimos 5 post ordenados descendentemente
		 (doquery   (:limit   (:order-by   (:select 'tpost_id
							    'post_name 
							    'post_abstract
							    'post_author
							    'update_time
						    :from 'topic_posts ) (:desc 'update_time) ) 5 ) 
		     (idpost titulo  resumen autor fecha)
		   (show-abstract idpost titulo resumen autor (my-date fecha)))
		 (db-disconnection))))) ; Se realiza la desconexion de la base de datos