(in-package #:ws.ikki.yoi)

;;;Layout de la pagina original de ikkiware

(defentry-point "ikkiware.ucw" (:application *blog*) ()
  (call 'ikkiware))

(defcomponent ikkiware (standard-window-component) ()
  (:default-initargs
   :body (make-instance 'main-body)
   :stylesheet '("static/css-layout3/reset.css" "static/css-layout3/estilo-ikkiware2.css")))

;;;;;;;;;;;;;;;;; define simbol macro;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-symbol-macro $window (context.window-component *context*))
(define-symbol-macro $body (window-body $window)) 
(define-symbol-macro $content (content $body))

;;;;;;;;;;;;;;; define nuestro cuerpo

(defcomponent main-body ()
  ((menu :component component-menu
	 :initarg :menu
	 :accessor menu)
   (content :component contenido
	    :initarg :content
	    :accessor content)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;----------------main-body---------------------->

(defmethod render ((objeto main-body))  
  (<:div :id "contenetor"
	 (<:div :id "menu-wrapp"  
		(<:div :id "head-wrapper"
		       (<:a :href "http://localhost:9090/ikkiware.ucw" 
			    (<:div :id "header-imagen")))
		
		(<:div :id "menu-wrapper"
			      (<:div :id "menu"
				     (<:ul
				      (<:li 
				       (<ucw:a :action (call-component $body (make-instance 'main-body
											    :body (make-instance 'ikkiware))) "Inicio"))
				      (<:li 
				       
				       (<ucw:a :action (call-component $body (make-instance 'main-body
											    :content (make-instance 'acerca))) "Acerca de"))      
				      (<:li 
				       
				       (<ucw:a :action (call-component $body (make-instance 'main-body
											    :content (make-instance 'productos))) "Productos")) 
				      (<:li            
				       (<ucw:a :action (call-component $body (make-instance 'main-body
											    :content (make-instance 'contacto))) "Contacto"))))))
	 
	 (<:div :id "body-wrapper"
		(render (slot-value objeto 'content)))
	 
	 (<:div :id"footer-wrapper"
		(<:div :id "footer"
		       (<:div :id "footer1"                                                                
				     (<:div :id "footer-texto"
					    (<ucw:a :class "footer-texto"
						    :action (call-component $body (make-instance 'main-body
												 :content (make-instance 'acer-equipo))) "Sobre nosotros |")
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
	 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;----------------------------component-menu------------------------------------>

(defcomponent component-menu ()
  ())
(defmethod render ((objeto component-menu))
  (<:div :id "menu-wrapper"
	 (<:div :id "menu" 
		(<:ul 
		 (<:li 
		  (<:a :href "ikkiware.html"(<:span "Inicio")))
		 (<:li (<:a :href "Acerca de.html"(<:span "Acerca de")))      
		 (<:li (<:a :href "Productos.html"(<:span "Productos"))) 
		 (<:li (<:a :href "Contacto.html"(<:span "Contacto")))))))
  
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;--------------------------componente-contenido--------------------------------->

(defcomponent contenido ()
  ())
(defmethod render ((objeto contenido))  
  (<:div :id "body-imagen")
  (<:div :id "intro-wrapper"
	 (<:div :id "intro"
		(<:div :id "intro-texto"
		       (<:div :class "texto3" 
			      (<:p"CREEMOS EN LA TECNOLOGIA AMIGABLE, FACIL DE USAR,QUE SOLUCIONA PROBLEMAS REALES DE MANERA SENCILLA Y CONFIABLE."))
		       (<:div :class "texto" "Contamos con la experiencia y disposición para apoyar a nuestros clientes en el logro de sus metas, permitiendoles enfocarse en su negocio.")
		       (<:div :id "boton"
			      (<ucw:a :class "boton"
				      :action (call-component $body (make-instance 'main-body
										   :content (make-instance 'acerca))) "Acerca de"))))))
 
           ;;;;;;;;;;;;;;;;;;------------------------------------------------fin------------------------------------------------->