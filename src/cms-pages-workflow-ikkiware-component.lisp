(in-package #:ws.ikki.yoi)
;;; Nuevo layout para la pagina principal de la pagina ikkiware
(defentry-point "ikkiware-pages.ucw" (:application *blog*) ()
  (call 'cms-pages-ikkiware))


;;; layout para cms que maneja las paginas (ikkiware)
(defcomponent cms-pages-ikkiware (standard-window-component) ()
  (:default-initargs
   :body (make-instance 'cms-pages-workflow-ikkiware)
   :stylesheet '("static/css-layout/estilos2.css")))


;; Se define el componente con cuatro slots a manejar para mostrar o editar la pagina
(defcomponent cms-pages-workflow-ikkiware ()
  ((cms-pages-menu-contextual-ikkiware :component menu-contextual-vista-pagina
				       :initarg :cms-pages-menu-contextual-ikkiware
				       :accessor cms-pages-menu-contextual-ikkiware
				       :documentation  "Este slot contiene el componente para el menu contextual vista del cms")
   
   (page-menu-ikkiware :component menu-ikkiware
		       :initarg :page-menu-ikkiware
		       :accessor page-menu-ikkiware
		       :documentation "Este slot contiene el menu de la pagina ikkiware en la que estamos trabajando")

   (page-content-ikkiware :component content-ikkiware
			  :initarg :page-content-ikkiware
			  :accessor page-content-ikkiware
			  :documentation "Este slot contiene con contenido de la pagina")
   
   (page-footer-ikkiware :component pies
			 :initarg :page-footer-ikkiware
			 :accessor page-footer-ikkiware
			 :documentation "Este slot contine el pie de la pagina")))

;; Se renderean los 4 componentes
(defmethod render ((self cms-pages-workflow-ikkiware))
  (<:div :id "contenetors"
	 (render (slot-value self 'cms-pages-menu-contextual-ikkiware))
	 (render (slot-value self 'page-menu-ikkiware))
	 (render (slot-value self 'page-content-ikkiware))
	 (render (slot-value self 'page-footer-ikkiware))))

