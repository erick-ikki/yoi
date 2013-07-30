(in-package #:ws.ikki.yoi)
;;Se agrega el componente para umn nuevo menu 
(defcomponent add-menu ()
  ())

(defmethod render ((am add-menu))
  (let ((nombre nil) ;; se declaran nuestras variables locales 
	(titulo nil)
	(contenido nil)
	(post "")
	(nombre-menu "")
	(titulo-menu "")) 
    (<:div :id "contenetors"
	   (<:div :id "content"
		  (if (logged-in) ;; se condiciona nuestro componente si es verdadero realiza el procedimiento
		      (progn
			(<:div :id "post1"
			       (<ucw:form
				:function (constantly t)
				
				(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)	
				(<:div :class "titleaddtopic"(<:as-html "Agregando Nuevo  Menu"))
				(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp) 
				
				(<:p :class "labeladdtopic"
				     
				     (<:as-html "Nombre del Menu: ") 
				     (<ucw:input :type "text"
						 :name "tnombre"
						 :accessor nombre-menu
						 :value ""
						 :class "inputaddtopic") 
				     
				     (<:br)
				     (<:as-html "Titulo del Menu:")(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)
				     (<ucw:input :type "text"
						 :name "ttitulo"
						 :accessor titulo-menu
						 :value ""
						 :class "inputaddtopic" )
				     
				     (<:br) (<:br)
				     (<:as-html "Contenido : ")
				    
				     (<ucw:textarea :rows "12"
						    :cols "63"
						    :name "post"
						    :accessor contenido
						    :class  "inputaddpost")
				     
				     (<:div :class "balign"(<:br ) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp)(<:&nbsp) (<:&nbsp) 
					    (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp)(<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) 
					    (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp)(<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) 
					    (<:&nbsp)(<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp)(<:&nbsp)
					    
					    (<ucw:submit :value "Add-Menu -->"
							 :class "inputaddtopic"
							 :style "cursor:pointer"                               
							 ;; Esta accion  envia la informacion para que se almacene en la base de datos ya con nuestro formulario lleno
							 :action (add-menu-db nombre-menu titulo-menu contenido)))) ))))))))