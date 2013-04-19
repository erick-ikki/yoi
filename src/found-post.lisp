(in-package #:ws.ikki.yoi)

;;; Esta accion busca el post en la base de datos  por el identificador del post

(defaction found-post (post-id)
  (let ((topic-post-data nil))
    (setf topic-post-data (found-post-on-db post-id))
    (if topic-post-data
	(call-component $contenido (make-instance 'found-post-component :tpost-id      (nth 0 topic-post-data)
									:topic-id      (nth 1 topic-post-data)
									:post-name     (nth 2 topic-post-data)
									:post-author   (nth 3 topic-post-data)
									:post-abstract (nth 4 topic-post-data)
									:xpost         (nth 5 topic-post-data)
									:creation-time (nth 6 topic-post-data)))
	(call-component $contenido (make-instance 'search-post-component)))))