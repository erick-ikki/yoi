;;;; .lisp
(in-package #:ws.ikki.yoi)
;;; "blog" goes here. Hacks and glory await!

;;; Se crea un compoente para la aplicacion del blog, este componente hereda de "standard-window-component"

(defcomponent blog-window-head-2col-footer (standard-window-component )
  ()
  (:default-initargs 
   ;; El el slot >> body << del componente se crea una instancia del componente "main-componente"
   :body (make-instance 'main-component)
   ;; Se le pone un titulo a la pagina.
   :title "My Blog"
   ;; Se incluye la ruta del archivo "blog.css" de la hoja de estilo.
   :stylesheet '("static/fixed-blog-blue-layout1.css" "wwwroot/inicio.css")
   ;; Se incluye la ruta del archivo "parenscript.js" para las funciones de javascript.
   :javascript
   '((:src  "static/parenscript.js"))))



;;;; Defincion del componente principal "main-component"

(defcomponent blog-head-2col-footer ()
  ;; Se crea un slot llamado titulo y se almacena el componente titulo-component.
  ((titulo :component titulo-component
	   :accessor titulo)
   ;; Se crea un slot llamado menu y se almacena el componente menu-component.
   (menus :component menus-component
	  :accessor menus)
   ;; Se crea un slot llamado contenido y se almacena el componente contenido-component.
   (contenido :component contenido-component
	      :accessor contenido)
   (pie :component pie-component
     :accessor pie)))


;__________________________________________________________________

;;;; Defincion del metodo render para el menu principal

;; Con este metodo se hace visible el componente en el navegador.
(defmethod render ((self blog-head-2col-footer)) 
  (<:div :id "wrapper"
	 ;; Se hace visible el componente titulo en el navegador.
	 (render (titulo self))
	 ;; Se hace visible el componente menus en el navegador. 
	 (render (slot-value self 'menus)) 
	 ;;Se hace visible el componente contenido en el navegador.
	 (render (slot-value self 'contenido))
	 (render (slot-value self 'pie))))