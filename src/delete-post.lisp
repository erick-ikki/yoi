(in-package #:ws.ikki.yoi)

(defaction delete-post (post-id)
  (delete-post-on-db post-id)
  (call-component $contenido (make-instance 'search-delete)))