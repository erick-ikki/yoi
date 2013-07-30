;;;;;;;componente acerca------------------------------------------------------------------------->
(in-package #:ws.ikki.yoi)
;; se realiza un entry-point para llamar aun componente tipo html dentro de nuestra bd
(defentry-point "acercade.html" (:application *blog*) ()
  (call 'cms-pages-ikkiware ;;llamada a el tipo ventana
	:body (make-instance 'cms-pages-workflow-ikkiware ;; dentro de su body 
			     :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina)
			     :page-menu-ikkiware (make-instance 'menu-ikkiware)
			     :page-content-ikkiware (make-instance 'acercade2)
			     :page-footer-ikkiware (make-instance'pies))))


(defcomponent acerca ()
  ())

(defmethod render ((self acerca))
  (<:div :id "wrapper-acercade"
	 (<:div :id "acerca"
		(<:div :id "texto-cabezal" 
		       (<:div :class "texto3" "ACERCA DE"))

		(<:div :id "caja1"
		       (<:div :id "caja-wrapper"
			      (<:div :class "texto2" "En Ikkiware estamos comprometidos con proporcionar soluciones tecnológicas amigables, eficientes y confiables, que atiendan a problemas reales dando soluciones reales y apreciables.")))
		
		(<ucw:a :action (call-component $body (make-instance 'main-body
								     :content (make-instance 'organiceit)))
			(<:div :id "caja2" 
			       (<:div :id "caja-wrapper"
				      (<:div :class "texto2" "Nuestros productos estan cuidadosamente desarrollados para ser amigables y eficientes, creemos en que la tecnología esta para mejorar la calidad devida de nuestros clientes, no para complicarlos."))))
						       
		(<ucw:a :action (call-component $body (make-instance 'main-body
								     :content (make-instance 'acer-equipo)))
		
			(<:div :id "caja3"
			       (<:div :id "caja-wrapper"
				      (<:div :class "texto2" "Nuestro equipo esta conformado por personas de alta capacidad tecnológica, amplía experiencia y orientados al servicio."))))
		
		(<:div :id "wrapper-somos"
		       (<:div :id "texto-cabezal"
			      (<:div :class "texto3" "¿Cómo somos en Ikkiware?"))
		    
		       (<:div :id "somos" 
			      (<:div :class "texto" 
				     "Cumplimos nuestros compromisos con el cliente y somos honestos con nosotros mismos, lo cual se traduce en lealtad y compromiso con lo que hacemos."
				     "Trabajamos para mejorar simpre la experiencia de el cliente. El cliente es quien nos impulsa a ser una empresa con una filosofía y una cultura diferente, porque queremos ofrecerle una experiencia diferente.  Vemos al cliente no sólo como alguien que adquiere nuestro producto o servicio ,
sino como alguien que forma parte de la estructura de Ikkiware."
				     (<:p  )
				     (<:p "Misión")
				     (<:p )
				     "Construir, implementar, y mantener, las soluciones tecnológicas más eficientes, eficaces y simples de usar posibles, para solucionar problemas reales de nuestros clientes."
				     (<:p "Valores")
				     (<:p " - Excelencia")
				     (<:p " - Calidad Humana")
				     (<:p " - Servicio")
				     (<:p " - Somos Creadores")))))))

;;se crea un componente y llama a una funcion para mostrarla en su contenido

(defcomponent acercade2 ()
  ())

(defmethod render ((obj acercade2))
  (<:div :id "wrapper-acercade"
	 (<:as-is (acercade2)))) 





