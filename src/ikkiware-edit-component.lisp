(in-package #:ws.ikki.yoi)
;;Nuevo layout para la edicion de la pagina ikkiware ocupado anteriormente dentro del blog
(defentry-point "ikkiware-edit.ucw" (:application *blog*) ()
  (call 'ikkiware-edit))
;;se crea el nuevo componente tipo ventana con un nuevo estilo
(defcomponent ikkiware-edit (standard-window-component) ()
  (:default-initargs
   :body (make-instance 'main-page)
   :stylesheet '("static/css-layout4/reset.css" "static/css-layout4/estilo-ikkiware4.css")))

;;El componente main tiene tres slots 
 (defcomponent main-page ()
  ((menu-pagina :component menu-pagina
		:initarg :menu-pagina
		:accessor menu-pagina)
   (titulo :component titulo-component
	   :initarg :titulo-component
	   :accessor titulo)
   (content-editar :component contenido-editar
		   :initarg :content-editar
		   :accessor content-editar)))

(defmethod render ((objeto main-page))  
   (<:div :id "contenetor"
	  (<:div :id "menu-wrapp"  
		 (<:div :id "head-wrapper"
			(<:a :href "http://localhost:9090/ikkiware-edit.ucw" 
			     (<:div :id "header-imagen")))
		 (<:div :id "menu-wrapper"
			(<:div :id "menu"
			       (<:ul
				(<:li 
				 (<ucw:a :action (call-component $body (make-instance 'main-view
										      :content-view (make-instance 'inicio))) "Inicio"))
				(<:li 
				 (<ucw:a :action (call-component $body (make-instance 'main-view
										      :content-view (make-instance 'acercade2))) "Acerca de"))
				(<:li 
				 (<ucw:a :action (call-component $body (make-instance 'main-view
										      :content-view (make-instance 'productos2))) "Productos")) 
				(<:li            
				 (<ucw:a :action (call-component $body (make-instance 'main-view
										      :content-view (make-instance 'contacto2))) "Contacto"))))))
	  (<:div :id "body-wrapper"
		 (render (slot-value objeto 'content-editar)))
	  
	  (<:div :id"footer-wrapper"
		 (<:div :id "footer"
			(<:div :id "footer1"                                                                
			       (<:div :id "footer-texto"
				      (<ucw:a :class "footer-texto"
					      :action (call-component $body (make-instance 'main-page
											   :content-editar (make-instance 'acer-equipo))) "Sobre nosotros |")
				      (<:a :href "http://localhost:9090/ikkiware.ucw" :class "footer-texto" "©ikkiware 2013 ")
				      (<:br )
				      (<:a :href "mailto:info@ikkiware.com" :class "footer-texto" "Mail: info@ikkiware.com")
				      (<:br )
				      (<:div :class "footer-texto" "Tel +52  7225852914")
				      (<:p)))
			(<:div :id "footer2"
			       (<:div :id "logos"
				      (<:a :target "_blank" :href "https://www.facebook.com/pages/Ikkiware/465654760184191?id=465654760184191&sk=info"
					   (<:div :id "logo-face"))
				      (<:a :target "_blank" :href "https://twitter.com/ikkiware"
					   (<:div :id "logo-twit"))))))))


(defcomponent menu-pagina ()
  ())

(defmethod render ((objeto menu-pagina))
  (<:div :id "menu-wrapper"
	 (<:div :id "menu" 
		(<:ul 
		 (<:li 
		  (<:a :href "ikkiware.html"(<:span "Inicio")))
		 (<:li (<:a :href "Acerca de.html"(<:span "Acerca de")))      
		 (<:li (<:a :href "Productos.html"(<:span "Productos"))) 
		 (<:li (<:a :href "Contacto.html"(<:span "Contacto")))))))

(defcomponent contenido-editar ()
  ())

(defmethod render ((objeto contenido-editar))  
  (<:div :id "body-imagen")
  (<:div :id "intro-wrapper"
	 (<:div :id "intro"
		(<:div :id "intro-texto"
		       (<:div :class "texto3" 
			      (<:p"CREEMOS EN LA TECNOLOGIA AMIGABLE, FACIL DE USAR,QUE SOLUCIONA PROBLEMAS REALES DE MANERA SENCILLA Y CONFIABLE."))
		       (<:div :class "texto" "Contamos con la experiencia y disposición para apoyar a nuestros clientes en el logro de sus metas, permitiendoles enfocarse en su negocio.")
		       (<:div :id "boton"
			      (<ucw:a :class "boton"
				      :action (call-component $body (make-instance 'main-page
										   :content-editar (make-instance 'acerca))) "Acerca de"))))))

	 #|(<:div :id "rightcolumnwrap"
		(<:div :id "rightcolumn"
		       (<:ul
			(<:li
			 (<ucw:a :action (call-as-window 'ikkiware-edit
							 :body (make-instance 'main-page
									      :content-editar(make-instance 'add-page))) "EDITAR")))))|#
#| (<:div :id "menu-wrapper"
		       (<:div :id "menu"
			      (<:ul
			       (<:li 
				(<ucw:a :action (call-component $body (make-instance 'main-page
										     :body (make-instance 'ikkiware-edit))) "Inicio"))
			       (<:li 
				(<ucw:a :action (call-component $body (make-instance 'main-page
										     :content-editar (make-instance 'acerca))) "Acerca de"))      
			       (<:li 
				(<ucw:a :action (call-component $body (make-instance 'main-page
										     :content-editar (make-instance 'productos))) "Productos")) 
			       (<:li            
				(<ucw:a :action (call-component $body (make-instance 'main-page
										     :content-editar (make-instance 'contacto))) "Contacto")))))  |#
	 
	 
