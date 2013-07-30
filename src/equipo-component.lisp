(in-package #:ws.ikki.yoi)
;; Se realiza un entry-point para poder llamar a una imagen de nuestro componente acercade en su imagen equipo en los slots de cms-pages-workflow-ikkiware
(defentry-point "equipo.html" (:application *blog*) ()
  (call 'cms-pages-ikkiware 
	:body (make-instance 'cms-pages-workflow-ikkiware
			     :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina)
			     :page-menu-ikkiware (make-instance 'menu-ikkiware)
			     :page-content-ikkiware (make-instance 'equipo)
			     :page-footer-ikkiware (make-instance'pies))))

;; Se crea el componente para mostrarlo en nuestra pagina ikkiware
(defcomponent acer-equipo ()
  ())

(defmethod render ((self acer-equipo))
  (<:div :id "wrapper-equipo" 
	 (<:div :id "equipo" 
		(<:div :id "wrapper-somos"
		       (<:div :id "texto-cabezal"
			      (<:div :class "texto3" "nuestro equipo"))
		       (<:div :id "somos"  
			      (<:div :class "texto" "Nuestro equipo esta conformado, y siempre lo estará, por personas de altisima capacidad tecnológica, amplía experiencia y orientados al servicio. Nuestros clientes pueden contar con recibir soluciones de alta calidad, un trato amable y atención oportuna. Cada integrante de Ikkiware cuenta con experiencia comprobada y comprobable en su área, comparte los valores y principios de la empresa, y esta altamente orientado al servicio
y al trabajo en equipo; esto incide en tranquilidad y resultados palpables para nuestros clientes."
				     (<:div :id "boton"
					    (<:br  )
					    (<ucw:a :class "boton"
						    :action (call-component $body (make-instance 'main-body
												 :content (make-instance 'acerca))) "Acerca de"))	
				     (<:div :id "equipo3")))))))
#|
(defcomponent equipo ()
  ())

(defmethod render ((obj equipo))
  (<:div :id  "wrapper-equipo"
	 (<:as-is (equipo))))

|#