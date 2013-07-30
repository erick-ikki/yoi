(in-package #:ws.ikki.yoi)

;;; este componente lo utilizamos para mostrar el pie de la pagina ikkiware
(defcomponent pies ()
  ())


(defmethod render ((self pies))
  (<:div :id"footer-wrapper"
	 (<:div :id "footer"
		(<:div :id "footer1"                                                                
		       (<:div :id "footer-texto"
			      
			      (<ucw:a :class "footer-texto"
				      :action (call (make-instance 'main-view
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
				   (<:div :id "logo-twit")))))))