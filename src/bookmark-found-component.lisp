(in-package #:ws.ikki.yoi)
(defcomponent bookmark-found-component ()
  ;; Se crea un slot llamado titulo y se almacena el componente titulo-component.
  ((titulo :component titulo-component
	   :accessor titulo)
   ;; Se crea un slot llamado menu y se almacena el componente menu-component.
   (menus :component menus-component
	  :accessor menus)
   ;; Se crea un slot llamado contenido y se almacena el componente contenido-component.
   (contenido :component show-post-component1   
	      :accessor contenido)
   (derecha :component derecha-component
	    :accessor derecha)
   (pie :component pie-component
	:accessor pie)))

(defmethod render ((self bookmark-found-component)) 
  (<:div :id "wrapper"
	 ;; Se hace visible el componente titulo en el navegador.
	 (render (slot-value self 'titulo))
	 ;; Se hace visible el componente menus en el navegador. 
	 (render (slot-value self 'menus)) 
	 ;;Se hace visible el componente contenido en el navegador.
	 (render (slot-value self 'contenido))
	 (render (slot-value self 'derecha))
	 (render (slot-value self 'pie))))


(defcomponent bookmark-found-component-lay ()
  ;; Se crea un slot llamado titulo y se almacena el componente titulo-component.
  ((titulo :component titulo-component
	   :accessor titulo)
   ;; Se crea un slot llamado menu y se almacena el componente menu-component.
   (menus :component menus-component
	  :accessor menus)
   ;; Se crea un slot llamado contenido y se almacena el componente contenido-component.
   (contenido :component show-post-component1   
	      :accessor contenido)
   (derecha :component derecha-component
	    :accessor derecha)
   (pie :component pie-component
	:accessor pie)))

(defmethod render ((self bookmark-found-component-lay)) 
  (<:div :id "wrapper"
	 ;; Se hace visible el componente titulo en el navegador.
	 (render (slot-value self 'titulo))
	 ;; Se hace visible el componente menus en el navegador. 
	 (render (slot-value self 'menus)) 
	 ;;Se hace visible el componente contenido en el navegador.
	 (render (slot-value self 'contenido))	 
	 (render (slot-value self 'pie))))