(in-package #:ws.ikki.yoi)
;; Se crea el componente me-co-ed-pa  
(defcomponent menu-contextual-editar-pagina ()
  ((id-page :accessor id-page
	    :initarg :id-page
	    :documentation "Este slot contiene el id de la pagina que se muestra.")))

;;en su metodo render realiza tres acciones para regresar al home, regresar a la pagina ikkiware y para log out
(defmethod render ((self menu-contextual-editar-pagina))
  (<:div :id "menu-wrappers"
	 (<:div :id "menups"
		(<:ul
		 (<:li 
		  (<ucw:a :action (call-as-window 'layout-principal
						  :body (make-instance 'main-principal)) "H O M E "))
		 (<:li 
		  
		  (<ucw:a :action (call-as-window 'cms-pages-ikkiware
						:body (make-instance 'cms-pages-workflow-ikkiware
								     :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina
															:id-page 1)))  "PAGINA IKKIWARE"))
		 (<:li            
		  (<ucw:a :action (logout) "L O G O U T"))))))


;;;;---------> menu para el logout si se requiere
(defcomponent menu-contextual-logout ()
  ((id-page :accessor id-page
	    :initarg :id-page)))

(defmethod render ((self menu-contextual-logout))
  (<:div :id "menu-wrappers"
	 (<:div :id "menups"
		(<:ul
		 (<:li 
		  (<ucw:a :action (call-as-window 'layout-principal
						  :body (make-instance 'main-principal)) "H O M E "))
		 (<:li 
		  
		  (<ucw:a :action (call-as-window 'cms-pages-ikkiware 
						  :body (make-instance 'cms-pages-workflow-ikkiware)) "PAGINA IKKIWARE"))
		 (<:li            
		  (<ucw:a :action (logout) "L O G O U T"))))))

