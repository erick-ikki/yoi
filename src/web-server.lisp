(in-package #:ws.ikki.yoi)

;;;; Inicializacion del servidor UCW y aplicacion.

;;; Se define una clase llamada "my-server" que hereda de standard-server
;;; y el el encargado de crear el servidor web

(defclass my-server (standard-server) ())

;;; Esta funcion pone los parametros a nuestro servidor web que son el host y el numero de puerto

(defun create-backend ()
  (make-backend
   :iolib         
   :host "localhost" ; Aqui se establece el equipo local o se puede utilizar al ip del equipo.
   :port 9090)) ; Aqui se establece el numero del puerto por el cual va estar escuchando nuestro servidor.

;;;; Creacion del servidor web
(defun make-server ()
  (make-instance
   'my-server
   ;; El servidor es creado con los parametros definidos enteriormente como son el host y el puerto.
   :backend (create-backend)))


(defparameter *ucw-server* (make-server)) ; La instancia creada con la funcion "make-server" es almacenada en la variable "*ucw-server*".


;;;; Definicion del directorio para los archivos de hoja de estilo y funciones de javascript.

(defvar *wwwroot* ; Aqui se establece en la variable "*wwwroot*" la ruta del directorio wwwroot que usara nuestra aplicación.
  (merge-pathnames #P"wwwroot/"
		   (asdf:component-pathname (asdf:find-system :yoi))))

(defvar *layout-dir* "css-layout")
(defparameter *style* nil)

(setf *style* (concatenate 'string *layout-dir* (read-first-line-file "configfiles/layout.dat") "/" (read-first-line-file "configfiles/layout-css.dat")))


;;;; Se define la clase para nuestra aplicacion que hereda de tres clases

(defclass blog-app (standard-application
		    tal-application-mixin
		    static-roots-application-mixin )
  ()
  (:default-initargs
   ;; Aqui se define que la aplicacion inicia en la url /
   :url-prefix "/"
   ;; Aqui se india que todo lo que la aplicacion apunte usando "static" estara en 
   ;;la ruta a la que apunta *wwwroot*
   :static-roots (list (cons "static/" 
			     *wwwroot*))))

;; La  instancia creada se almacena en la variable "*blog*"
(defparameter *blog* (make-instance 'blog-app))

;;; Esta funcion inicia la aplicacion

(defun start-blog-server (&key (backend :iolib) (port 9090))
  (if (server.started *ucw-server*)
      (error "Server already started")
      (setf (server.backend *ucw-server*)
	    (make-backend backend :port port)))
  (register-application *ucw-server* *blog*)
  (startup-server *ucw-server*))

;;; Esta funcion detiene la aplicacion

(defun stop-blog-server ()
  (when (server.started *ucw-server*)
    (shutdown-server *ucw-server*)))


(defentry-point "showpost.ucw"  (:application *blog*
				   :class regexp-dispatcher)
		((id))
  (when id 
    (setf $topic-id id))

  (if $topic-id      
      (progn
	(if (equal (read-from-string (read-first-line-file "configfiles/layout.dat")) 1)
	    (call 'blog-window :body (make-instance  'bookmark-found-component-lay :bookmark-post-id id ) :stylesheet *style*)
	    (call 'blog-window :body (make-instance  'bookmark-found-component :bookmark-post-id id ) :stylesheet *style*))
	)
      (call 'blog-window :body (make-instance 'bookmark-search-component) :stylesheet *style*)))



(defentry-point "admin.ucw" (:application *blog*) ()
  (if (equal (read-from-string (read-first-line-file "configfiles/layout.dat")) 1)
      (progn
	(setf *style* 	(list (concatenate 'string 
					   "static/"
					   (concatenate 'string 
							*layout-dir*
							(read-first-line-file "configfiles/layout.dat")
							"/"
							(read-first-line-file "configfiles/layout-css.dat"))))))
      (progn
	(setf *style* 	(list (concatenate 'string 
					   "static/"
					   (concatenate 'string 
							*layout-dir*
							(read-first-line-file "configfiles/layout.dat")
							"/"
							(read-first-line-file "configfiles/layout-css.dat")))))))

  (if  (logged-in)
       (call 'blog-window :stylesheet *style* )
       (call 'login :stylesheet *style* )))

(defcomponent login (standard-window-component)
  ()
  (:default-initargs 
   :body (make-instance 'login-post)
   :title "Login "
   :stylesh  *style*
   :javascript
   '((:src  "static/parenscript.js"))))