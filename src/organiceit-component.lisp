(in-package #:ws.ikki.yoi)
;;Componente que nos muestra el elemento de orgniceit en nuestra pagina ikkiware
(defcomponent organiceit ()
  ())

(defmethod render ((self organiceit))
  (<:div :id "wrapper-organiceit"
	 (<:div :id"productos2"
		(<:div :id "texto-orgniceit" 
		       (<:div :id "texto-cabezal"
			      (<:div :class "texto3"" OrgNiceit"))
		       (<:div :id "texto-orgniceit2"
			      (<:div :class "texto" 
				     "En nuestra vida profesional, y personal, siempre estamos en la busqueda
constante por superarnos y buscamos manejar de la manera más eficiente posible nuestro tiempo y nuestras metas."
				     (<:br )
				     (<:b "OrgNiceIt") "Es una gran herramienta que esta aquí para ayudarte a obtener
resultados, a fijar y cumplir metas, ya sea individuales o trabajando en equipo. No más tareas olvidadas, no más complejidad al trabajar en equipo,
simplemente fija tus metas y obten los resultados que deseas."
				     (<:br )
				     (<:p  )
				     (<:a :target "_blank" :href"http://www.orgnice.it/" " www.orgnice.it")) 
			      (<:a :target "_blank" :href "http://www.orgnice.it/"
				   (<:div :id "logo-orgniceit")))) 
		       (<:div :id "imagenes-orgniceit"  
			      (<:div :id "imagen1")
			      (<:div :id "imagen2")))))
