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

	  (<:a :href (concatenate 'string "/showpost.ucw?id=" (write-to-string id)) "Read more...")))


;;; Funcion que muestra el post 

  (defun show-post (id title post author date)
  
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
		   (<ucw:a :action (call-component $contenido (make-instance 'show-all-abstract)) "Back")
		   (<:br)))))) 


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

(defun write-file (filename content) ; content and name are both strings 
        (with-open-file 
	    ;;  creating a stream object named name
	    ( stream (merge-pathnames filename (asdf:component-pathname (asdf:find-system :yoi))) 
		     :direction :output
		     :if-exists :supersede
		     :if-does-not-exist :create ) ;  creates a file namend name if it does not already exist,
       (format stream content))); content is the input that is written to the file via the format function