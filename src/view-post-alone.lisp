(in-package #:ws.ikki.yoi)

;;;; Accion que muestra un post seleccionado por su identificador

(defaction view-post-alone (id)
  ;; En el slot >> body << del componente "contenido" se crea una instancia del componente "show-post-component" y en su
  ;; slot >>showpost<<  se le paso el id del post.
  (call-component $contenido (make-instance 'show-post-component :showpost id)))