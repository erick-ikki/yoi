(in-package #:ws.ikki.yoi)

;;; Accion que inserta en la base de datos  el nuevo tema para los posts y lo manda a una funcion para realizar el insert en la bd

(defaction add-topic-db (tname tdescription imgpath)
  (add-topic-on-db tname tdescription imgpath))

(defaction add-menu-db (tnombre ttitulo tcontenido)
  (add-menu-on-db tnombre ttitulo tcontenido))