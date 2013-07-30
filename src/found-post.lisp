(in-package #:ws.ikki.yoi)

;;; Esta accion busca el post en la base de datos  por el identificador del post

(defaction found-post (post-id)
  ;;se declara la variable local 
  (let ((topic-post-data nil))
    ;;se asignara los valores de nuestra variable a la accion en la base de datos con el id del post
    (setf topic-post-data (found-post-on-db post-id))
    ;; se condiciona si es verdadero el id de l post realiza lo siguiente 
    (if topic-post-data
	;;llama al componente en el slot contenido y realiza una busqueda de cada slot de found-post-component con la variable antes asignada con la funcion "nth"
	(call-component $contenido (make-instance 'found-post-component :tpost-id      (nth 0 topic-post-data)
									:topic-id      (nth 1 topic-post-data)
									:post-name     (nth 2 topic-post-data)
									:post-author   (nth 3 topic-post-data)
									:post-abstract (nth 4 topic-post-data)
									:xpost         (nth 5 topic-post-data)
									:creation-time (nth 6 topic-post-data)))
	;;llama a el componente en el slot contenido y hace una instancia  de search-post-component que es el que realiza la busqueda del post.
	(call-component $contenido (make-instance 'search-post-component)))))

(defaction found-page (unombre)
  (let ((page-post-data nil))
    (setf page-post-data (db-pages unombre))
    (if page-post-data 
	(call 'main-pages
	      :content-pages (make-instance 'page-component )))))