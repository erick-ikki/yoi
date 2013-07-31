(in-package #:ws.ikki.yoi)
;;Esta accion realiza un update en nuestra base de datos con el id_page y el contenido y lo manda a la funcion update-pag-ikki que realiza el update en la bd
(defaction updat-pag_ikki (tid-page tcontenido)
  (update-pag-ikki tid-page tcontenido))
  ;;  (set-page-ikkiware tnombre)

;;Esta accion realiza lo mismo pero solo con el contenido 
(defaction updat-pag-ikki (tcontenido)
  (update-pag-ikki2  tcontenido))

(defaction updt-pag_ikki (contenido)
  (update-pag-ikki contenido))