(in-package #:ws.ikki.yoi)
;;Esta accion realiza el borrado del post en nuestra base de datos por el id del post  
(defaction delete-post (post-id)
  (delete-post-on-db post-id)
  ;;Se llama al componente en el slot contenido con un make-instance en search-delete 
  (call-component $contenido (make-instance 'search-delete)))