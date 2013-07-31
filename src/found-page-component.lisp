(in-package #:ws.ikki.yoi)
;; Se crea el componente para editar la pagina de nuestro componente select 
(defcomponent page-component () 
  ((contenido :initform 0
	      :accessor contenido
	      :initarg :contenido
	      :documentation "se crea el slot para mostrar el contenido")
   (tnombre :initform 0
	    :accessor tnombre
	    :initarg :tnombre
	    :documentation "se crea el slot para el nombre de nuestro menu")))

(defmethod render  :wrapping ((s page-component))
  (<ucw:form  
   :function (constantly t)
   (<:div :id "contenetor"
	  (let ((edit-pagina "")
		(edit-nombre ""))
	    (<:div :id "wrapper"
		   (<:div :id "contentwrap"
			  (<:div :id "content"
				 (<:div :class "foundtitle"
					(<:span :class "spfoundpost"
						(<:as-html "Editando--Pagina")))
				 (<:br)
				 (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)
				 (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp) 
				 (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp) 
				 ;;elemento donde se muestra nuestro contenido seleccionado  en formato texto con la conversion (<:as-is (contenido s))
				 (<ucw:textarea :rows "12"
						:cols "63"
						:name "edit-pagina" 
						:accessor edit-pagina 
						:class  "inputaddpost"
						(<:as-is (contenido s)))
				 
				 ;; (<:as-is (format nil "~A" (contenido s)))
				 
				 (<:br)
				 (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)
				 (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)
				 (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp) 
				 ;;elemento tipo submit que nos crea el boton de guardar 
				 (<ucw:submit :id "idsavepage"
					      :value "Guardar-->"
					      :class "inputaddbd"
					      :style "cursor:pointer"
					      :onmouseover (ps (submit_mouseover "idaddpost"))
					      :onmouseout  (ps (submit_mouseout "idaddpost"))
					      ;; Esta accion  envia la informacion para que se almacene en la base de datos
					      ;;Esta action manda ala funcion para realizarel update de los datos en nuestra bd en la posicion del nombre con el contenido de edit-pagina
					      :action (updat-pag_ikki (tnombre s) edit-pagina))
				 
				 ;;Elemento tipo submit que muestra el preview de nuestro elemento que se edito 
				 (<ucw:submit  :id "idpreviewpage"
					       :class "inputaddpage"
					       :style "cursor:pointer"
					       :value "Preview Page edit -->"
					       :onmouseover (ps (submit_mouseover  "idpreviewpage"))
					      :onmouseout  (ps (submit_mouseout  "idpreviewpage"))
					      ;;Esta action manda llamar al componente tipo ventana donde se mostrarar los datos en forma de html.
					       :action (call-as-window 'ikkiware-view
								       :body (make-instance 'main-view
											    :content-view (make-instance 'preview-edit-page-component
															 :preview-edit-contenido edit-pagina ))))
				 ))))))) 
                                             

