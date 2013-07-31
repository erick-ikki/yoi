(in-package #:ws.ikki.yoi)

(defcomponent cms-pages-edit ()
  ((id-page :accessor id-page
	    :initarg :id-page
	    :documentation "slot para saber el id-page que se esta manejando y poder ejecutar las accciones sabiendo el id-page en el que se encuentra.")
   (contenido :accessor contenido
	      :initarg :contenido
	      :documentation "slot para mostrar el contenido")))

(defmethod render  :wrapping ((s cms-pages-edit))
  (let ((edit-pagina )) ;se declara una variable local para manipular el text area
    (<ucw:form  
     :function (constantly t)
     (<:div :id "contenetors"	  
	    (<:div :id "wrapper"
		   (<:div :id "contentwrap"
			  (<:div :id "content"
				 ;;se condiciona el componente si esta dentro del login puede editar la pagina
				 (if (logged-in)
				     (progn 
				       (<:div :class "foundtitle"
					      (<:span :class "spfoundpost"
						      (<:as-html "Editando--Pagina"))
					      (<:br)(<:br)
					      (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)
					      (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)
					      
					      (<ucw:textarea :rows "12"
							     :cols "63"
							     :name "edit-pagina" 
							     :accessor edit-pagina 
							     :class  "inputaddpost"
							     (<:as-is (contenido s)))
					      (<:br)
					      (<:br)
					      (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)
					      (<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)(<:&nbsp)				       					      

					      ;;submit para realizar el previo de la pagina 
					      (<ucw:submit  :id "idpreviewpage"
							    :class "inputaddpage2"
							    :style "cursor:pointer"
							    :value "Preview Page edit -->"
							    :onmouseover (ps (submit_mouseover  "idpreviewpage"))
							    :onmouseout  (ps (submit_mouseout  "idpreviewpage"))
							    :action (call-component $body (make-instance 
											      'cms-pages-workflow-edit-ikkiware
											      :cms-pages-menu-edit-contextual-ikkiware (make-instance 
																	'menu-contextual-vista-pagina
																	:id-page (id-page s))
											      :edit-content-ikkiware (make-instance 
														      'preview-edit-page-component
														      :id-page (id-page s)
														      :preview-edit-contenido edit-pagina))))
					      
					      ;;submit para guardar la informacion 
					      (<ucw:submit :id "idsavepage"
							   :value "Guardar-->"
							   :class "inputadd2"
							   :style "cursor:pointer"
							   :onmouseover (ps (submit_mouseover "idaddpost"))
							   :onmouseout  (ps (submit_mouseout "idaddpost"))
							   ;; Esta accion  envia la informacion para que se almacene en la base de datos
							   ;;Y manda a una accion guardar-y-editar sabiendo el id-page que esta manejando 
							   :action (guardar-y-editar (id-page s)  edit-pagina))))

				     ;; si no esta el usuario en loguin manda un mensaje y una liga para loguearse
				     (progn 
				       (<:span :class "spaddpost"
					       (<:br )(<:br )
					       (<:as-html "  * NECESITAS  INGRESAR  PARA EDITAR TU PAGINA *  " 
							  (<:a :href "http://localhost:9090/admin.ucw" :class "sptexto" " login--> "))))))))))))