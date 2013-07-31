(in-package #:ws.ikki.yoi)

(defcomponent contenido-view ()
  ())

(defmethod render ((objeto contenido-view))  
  (<:div :id "body-imagen")
  (<:div :id "intro-wrapper"
	 (<:div :id "intro"
		(<:div :id "intro-texto"
		       (<:div :class "texto3" 
			      (<:p"CREEMOS EN LA TECNOLOGIA AMIGABLE, FACIL DE USAR,QUE SOLUCIONA PROBLEMAS REALES DE MANERA SENCILLA Y CONFIABLE."))
		       (<:div :class "texto" "Contamos con la experiencia y disposición para apoyar a nuestros clientes en el logro de sus metas, permitiendoles enfocarse en su negocio.")
		       (<:div :id "boton"
			      (<ucw:a :class "boton"
				      :action (call-as-window 'ikkiware-view
							      :body (make-instance 'main-view
										  :content-view (make-instance 'acercade2))) "Acerca de"))))))
