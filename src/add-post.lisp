(in-package #:ws.ikki.yoi)

;;; Accion que almacena un nuevo post en la base de datos con los datos que se envian al momento de invocar esta accion

(defaction add-post (topic-id  creation-time update-time post-name post-author post-abstract post_views xpost)
  (db-add-post topic-id  creation-time update-time post-name post-author post-abstract post_views xpost))