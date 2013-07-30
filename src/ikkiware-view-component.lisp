(in-package #:ws.ikki.yoi)
;;; Nuevo layout para mostrar la vista de la pagina en modo publico
(defentry-point "ikkiware-view.ucw" (:application *blog*) ()
  (call 'ikkiware-view))
;;se crea un nuevo componente tipo ventana 
(defcomponent ikkiware-view (standard-window-component) ()
  (:default-initargs
   :body (make-instance 'main-view)
   :stylesheet '("static/css-layout/estilos2.css")))

(defcomponent main-view ()
  ((menu-pag :component menu-ikkiware2
	     :initarg :menu-pag
	     :accessor menu-pag
	     :documentation "slot para mostrar nuestro menu en forma  de lista en nuestra pagina ikkiware publica ")
   (content-view :component contenido-view
		 :initarg :content-view
		 :accessor content-view
		 :documentation "slot para mostrar el contenido de nuestra pagina ikkiware")))

(defmethod render ((objeto main-view))  
  (<:div :id "contenetor"
	 (render (slot-value objeto 'menu-pag))
	 (<:div :id "body-wrapper"
		(render (slot-value objeto 'content-view)))
	 (<:div :id"footer-wrapper"
		(<:div :id "footer"
		       (<:div :id "footer1"                                                                
			      (<:div :id "footer-texto"
				     (<ucw:a :class "footer-texto"
					     :action (call-component $body (make-instance 'main-view
											  :content-view (make-instance 'acer-equipo))) "Sobre nosotros |")
				     (<:a :href "http://localhost:9090/ikkiware-view.ucw" :class "footer-texto" "©ikkiware 2013 ")
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

 #|
(defcomponent inicio ()
  ())

(defmethod render ((obj inicio))
  (<:div :id "contenetor"
	 (<:as-is (inicio)))) 

(cms-menu-logout :component menu-pages
		    :initarg :cms-menu-logout
		    :accessor cms-menu-logout)|#		  