(in-package #:ws.ikki.yoi)


(defun insert-admin-user-on-db ()
  
  (db-disconnection)
  (db-connection)

  (query (:insert-into 'login
	  :set 'user "The user name you want."
	       'password "The password you choose."))


  (db-disconnection))

