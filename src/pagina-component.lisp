(in-package #:ws.ikki.yoi)

(defcomponent pagina () 
  ((contenido :initform 0
	      :accessor contenido
	      :initarg :contenido)
   (tnombre :initform 0
	    :accessor tnombre
	    :initarg :tnombre )))

(defmethod render  :wrapping ((s pagina ))
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
				
				(<ucw:submit :id "idsavepage"
					     :value "Guardar-->"
					     :class "inputaddbd"
					     :style "cursor:pointer"
					     :onmouseover (ps (submit_mouseover "idaddpost"))
					     :onmouseout  (ps (submit_mouseout "idaddpost"))
					     ;; Esta accion  envia la informacion para que se almacene en la base de datos
					     ;;:action (updat-pag_ikki (tnombre tcontenido s) edit-pagina )
					     :action (updat-pag_ikki (tnombre s) edit-pagina))
				
				(<ucw:submit  :id "idpreviewpage"
					      :class "inputaddpage"
					      :style "cursor:pointer"
					      :value "Preview Page edit -->"
					      :onmouseover (ps (submit_mouseover  "idpreviewpage"))
					      :onmouseout  (ps (submit_mouseout  "idpreviewpage"))
					      :action (call-as-window 'ikkiware-view
								      :body (make-instance 'main-view
											   :content-view (make-instance 'preview-edit-page-component
															  :preview-edit-contenido edit-pagina ))))
				))))))) 
                                                       
