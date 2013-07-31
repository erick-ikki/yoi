(in-package #:ws.ikki.yoi)

;;-----> action para guardar y editar el contenido en la base de datos

(defaction guardar-y-editar (id-page contenido)
  ;; primero guardamos con sus parametros de id-page y contenido  y se llama ala funcion para actualizar los datos en la bd 
  (update-pag-ikki id-page contenido)
  ;; se llama al componente tipo ventana para realizar en esa parte la edicion del componente y mostrarlo en pantalla 'show-page-component 
  (call-as-window 'cms-pages-ikkiware
		  :body (make-instance 'cms-pages-workflow-ikkiware
				       :cms-pages-menu-contextual-ikkiware (make-instance 'menu-contextual-vista-pagina
											  :id-page id-page)
				       :page-content-ikkiware (make-instance 'show-page-componente  ;Este componente muestra los botones para guargar y preview
									     :id-page id-page ;En este slot muestra el id-page y saber cual va editar
									     :contenido contenido) ;muestra el contenido de ese id-page
				       :page-footer-ikkiware (make-instance 'pies))))

