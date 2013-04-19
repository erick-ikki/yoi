;;;; .lisp
(in-package #:ws.ikki.yoi)
;;; "blog" goes here. Hacks and glory await!

;;;; Entrada de de la aplicacion

;; Se define la entrada "index.ucw" para la aplicacion blog 
(defentry-point "^(index.ucw|)$"  (:application *blog*
				   :class regexp-dispatcher)
		()
  (if (equal (read-from-string (read-first-line-file "configfiles/layout.dat")) 1)
      (progn
	(setf *style* 	(list (concatenate 'string 
					   "static/"
					   (concatenate 'string 
							*layout-dir*
							(read-first-line-file "configfiles/layout.dat")
							"/"
							(read-first-line-file "configfiles/layout-css.dat")))))
	
	(call 'blog-window-head-2col-footer :stylesheet *style*))
      (progn
	(setf *style* 	(list (concatenate 'string 
					   "static/"
					   (concatenate 'string 
							*layout-dir*
							(read-first-line-file "configfiles/layout.dat")
							"/"
							(read-first-line-file "configfiles/layout-css.dat")))))
	(call 'blog-window :stylesheet *style* ))))


;;; Se crea un compoente para la aplicacion del blog, este componente hereda de "standard-window-component"

(defcomponent blog-window (standard-window-component )
  ()
  (:default-initargs 
   ;; El el slot >> body << del componente se crea una instancia del componente "main-componente"
   :body (make-instance 'main-component)
   ;; Se le pone un titulo a la pagina.
   :title "My Blog: "
   ;; Se incluye la ruta del archivo "blog.css" de la hoja de estilo.
   :stylesheet '("static/blog.css")
   ;; Se incluye la ruta del archivo "parenscript.js" para las funciones de javascript.
   :javascript
   '((:src  "static/parenscript.js"))))



;;;; Defincion del componente principal "main-component"

(defcomponent main-component ()
  ;; Se crea un slot llamado titulo y se almacena el componente titulo-component.
  ((titulo :component titulo-component
	   :accessor titulo)
   ;; Se crea un slot llamado menu y se almacena el componente menu-component.
   (menus :component menus-component
	  :accessor menus)
   ;; Se crea un slot llamado contenido y se almacena el componente contenido-component.
   (contenido :component contenido-component
	      :accessor contenido)
   (derecha :component derecha-component
	    :accessor derecha)
   (pie :component pie-component
     :accessor pie)))


;__________________________________________________________________

;;;; Defincion del metodo render para el menu principal

;; Con este metodo se hace visible el componente en el navegador.
(defmethod render ((self main-component)) 
  (<:div :id "wrapper"
	 ;; Se hace visible el componente titulo en el navegador.
	 (render (titulo self))
	 ;; Se hace visible el componente menus en el navegador. 
	 (render (slot-value self 'menus)) 
	 ;;Se hace visible el componente contenido en el navegador.
	 (render (slot-value self 'contenido))
	 
	 (render (slot-value self 'derecha))
	 
	 (render (slot-value self 'pie))))

;____________________________________________________________________________________________________________________

;;;; Definicion del componente para el titulo del blog

(defcomponent titulo-component ()())

;;; Con este metodo se hace visible el componente en el navegador.

(defmethod render ((self titulo-component)) 

	 (<:div :id "headerwrap"
		(<:div :id "header"
		       
			(<:as-html (format nil "M y"  ))
			(<:&nbsp)  (<:&nbsp)
			(<:as-html (format nil "B l o g"  )))))
;;_________________________________________________________________________________________________________________________________________
;;;; Definicion del componente para el lado derecho  del blog

(defcomponent derecha-component ()())

;;; Con este metodo se hace visible el componente en el navegador.

(defmethod render ((self derecha-component)) 
 
	 (<:div :id "rightcolumnwrap"
		(<:div :id "rightcolumn"
		       (<:h1
			(<:as-html (format nil "Lado derecho"  ))))))
;_________________________________________________________________________________________________________________________________________
;;;; Definicion del componente para el pie  del blog

(defcomponent pie-component ()())

;;; Con este metodo se hace visible el componente en el navegador.

(defmethod render ((self pie-component)) 
  
	 (<:div :id "footerwrap"
		(<:div :id "footer"
		       (<:as-html (format nil "--------"  )))))

;_________________________________________________________________________________________________________________________________________


(defcomponent contenido-component ()
  ((inicio :component show-all-abstract
	   :accessor inicio)))

 ;;; En este componete se mostrará la información que se este generando al usar el aplicativo.

(defmethod render ((self contenido-component))
  (render (slot-value self 'inicio)))