(in-package #:ws.ikki.yoi)
;;componente creado para poder manipular la pagin acon su menu es donde se realiza todo el trabajo de la pagina
(defcomponent menu-contextual-vista-pagina ()
  ((id-page :accessor id-page
	    :initarg :id-page	    
	    :documentation "Este slot contiene el id de la pagina que se muestra.")))

;;En su metodo render tiene las 4 acciones necesarias para manipular nuestra pagina
(defmethod render ((self menu-contextual-vista-pagina))  
  (<:div :id "menu-wrappers"
	 (<:div :id "menups"
		(<:ul
		 (<:li 
		  ;;Esta accion llama a nuestro home principal
		  (<ucw:a :action (call-as-window 'layout-principal
						  :body (make-instance 'main-principal)) "H O M E "))
		 (<:li 
		  ;;Esta accion llama a editar la pagina con su id que muestra 
		  (<ucw:a :action (editar-pagina (id-page self)) "EDIT PAGE"))
		 (<:li 
		  ;;Esta accion llama al componente ventana e inicializa nuestro menu-con-vista con el id-pag 1
		  (<ucw:a :action (call-as-window 'cms-pages-ikkiware
						  :body (make-instance 'cms-pages-workflow-ikkiware
								       :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina
															  :id-page 1))) "PAGINA IKKIWARE"))
		 (<:li 
		  ;;Esta accion llama a agregar-menu a nuestra pagina ikkiware
		  (<ucw:a :action (agregar-menu) "MENU-PAG-IKKI"))
		 
		 (<:li        
		  ;;Esta accion sale de la pagina y del blog
		  (<ucw:a :action (logout) "L O G O U T"))))))