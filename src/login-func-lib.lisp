(in-package #:ws.ikki.yoi)

;;; Funcion que busca el usuario y contraseña en la base de datos y los compara 

(defun find-user (iduser password)
  (db-connection)
  (let ((usr1 nil)
        (pwd1 nil))
    ;; Se ejecuta el query para seleccionar el usuario y contraseña
    (doquery (:select 'usuario 'contraseña
                      :from 'login
                      :where
                      (:and
                       (:= 'usuario iduser)
                       (:= 'contraseña password)))
        (usr pwd)
      (setf usr1 usr)
      (setf pwd1 pwd))
    (db-disconnection)
    ;; Se compara el usuario y contraseña de la base de datos con  la informacion que enviaron en esta accion
    (if(and
	(equal usr1 iduser)
	(equal pwd1 password))
       T ; Regresa el resultado como verdadero
       nil)))  ; Regresa el resultado como falso