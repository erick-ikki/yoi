(in-package #:ws.ikki.yoi)
;; Este componente se utiliza para crear nuestro menu apartir de una lista esto en un elemento select. 
(defcomponent add-page () 
  ())

(defmethod render  ((self add-page))
  (<:div :id "contenetor"
	 (let ((category "")
	       (post "")
	       (id_pag "")
	       (nombre "")
	       (titulo "")
	       (contenido ""))
	   (<:div :id "wrapper"
		  (<:div :id "contentwrap"
			 (<:div :id "content"
				(if (logged-in) ;;se condiciona si el usuario esta logueado realiza alguna accion del menu
				    (progn
				      (<:div :id "post1"
					     (<:div :class "addtitle"
						    (<:span :class "spaddpost"
							    (<:as-html "Editar Pagina")))
					     
					     (<ucw:form :method "post"
							:function (constantly t)
							(<:p :class "labeladdpost"
							     (<ucw:select :accessor category 
									  :class "inputaddpost"
									  ;; sacamos los elementos de las lista y los mostramos en el select
									  (dolist (element (get-all-page-names)) 
									    (<ucw:option :value element (<:as-is element))))
							     
							     (<ucw:submit :value "¡Set page!"
									  :class "button-search"
									  :style "cursor:pointer"
									  :action (set-page-ikkiware category))))))
						   ;; Esta accion  envia la informacion para que se almacene en la base de datos en su accessor category del select
				    
				    (progn ;; si no esta logueado le manda un msj para llenar su login
				      (<:span :class "spaddpost"
					      (<:br )(<:br )
					      (<:as-html "  * NECESITAS  INGRESAR  PARA EDITAR TU PAGINA *  " 
							 (<:a :href "http://localhost:9090/admin.ucw" :class "sptexto" " login--> "))))
					      
					      
				    )))))))

