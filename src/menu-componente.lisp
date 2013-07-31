
(in-package #:ws.ikki.yoi)

;;; Definicion del componente para el menu del blog

(defcomponent menus-component ()
  ())

;;; Con este metodo se hace visible el componente en el navegador.

(defmethod render ((self menus-component))  
  (<:div :id "leftcolumnwrap"
	 (<:div :id "leftcolumn"
		(<:br)		
		(<:img :src "/static/img/lisplogo_fancy_128_trsp.png")
		(<:br)
		(<:h1
		 (<:as-html (format nil "Menu" ))) 
		;; Se crea un formulario que contendra los botones del menu y las ligas de interes.
		(<ucw:form :function (constantly t)		    
			   (<:div :id "menus"
				  (<:ul :id "menus"
					(<:li :class "limenu" 
					      ;;se hace una instancia del componente show-all-abstract de los topics
					      (<ucw:a :class "amenu"
						      :action (call-component $contenido (make-instance 'show-all-abstract)) "Home"))

					(db-disconnection)
					(db-connection)
					;;Se realiza un query para seleccionar los el id y el nombre de los topics
					(doquery (:select 'topic_id
							  'topic_name
							  :from 'topics)
					    (topic-id topic-name)
					  ;;Se hace la comparacion del slot de show-by-topic con el topic-id y lo muestra en pantalla con (<:as-html topic-name)
					  (<:li :class "limenu" 
						(<ucw:a :class "amenu" :action (call-component 
										$contenido 
										(make-instance
										 'show-by-topic :topic-id topic-id)) (<:as-html topic-name ) )))
					(db-disconnection)
					
					;;Se condiciona si el usuario esta en login puede hacer las operaciones de admin
					(if (logged-in)
					    (progn 
					      (<:h1(<:as-html (format nil "Admin" )))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (call-component $contenido (make-instance 'add-post)) "Add Post"))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (call-component $contenido (make-instance 'search-post-component)) "Edit post"))
					      
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (call-component $contenido (make-instance 'add-topic)) "Add topic"))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action ( call-component $contenido
										     (make-instance 'search-delete)) "Delete Post"))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (logout) "Logout"))
					      
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (set-layout-and-stylesheet) "Stylesheet"))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (call-as-window 'layout-principal
										    :body (make-instance 'main-principal)) "Salir del blog")))

					    ;;Si no esta en login le manda una liga para poder entrar al sistema
					    (progn 
					      (<:span :class "spaddpost2"
						      (<:br )
						      (<:a :href "http://localhost:9090/admin.ucw" :class "texto" " login--> "))))))
			  
			   (<:br)
			   (<:as-html "Logged as: ")
			   (<:br)
			   (<:as-html  $usersession)
			   (<:br)
			   (<:h3
			    (<:as-html (format nil "Links"  )))
			   
			   (<:a :href "http://common-lisp.net/" :target "_blank"
				(<:img :src "/static/img/lisp-emblem-trsp.png"))

			   (<:br)
			   (<:br)

			   (<:a :href "http://www.Debian.org" :target "_blank"
				(<:img :src "/static/img/debian.png"))

			   
			   (<:br)(<:br)
			   ;			   (<:img :src "/static/logol1.jpg" :width 190 :height 200)
			   ))))

#|
Se define el componente "menu-component" que se le aplica un estilo y de crean los menus que contendra el blog.
Se han creado 3 botones.
>>  El primer botón tiene la funcionalidad de mostrar los últimos 5 posts creando una instancia de show-all-abstract.
>>  El segundo botón  tiene la funcionalidad de agregar un post.
>>  El tercer boton tiene la funcionalidad de editar un post, que primero se búsca el posta a editar.
|#

