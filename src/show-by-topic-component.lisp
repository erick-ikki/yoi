(in-package #:ws.ikki.yoi)

;;; En este componente  se muestran los últimos 5 post mas recientes o los últimos  posts actualizados.

(defcomponent show-by-topic () 
  ((topic-id :initform nil
	     :accessor topic-id
	     :initarg :topic-id)))


(defmethod render ((sby show-by-topic))
  (<:form  
   (<:div :id "wrapper"
	  (<:div :id "contentwrap"
		 (<:div :id "content"
			(with-database (doquery      (:select 'tpost_id
							      'post_name 
							      'post_abstract
							      'post_author
							      'update_time
						      :from 'topic_posts
						      :where (:= 'topic_id (topic-id sby))) 
					   (idpost titulo  resumen autor fecha)
					 (show-abstract idpost titulo resumen autor (my-date fecha)))))))))