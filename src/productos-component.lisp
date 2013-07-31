(in-package #:ws.ikki.yoi)
;;Se realiza un entry-point para poder visualizar el elemento de imagen de nuestro componente productos en productos-orgniceit.html
(defentry-point "productos-orgniceit.html" (:application *blog*) ()
  (call 'cms-pages-ikkiware 
	:body (make-instance 'cms-pages-workflow-ikkiware
			     :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina)
			     :page-menu-ikkiware (make-instance 'menu-ikkiware)
			     :page-content-ikkiware (make-instance 'productos-orgniceit2)
			     :page-footer-ikkiware (make-instance'pies))))

;; Se realiza un entry-point para el elemento productos.html
(defentry-point "productos.html" (:application *blog*) ()
  (call 'cms-pages-ikkiware 
	:body (make-instance 'cms-pages-workflow-ikkiware
			     :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina)
			     :page-menu-ikkiware (make-instance 'menu-ikkiware)
			     :page-content-ikkiware (make-instance 'productos2)
			     :page-footer-ikkiware (make-instance'pies))))

;,componente para mostrar el elemento productos en la pagina ikkiware
(defcomponent productos ()
  ())
;;Metodo para visualizar el componente productos en la pagina ikkiware
(defmethod render ((self productos))
  (<:div :id "wrapper-productos"  
	 (<:div :id "productos"
		(<:div :id "texto-cabezal" 
		       (<:div :class "texto3" "NUESTROS PRODUCTOS"))
		(<:br )
		(<:div :id "wrapper-cuadros" 
		       (<:div :id "wrapper-cuadro" 
			      (<ucw:a :action (call-component $body (make-instance 'main-body
										   :content (make-instance 'organiceit)))
				      (<:div :id "imagen-cuadro1")) 
			      (<:div :id "wrappertexto-cuadro" 
				     (<:div :id "texto-cuadro" 
					    (<:div :class "texto6" " OrgNiceIt "))
				     (<:div :id "texto-cuadro2" 
					    (<:div :class "texto4" "¡Organizalo con OrgNiceIt!"))));hasta organize it
		       (<:div :id "wrapper-cuadro"
			      (<:div :id "imagen-cuadro2")
			      (<:div :id "wrappertexto-cuadro" 
				     (<:div :id "texto-cuadro" 
					    (<:div :class "texto6"))
				     (<:div :id "texto-cuadro2" 
					    (<:div :class "texto4"))))
		       (<:div :id "wrapper-cuadro"
			      (<:div :id "imagen-cuadro2")
			      (<:div :id "wrappertexto-cuadro" 
				     (<:div :id "texto-cuadro" 
					    (<:div :class "texto6"))
				     (<:div :id "texto-cuadro2" 
					    (<:div :class "texto4"))))))))

;;Componentes utilizados para llamar a una funcion y mostrar los datos actualizados en nuestra base de datos.

(defcomponent productos2 ()
  ())

(defmethod render ((obj productos2))
  (<:div :id  "wrapper-productos"
	 (<:as-is (productos2))))

(defcomponent productos-orgniceit2 ()
  ())

(defmethod render ((obj productos-orgniceit2))
  (<:div :id  "wrapper-organiceit"
	 (<:as-is (productos-orgniceit2))))