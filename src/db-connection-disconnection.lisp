(in-package #:ws.ikki.yoi)

;;; Función que lee credenciales desde un archivo. 
(defun db-connection ()
  (let ((file nil)
	(dbuser nil)
	(dbpwd nil)) 
    (setq file (open (merge-pathnames #P"configfiles/credentials.dat" (asdf:component-pathname (asdf:find-system :yoi))) 
		     :direction 
		     :input))  
    (setf dbuser (read-line file)) 
    (setf dbpwd (read-line file)) 
    (close file) 
;; Se llama a la funcion de conexión de la base de datos y se le envian los datos del usuario y contraseña
;; que estan en el archivo credentials.dat
    (postgres-connection dbuser dbpwd)))

;;; Funcion que realiza la conexion a postgres 
(defun postgres-connection (dbuser dbpwd)
  (postmodern:connect-toplevel "tlatoani000" dbuser dbpwd "localhost"))

;;; Funcion que realiza la desconexion de la base de datos.
(defun db-disconnection ()
  (disconnect-toplevel))
