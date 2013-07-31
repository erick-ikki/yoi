(in-package #:ws.ikki.yoi)
;;Esta action  muestra los componentes de la pagina ikkiware por su nombre
(defaction set-page-ikkiware (page-name)  
  (let ((content nil))
    (setf content (get-content-from-pag-ikki-by-name page-name))
    (call-as-window 'ikkiware-view
		    :body (make-instance 'main-view
					 :content-view (make-instance 'pagina 
									:contenido content
									:tnombre page-name)))))

;;Esta accion muestra el contenido de la pagina ikkiware
(defaction save-page (save-conten)
  (let ((content-page-data nil))
    (setf content-page-data (updat-pag_ikki save-conten))
    (if content-page-data
	(call-as-window 'ikkiware-view
			:body (make-instance 'main-view
					     :content-view (make-instance 'show-page-component
									    :contenido))))))