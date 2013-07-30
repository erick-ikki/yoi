(in-package #:ws.ikki.yoi)
;;; Nuevo layout llamado cms-pages-edit-ikkiware (privado) para realizar acciones internas de este componente  
(defentry-point "cms-pages-edit-ikkiware.ucw" (:application *blog*) ()
  (call 'cms-pages-edit-ikkiware))
;;componente tipo ventana que hereda de standard-window-component  
(defcomponent cms-pages-edit-ikkiware (standard-window-component) ()
  (:default-initargs
   :body (make-instance 'cms-pages-workflow-edit-ikkiware)
   :stylesheet '("static/css-layout/estilos2.css")))

;; se crea el componente cms-pages-workflow-edit-ikkiware con sus 2 slots  
(defcomponent cms-pages-workflow-edit-ikkiware ()
  ((cms-pages-menu-edit-contextual-ikkiware :component menu-contextual-editar-pagina
					    :initarg :cms-pages-menu-edit-contextual-ikkiware
					    :accessor cms-pages-menu-edit-contextual-ikkiware
					    :documentation "Este slot contine el menu contextual para editar la pagina")

   (edit-content-ikkiware :component cms-pages-edit
			  :initarg :edit-content-ikkiware
			  :accessor edit-content-ikkiware
			  :documentation "Este slot contiene la edicion de la pagina")))

;; Se renderean sus slots 
(defmethod render ((self cms-pages-workflow-edit-ikkiware))
  (render (slot-value self 'cms-pages-menu-edit-contextual-ikkiware))
  (<:div :id "contenetors"
	 (render (slot-value self 'edit-content-ikkiware))))