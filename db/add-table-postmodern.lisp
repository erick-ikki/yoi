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


(deftable user 
  (:create-table user
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

(with-database (create-table 'user))

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
		    (user
		     :type (int))
		    (creation_date
		     :type (timestamp))
		    (date_of_update
		     :type (timestamp)))
		   (:foreign-key (user) (user id_user))))

(with-database (create-table 'website))