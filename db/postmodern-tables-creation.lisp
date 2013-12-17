(in-package #:ws.ikki.yoi)

(deftable login 
  (:create-table login
		 ((id_user 
		   :type :serial
		   :primary-key t
		   :unique t)
		  (user
		     :type (varchar 50)
		     :unique t)
		  (password 
		   :type (varchar 50)))))

(with-database (create-table 'login))


(deftable topics
  (:create-table topics
		 ((topic_id
		   :type :serial
		   :primary-key t
		   :unique t)
		  (topic_name 
		   :type   (varchar 255))
		  (topic_description 
		   :type   (varchar 1000))
		  (topic_image_path
		   :type   (varchar 600))
		  (creation_time
		  :type timestamp)
		  (topic_update
		  :type timestamp))))

(with-database (create-table 'topics))

(deftable topic_posts
  (:create-table topic_posts
		 ((tpost_id
		   :type :serial
		   :primary-key t
		   :unique t)
		  (topic_id
		   :type integer
		   :references (topics))
		  (post_name 
		   :type   (varchar 255))
		  (post_author
		   :type   (varchar 255))
		  (post_abstract
		   :type   (varchar 2000))
		  (post 
		   :type (string))
		  (post_views 
		   :type (integer)
		   :default 0)
		  (creation_time
		  :type timestamp)
		  (update_time
		  :type timestamp))))

(with-database (create-table 'topic_posts))

(deftable topic_comments
  (:create-table topic_comments
		 ((comment_id
		   :type :serial
		   :primary-key t
		   :unique t)
		  (post_id
		   :type integer)
		  (name 
		   :type   (varchar 255))
		  (comment_author
		   :type   (varchar 255))
		  (comment 
		   :type (string))
		  (time
		  :type timestamp))
		 (:foreign-key (post_id) (topic_posts tpost_id))))

(with-database (create-table 'topic_comments))


