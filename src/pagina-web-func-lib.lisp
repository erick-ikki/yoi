(in-package #:ws.ikki.yoi)

;;----->
;;;accion de prueba para mostrar el id y el contenido
(defaction foobar (id contenido )  
  ;; primeo guardamos  
  (bar id contenido))

;;----->
;;funcion de prueba para mostrar la actualizacion del contenido 
(defun bar (tid-page tcontenido)
  (db-disconnection)
  (db-connection)
  (query (:update 'pag_ikki
	  :set 'contenido tcontenido
	  :where (:='id_pag tid-page)))
  (db-disconnection))

;;----->
;;accion de prueba para mostrar el id de la pagina ikkiware
(defaction mostrar-id (id-pag)
  (save-page-ikki id-pag)
  (call-as-window 'cms-pages-edit-ikkiware
		  :body (make-instance 'cms-pages-workflow-edit-ikkiware
				       :menu-edit-pag (make-instance 'menu-contextual-editar-pagina
								     :nombre nombre)
				       :conten-edit-pag (make-instance 'content-area
								       :contenido (get-content-from-pag-ikki-by-name nombre)))))
