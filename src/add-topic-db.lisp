(in-package #:ws.ikki.yoi)

;;; Funcion que inserta en la base de datos  el nuevo tema para los posts

(defaction add-topic-db (tname tdescription imgpath)
  (add-topic-on-db tname tdescription imgpath))
