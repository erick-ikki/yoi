(in-package #:ws.ikki.yoi)

(defentry-point "principal.ucw" (:application *blog*) ()
  (call 'layout-principal))

(defcomponent layout-principal (standard-window-component) ()
  (:default-initargs
   :body (make-instance 'main-principal)
   :stylesheet '("static/css-principal/reset.css" "static/css-principal/principal.css")
   :javascript '((:src  "static/css-principal/menu.js"))))

(defcomponent main-principal ()
  ((contenido-principal :component contenido-principal
			:initarg :contenido-principal
			:accessor contenido-principal)))

(defmethod render ((objeto main-principal))
  (<:div :id "header-wrapper"
	 (<:div :id "menu"))
  (<:div :id "wrapper-princ"
	 (<:div :id "contenetor"
		(render (slot-value objeto 'contenido-principal))))
  (<:div :id"footer-wrapper"
	 (<:div :id "footer"
		(<:div :id "footer1"                                                                
		       (<:div :id "footer-texto"
			      (<:a :href "#"  :class "footer-texto"  "Sobre nosotros |")
			      (<:a :href "#"  :class "footer-texto" "©ikkiware 2013 ")
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
				   (<:div :id "logo-twit"))))))) 


(defcomponent contenido-principal ()
  ())

(defmethod render ((objeto contenido-principal))  
  (<:div :id "wrapper-princ"
	 (<:div :id "contenetor"

		;;-----> action para llegar a el menu-principal
		(<ucw:a :action (call-as-window 'layout-principal
						:body (make-instance 'main-principal))
			(<:div :id "caja10"
			       (<:div :id "caja-wrapper"
				      (<:br ) (<:br )(<:br )(<:br )(<:br )(<:br )(<:br )(<:br )(<:br ) (<:br ) (<:br ) (<:br ) (<:br )(<:br ) (<:br )
				      (<:div :class "texto3" " CENTRO-ADMIN "))))

		;;-----> action para llegar al blog
		(<ucw:a :action (call-as-window 'blog-window
						:body (make-instance 'main-component)) 
			(<:div :id "caja11"
			       (<:div :id "caja-wrapper")
			       (<:br ) 
			       (<:div :class "texto3" " B L O G ")))

		;;-----> action para editar las paginas
		(<ucw:a :action (call-as-window 'cms-pages-ikkiware
						:body (make-instance 'cms-pages-workflow-ikkiware
								     :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina
															:id-page 1)))
			(<:div :id "caja12"
			       (<:div :id "caja-wrapper")
			       (<:br ) (<:br ) 
			       (<:div :class "texto3" " P A G E S")))
		
		;;-----> action para salir del cms
		(<ucw:a :action (logout) 
			(<:div :id "caja13"
			       (<:div :id "caja-wrapper")
			       (<:br ) (<:br )
			       (<:div :class "texto3" " L O G O U T "))))))
	
  
