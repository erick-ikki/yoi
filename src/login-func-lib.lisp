(in-package #:ws.ikki.yoi)

;;; Funcion que busca el usuario y contraseña en la base de datos y los compara 

(defun find-user (iduser password)
  (let ((usr1 nil)
        (pwd1 nil))
    ;; Se ejecuta el query para seleccionar el usuario y contraseña
    (with-database (doquery (:select 'name 'password
                      :from 'users
                      :where
                      (:and
                       (:= 'name iduser)
                       (:= 'password password)))
        (usr pwd)
      (setf usr1 usr)
      (setf pwd1 pwd)))
    ;; Se compara el usuario y contraseña de la base de datos con  la informacion que enviaron en esta accion
    (if(and
	(equal usr1 iduser)
	(equal pwd1 password))
       T 
       nil))) 