(in-package #:ws.ikki.yoi)

(defun add-topic-on-db (tname tdescription imgpath)
  
  (with-database (query (:insert-into 'topics
			 :set	 
			 'creation_time (my-date (get-universal-time)) 
			 'topic_name tname
			 'topic_description tdescription
			 'topic_image_path imgpath
			 'topic_update (my-date (get-universal-time))))))
