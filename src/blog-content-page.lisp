(in-package #:ws.ikki.yoi)
;;; "blog" goes here. Hacks and glory await!

;;; Se crea un compoente para la aplicacion del blog, este componente hereda de "standard-window-component"

(defcomponent blog-window-content-page (standard-window-component)
  ()
  (:default-initargs 
   ;; El el slot >> body << del componente se crea una instancia del componente "main-componente"
   :body (make-instance 'blog-content-page)
   ;; Se le pone un titulo a la pagina.
   :title "My Blog"
   ;; Se incluye la ruta del archivo "blog.css" de la hoja de estilo.
   :stylesheet '("static/css-layout3/reset.css" "static/css-layout3/estilo-ikkiware2.css")
   ;; Se incluye la ruta del archivo "parenscript.js" para las funciones de javascript.
   :javascript
   '((:src  "static/parenscript.js"))))



;;;; Definicion del componente principal "main"

(defcomponent blog-content-page ()
  ;; Se crea un slot llamado contenido y se almacena el componente contenido
  ((contenido :component ikkiware
	      :accessor contenido)))


;__________________________________________________________________

;;;; Definicion del metodo render para el nuevo menu

;; Con este metodo se hace visible el componente en el navegador.
(defmethod render ((self blog-content-page)) 
  (<:div :id "wrapper"
	 ;;Se hace visible el componente contenido en el navegador.
	 (render (slot-value self 'contenido))))