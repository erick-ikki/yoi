(in-package #:ws.ikki.yoi)

;;; Funcion que almacena las credenciales en un archivo

(defun set-db-credentials (user pwd)
  (with-open-file (fp  (merge-pathnames #P"configfiles/credentials.dat" (asdf:component-pathname (asdf:find-system :yoi)))
		       :direction
		       :output
		       ;; si existe el archivo lo sustituye
		       :if-exists :supersede ) ;
    (FORMAT fp user) ; Agrega al archivo el usuario
    (FORMAT fp "~%") ; Agrega al archivo un salto de linea
    (FORMAT fp pwd))) ; Agrega al archivo la contraseña



;;; Funcion que muestra el post en forma resumen

(defun show-abstract  (id title post author date)
  (<:div :id "post1"
	 (<:div :class "posttitle" 
		(<:br)
		;; Es ete span se pone el titulo
		(<:span :class "sptitle"			
			(<:as-html (format nil "~A" title  )) ))
         
	 ;; Es ete parrafo se pone el post
	 (<:p 
	  (<:as-is (format nil "~A" post  )))
	 ;; Es ete parrafo se pone el autor
	 (<:p :class "postauthor"
	      (<:as-html (format nil "Author: ~A" author   )))
	 ;; Es ete parrafo se pone al fecha de creacion
	 (<:p :class "postdate"
	      (<:as-html (format nil "Date: ~A" date   )))
	 (<:p
	  (<:as-html (format nil "ID  [ ~A ]" id   ))
	  ;; Esta accion genera un liga par leer el post completo
	  (<ucw:a :action (view-post-alone id) "Read more . . ."))))


;;; Funcion que muestra el post 

(defun show-post (id title post author date)
  (let ((bookmark-link nil))
    (<:div :id "post1"
	   (<:div :class "posttitle" 
		  (<:br)
		  ;; En este span se pone el titulo del post
		  (<:span :class "sptitle"			
			  (<:as-html (format nil "~A" title  )) ))
	   ;; En este parrafo se pone el post	   
	   (<:div (<:as-is (format nil "~a" post  )))
	   ;; En este parrafo se pone el autor
	   (<:p :class "postauthor"
		(<:as-html (format nil "Author: ~A" author   )))
	   ;; En este parrafo se pone el fecha de creacion
	   (<:div :class "postdate"
		  (<:as-html (format nil "Date: ~A" date   )))
	   ;; En este parrafo se pone el id
	   (<:p 
	    (<:as-html (format nil "ID  [ ~A ]" id   ))
	    (<:h2  :style "text-align: center;"
		   (<ucw:a :action (call-component $contenido (make-instance 'show-all-abstract)) "Back")		   (<:br))
	    (setf bookmark-link (concatenate 'string "/showpost.ucw?id=" (write-to-string id)))
	    
	    (<:a :href  bookmark-link  "Link bookmark: "))))) 


;;;  Funcion que realiza el preview del post al editar un post

(defun preview-edit-show-post   (topic-id xcreation-time post-name post-author post-abstract post-views post post-id)
  (<ucw:form  
   :function (constantly t)
   (<:div :id "post1"
	  (<:div :class "posttitle" 
		 (<:br)
		 ;; En este span se pone el titulo o el nombre del post
		 (<:span :class "sptitle"		
			 ;;(<:as-is (format nil "<blink>P r e v i e w </blink> " ))
			 (<:as-html (format nil "~A" post-name ))))
	  
	  ;; En este parrafo se pone el  post 
	  (<:p 
	   (<:as-is (format nil "~A" post  )))
	  ;; En este parrafo se pone el  autor
	  (<:p :class "postauthor"
	       (<:as-html (format nil "Author: ~A" post-author)))
	  ;; En este parrafo se pone la fecha de creacion
	  (<:p :class "postdate"
	       (<:as-html (format nil "Creation time: ~A" xcreation-time )))
	  ;; En este parrafo se pone el id del post
	  (<:p 
	   (<:as-html (format nil "Id of the post: ~A" post-id)))
	  (<:div :class "bpreviewpost" 
		 (<ucw:submit  :id "editsavesubmit"
			       :class "button-preview"
			       :style "cursor:pointer"
			       :value "Publish>>"
			       :onmouseover (ps (submit_mouseover "idaddpost"))
			       :onmouseout  (ps (submit_mouseout "idaddpost"))
			       ;; Esta accion envia la informacion del post a la accion "edit-post-updat" para ser actualizados en la base de datos
			       :action (edit-post-update post-id 
							 topic-id
							 post-name 
							 post-author
							 post-abstract
							 post ))
		 
		 (<ucw:submit  :id "idaddpostxxxxxxxxx"
			       :class "button-preview"
			       :style "cursor:pointer; align: center; "
			       :value "<< Correct"
			       :onmouseover (ps (submit_mouseover "idaddpost"))
			       :onmouseout  (ps (submit_mouseout "idaddpost"))
			       :action (xyxy))))))



;;; Funcion que realiza el cambio de formato  del tipo epoch a un formato de año/mes/dia hora:minuto:segundo

(defun my-date (epoch-time)
  (multiple-value-bind
	(second minute hour day month year)
      ;; Esta funcion realiza el cambio de formato de la fecha
      (decode-universal-time epoch-time) 
    ;; El resultado que se retorna se retorna en forma de lista
    (list day month year hour minute second)
    ;; Se concatena la informacion de acuedo al formato  año/mes/dia hora:minuto:segundo
    (concatenate 'string (write-to-string year)"/"(write-to-string month)"/"(write-to-string day)" "
		 (write-to-string hour)":" (write-to-string minute) ":" (write-to-string second))))


;;; funcion que revisa si existe una sesion del usuario en concreto.

(defun logged-in ()
  (when (context.session *context*)
    (get-session-value :usersession)))


;---------------------------------------

(defun read-first-line-file (filename)
  (let ((line-inf nil)
	(file nil))
    (setq file (open (merge-pathnames filename (asdf:component-pathname (asdf:find-system :yoi)))
		     :direction 
		     :input))  
    (setf line-inf (read-line file))  
    (close file) 
    line-inf))

(defun read-second-line-file (filename)
  (let ((line-inf nil)
	(file nil))
    (setq file (open (merge-pathnames filename (asdf:component-pathname (asdf:find-system :yoi)))
		     :direction 
		     :input))  
    (setf line-inf (read-line file))  
    (close file) 
    line-inf))


(defun write-file (filename content) ; content and name are both strings 
        (with-open-file 
	    ;;  creating a stream object named name
	    ( stream (merge-pathnames filename (asdf:component-pathname (asdf:find-system :yoi))) 
		     :direction :output
		     :if-exists :supersede
		     :if-does-not-exist :create ) ;  creates a file namend name if it does not already exist,
       (format stream content))); content is the input that is written to the file via the format function


;;---> Funcion que muestra la pagina ikkiware con su contenido.

(defun preview-edit-show-page (contenido)
  (let ((id-page ))
    (defparameter *cont* contenido) ;se declara una variable global para mostrar el contenido
    (<ucw:form  
     :function (constantly t)
     (<:div :id "post1"
	    (<:div :class "post" 
		   (<:div (<:as-is (format nil "~a" contenido))))
	    (<ucw:submit  :id "idsubmit"
			  :class "button-preview"
			  :style "cursor:pointer"
			  :value "Publish-->>"
			  :onmouseover (ps (submit_mouseover "idsubmit"))
			  :onmouseout  (ps (submit_mouseout "idsubmit"))
			  ;;nuestra siguiente accion manda los datos para el preview a el main component con su instancia en cada slot.
			  :action(call-component $body (make-instance 'cms-pages-workflow-ikkiware
								      :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina
															 :id-page id-page)
								      :page-content-ikkiware (make-instance 'show-page-component
													    :id-page id-page)
								      :page-footer-ikkiware (make-instance'pies)))))))) 

;;-----> Funcion que muestra el id y el nombre de la db. nos muestra el menu de la pagina ikkiware
(defun get-all-pages-for-menu ()
  (let ((page-data nil))
    (db-disconnection)
    (db-connection) 
  ;; Asigna los valores a la variable y con la orden :order-by orden los componentes por su id_pag
  (setf page-data (query (:order-by (:select 'id_pag 'nombre
				  :from 'pag_ikki)
				   'id_pag)))
    (db-disconnection)
    page-data)
  )


;;-----> funcion para mostrar el menu dinamicamente en forma de lista su id y su nombre

(defun create-menu (id-page name-page)
  (<:li
   ;;la accion :title (write-to-string id-page) muestra el numero de id cada nombre: La accion nos manda a otro componente para mostrar el contenido de cada id y nombre
   (<ucw:a :title (write-to-string id-page) :action (show-cont id-page) (<:as-html name-page))))


;;-----> Funcion que muestra el contenido con el id-page y muestra los datos en su variable


(defun get-page-content (id-page)
  (let ((page-data-con nil))
    (db-disconnection)
    (db-connection)  
    ;; Hace un select para mostrar el contenido atravez del id_pag seleccionado y mediante car extrae el contenido para mostrarlo en un elemento select
    (setf page-data-con (query (:select 'contenido
				:from 'pag_ikki
				:where (:= 'id_pag id-page))))
    (db-disconnection) 
    (car (car page-data-con))))

;;;----->>>
(defun create-menu2 (id-page name-page)
  (<:li            
   (<ucw:a :title (write-to-string id-page) :action (show-cont2 id-page) (<:as-html name-page))))

;; (call-as-window 'ikkiware-view)
;;