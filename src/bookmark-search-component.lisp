(in-package #:ws.ikki.yoi)

;;;; Defincion del componente principal "main-component"

(defcomponent bookmark-search-component ()
  ;; Se crea un slot llamado titulo y se almacena el componente titulo-component.
  ((titulo :component titulo-component
	   :accessor titulo)
   ;; Se crea un slot llamado menu y se almacena el componente menu-component.
   (menus :component menus-component
	  :accessor menus)
   ;; Se crea un slot llamado contenido y se almacena el componente contenido-component.
   (contenido :component bookmark-content
	      :accessor contenido)
   (derecha :component derecha-component
	    :accessor derecha)
   (pie :component pie-component
	:accessor pie)))


(defmethod render ((self bookmark-search-component)) 
  (<:div :id "wrapper"
	 ;; Se hace visible el componente titulo en el navegador.
	 (render (slot-value self 'titulo))
	 ;; Se hace visible el componente menus en el navegador. 
	 (render (slot-value self 'menus)) 
	 ;;Se hace visible el componente contenido en el navegador.
	 (render (slot-value self 'contenido))
	 (render (slot-value self 'derecha))
	 (render (slot-value self 'pie))))