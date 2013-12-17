(in-package #:ws.ikki.yoi)

(deftable  security_question
  (:create-table security_question 
		 ((id_question
		   :type :serial
		   :primary-key t
		   :unique t)
		  (security_question
		   :type (text)))))


(with-database (create-table 'security_question))


(deftable users 
  (:create-table users
		 ((id_user 
		   :type :serial
		   :primary-key t
		   :unique t)
		  (name
		   :type (text))
		  (email
		   :type (text))
		  (security_question
		   :type (int))
		  (answer
		   :type (text))
		  (password 
		   :type (text)))
		 (:foreign-key (security_question) (security_question id_question))))

(with-database (create-table 'users))

(deftable website 
  (:create-table website 
		 ((id_website  
		   :type :serial
		   :primary-key t
		   :unique t)
		  (header
		   :type (text))
		  (menu
		   :type (text))
		  (column1
		   :type (text))
		  (column2
		   :type (text))
		  (column3
		   :type (text))
		  (footer
		   :type (text))
		  (website_autor
		   :type (int))
		  (creation_date
		   :type (timestamp))
		  (date_of_update
		   :type (timestamp)))
		 (:foreign-key (website_autor) (users id_user))))

(with-database (create-table 'website))

(deftable topics
  (:create-table topics
		 ((topic_id
		   :type :serial
		   :primary-key t
		   :unique t)
		  (topic_name 
		   :type   (text))
		  (topic_description 
		   :type   (text))
		  (topic_image_path
		   :type   (text))
		  (creation_time
		   :type timestamp)
		  (topic_update
		   :type timestamp)
		  (topic_autor
		   :type (int)))
		 (:foreign-key (topic_autor) (users id_user))))

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
		   :type   (text))
		  (post_author
		   :type   (int)
		   :references (users))
		  (post_abstract
		   :type   (text))
		  (post 
		   :type (text))
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
		   :type   (text))
		  (comment_author
		   :type   (int)
		   :references (users))
		  (comment 
		   :type (text))
		  (time
		   :type timestamp))
		 (:foreign-key (post_id) (topic_posts tpost_id))))

(with-database (create-table 'topic_comments))