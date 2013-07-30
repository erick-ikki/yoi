(in-package #:ws.ikki.yoi)


(defun insert-admin-user-on-db ()
  
  (db-disconnection)
  (db-connection)

  (query (:insert-into 'login
	  :set 'user "marko"
	       'password "123456"))


  (db-disconnection))

