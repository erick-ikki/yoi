(in-package #:ws.ikki.yoi)

(defcomponent menu-ikkiware2 ()
  ())

(defmethod render ((self menu-ikkiware2))
  
  (let ((element nil)
	;; obtenemos todas las paginas que componen al menu de la pagina ikkiware
	(menus (get-all-pages-for-menu)))
   (<:div :id "menu-wrapp"  
	 (<:div :id "head-wrapper")
	 (<:div :id "menu-wrapper"
		(<:div :id "menu"
		       (<:ul
			;; con este ciclo nosotros creamos el menu para la pagina ikkiware
			(while menus
			  ;; sacamos el primer elemento de la lista de listas para convertirlo en el menu de la pagina
			  (setf element (car menus))
			  ;; llamamos a la funcion para que nos cree el menu
			  (create-menu2 (first element) (second element))
			  ;; le asignamos el resto de los elementos a la variable menus
			  (setf menus (cdr menus)))))))))
