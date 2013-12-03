(in-package #:ws.ikki.yoi)

;_________________________________________________________________________________________________________________________________________
;;; Definicion del componente para agregar el post

(defcomponent add-post () ())

;;; Metodo render para ver el componente de agregar el post

(defmethod render ((x add-post))
;; Definicion de las variables locales
  (let ((category "")
	(title "2")
	(author "")
	(summary "")
	(post ""))
    (<:div :id "wrapper"
	   (<:div :id "contentwrap"
		  (<:div :id "content"
			 (if (logged-in)
			     (progn
			       (<:div :id "post1"
				      (<:div :class "addtitle"
					     (<:span :class "spaddpost"
						     (<:as-html "Add Post")))
;; Se crea el formulario para agregar el nuevo post
				      (<ucw:form  
				       :function (constantly t)
				       (<:p :class "labeladdpost"
					    (<:as-html "Category : ")
					    (<ucw:select :accessor category 
							 :class "inputaddpost"
							 
							 ;; Se ejecuta el query para ver las temas del post en un objeto select
							 (with-database (doquery (:select 'topic_id 
											  'topic_name
											  :from 'topics)
									    (topic-id topic-name)
									  (<ucw:option :value topic-id  (<:as-html topic-name )))))
					    (<:br)
					    (<:as-html "Title : ")
					    (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) 
					    (<ucw:input :type "text"
							:name "title"
							:accessor title
							:value ""
							:class  "inputaddpost") 
					    (<:br)
					    (<:as-html "Author : ")(<:&nbsp) (<:&nbsp) (<:&nbsp)  (<:&nbsp)
					    (<ucw:input :type "text"
							:name "author"
							:accessor author
							:value ""
							:class  "inputaddpost") 
					    (<:br) 
					    (<:as-html "Summary : ")
					    (<ucw:textarea :rows "5"
							   :cols "63"
							   :name "summary"
							   :accessor summary
							   :class  "inputaddpost")   
					    (<:br)
					    (<:as-html "Post : ")
					    (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp) (<:&nbsp)(<:&nbsp)
					    (<ucw:textarea :rows "12"
							   :cols "63"
							   :name "post"
							   :accessor post
							   :class  "inputaddpost")
					    (<:br) (<:br)
					    (<ucw:submit  :id "idaddpost"
							  :class "inputaddpost"
							  :style "cursor:pointer"
							  :value "Publish>"
							  :onmouseover (ps (submit_mouseover "idaddpost"))
							  :onmouseout  (ps (submit_mouseout "idaddpost"))
;; Se envia la informacion del nuevo post a la accion "add-post" para que se almacene en la base de datos.
							  :action (add-post category
									    (my-date (get-universal-time)) ; Se obtine la hora actual en formato aaaa/mm/dd
									    (my-date (get-universal-time)) ; Se obtine la hora actual en formato aaaa/mm/dd
									    title
									    author
									       summary
									       1
									       post))
					    (<:&nbsp)
					    (<ucw:submit  :id "idpreviewpost"
							  :class "inputaddpost"
							  :style "cursor:pointer"
							  :value "Preview >"
							  :onmouseover (ps (submit_mouseover  "idpreviewpost"))
							  :onmouseout  (ps (submit_mouseout  "idpreviewpost"))
;; Esta accion realiza el previe del nuevo post, la informacion se le asigna a los slots de componente "preview-add-post-component"
							  :action (call-component $contenido
										  (make-instance 'preview-add-post-component
												 :preview-add-post-id nil
												 :preview-add-topic-id category
												 :preview-add-post-name title
												 :preview-add-post-author author
												 :preview-add-post-abstract summary
												 :preview-add-post post
												 :preview-add-creation-time  (get-universal-time))))))))))))))
#|
Se define un componente que contiene el formulario para agregar un nuevo post, es decir contiene campos como:
cajas de texto para ingresar el titulo, autor, un resumen y el post, además contiene 2 botones uno para 
guardar o publicar el post  y el otro para ver la vista previa.

>> Botón de publiar, aquí se hace uso de la acción "add-post" que es la que se encarga de guardar la información
>> Botón de vista previa, aquí se crea una instancia de "preview-add-post-component" a la cual se le pasa la información del
post para que sea generada la vista previa.
La funcion  (get-universal-time) nos da la fecha actual en formato apoch
|#