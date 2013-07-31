(in-package #:ws.ikki.yoi)

;;;------>Esta accion es para mostrar el contenido de nuestro menu de la pagina ikkiware atraves del id-page
(defaction show-cont (id-page)
  ;;llama al componente a su body y asignar un componente en cada slot
  (call-component $body (make-instance 'cms-pages-workflow-ikkiware				       
				       :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina
											  :id-page id-page)
				       ;;En este slot se llama a contacto2 para mostrar el contenido de la pagina en forma html
				       :page-content-ikkiware (make-instance 'contacto2
									     :contiene (get-page-content id-page)))))

(defaction show-cont2 (id-page)
  (call-component $body (make-instance 'main-view	       
				       :cms-menu-logout (make-instance 'menu-contextual-logout
								       :id-page id-page)
				       :content-view (make-instance 'contenidoxxx
								    :contiene (get-page-content id-page)))))
		 
