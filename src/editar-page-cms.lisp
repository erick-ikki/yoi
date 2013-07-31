(in-package #:ws.ikki.yoi)
;;-----> action para editar la pagina  por su id-page despues se llama a la ventana cms-pages-edit-ikkiware donde se van a mostrar los demas componentes en sus slots a los que hagan referencia 
(defaction editar-pagina (id-page)
  (call-as-window 'cms-pages-edit-ikkiware
		  :body (make-instance 'cms-pages-workflow-edit-ikkiware
				       :cms-pages-menu-edit-contextual-ikkiware (make-instance 'menu-contextual-editar-pagina ;en este slot se llama a menu-cont-ed
											       :id-page id-page) ;con su id-page  de la accion
				       :edit-content-ikkiware (make-instance 'cms-pages-edit ;en este slot se hace una instancia del componente encargado de mostrar
									     :id-page id-page ;los datos y botones para guargar y preview de la pagina a editar
									     :contenido (get-content-from-pag-ikki-by-name id-page))))); en este slot contenido se llama a la funcion get-content-from para mostrar el contenido con su id-page que se le asigne