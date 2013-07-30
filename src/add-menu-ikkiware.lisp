(in-package #:ws.ikki.yoi)

;;----->action agregar menu
;;esta accion manda la informacion a nuestro menu en su slot :cms-pages-menu... un menu contextual y a el slot :edit-content-ikkiware el componente add menu
(defaction agregar-menu ()
  (call-as-window 'cms-pages-edit-ikkiware
		  :body (make-instance 'cms-pages-workflow-edit-ikkiware
				       :cms-pages-menu-edit-contextual-ikkiware (make-instance 'menu-contextual-editar-pagina)
				       :edit-content-ikkiware (make-instance 'add-menu))))
