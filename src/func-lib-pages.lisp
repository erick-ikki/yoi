(in-package #:ws.ikki.yoi)


(defun inicio ()
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;;select contenido from pag_ikki in the name inicio 
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:='id_pag 1))))
    (db-disconnection)
    (car (car contenido))))

(defun acercade2 ()
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;;select contenido from pag_ikki in the name acercade 
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:='nombre "acercade"))))
    (db-disconnection)
    (car (car contenido))))

#| (defun contacto2 ()
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;;select contenido from pag_ikki in the name contacto 
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:='nombre "contacto"))))
    (db-disconnection)
    (car (car contenido)))) |#

;;(<:as-is (format nil "~A" 'contenido))

(defun productos-orgniceit2 ()
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;;select contenido from pag_ikki in the name productos-orgniceit
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:='nombre "productos-orgniceit"))))
    (db-disconnection)
    (car (car contenido))))

(defun productos2 ()
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;;select contenido from pag_ikki in the name productos 
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:='nombre "productos"))))
    (db-disconnection)
    (car (car contenido))))


(defun equipo ()
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) ; Se realiza la conexion a la base de datos
    ;;select contenido from pag_ikki in the name equipo 
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:='nombre "equipo"))))
    (db-disconnection)
    (car (car contenido)))) 

;-----> Funcion para guadar
;;; Funcion que muestra el contenido por el id_pag de nuestra pagina y lo muestra en una variable llamada contenido con la condicion es que el id_pag sea igual al id-page enviado
(defun save-page-ikki (id-page)
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) 
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:= 'id_pag id-page))))
    (db-disconnection)
    ;;funcion car que nos muestra el primer valor de una lista
    (car (car contenido))))

;------> Funcion para actualizar datos
;;; Funcion que realiza un update de la informacion en nuestra base de datos en este caso solo se actualiza el contenido la condicion es que el id_pag sea igual al id-page enviado 
(defun update-pag-ikki (tid-page tcontenido)
  (db-disconnection)
  (db-connection)
  (query (:update 'pag_ikki
	  :set 'contenido tcontenido
	  :where (:='id_pag tid-page)))
  (db-disconnection))
;;------>
(defun update-pag-ikki2 (tcontenido)
  (let ((tnombre nil))
    (db-disconnection)
    (db-connection)
    (query (:update 'pag_ikki
	    :set 'contenido tcontenido
	    :where (:='nombre tnombre)))
    (db-disconnection)))

;;-------> Funcion para mostrar el contenido
;;;Funcion que realiza un select del contenido con la condicion de que sea igual el id_pag con el id-page que se envia 
(defun get-content-from-pag-ikki-by-name (id-page)
  (let ((contenido nil))
    (db-disconnection)
    (db-connection) 
    (setf contenido (query (:select 'contenido
			    :from 'pag_ikki
			    :where (:= 'id_pag id-page))))
    (db-disconnection)
    (car (car contenido))))

;;------> Funcion para mostrar los nombre del menu de nuestar pagina
;;;Funcion que muestra el nombre del menu y los componentes en un objeto select
(defun get-all-page-names ()
  (let ((all-pages nil)) ;se declara una variable local a la cual se le asigna el valor de nombre
  (db-disconnection)
  (db-connection) ; Se realiza la conexion a la base de datos
  ;; Se ejecuta el query para ver los componentes de la pagina en un objeto select
  (doquery (:select 'nombre
	    :from 'pag_ikki)
      (nombre)
    (push nombre all-pages))
    (db-disconnection)
    all-pages )) 