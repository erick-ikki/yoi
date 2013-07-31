(in-package #:ws.ikki.yoi)


;;; Funcion que realiza el preview del post al agregar un nuevo post

(defun preview-add-show-post   (topic-id xcreation-time post-name post-author post-abstract post-views post post-id)
  (<ucw:form  
   :function (constantly t)
   (<:div :id "post1"
;; En este div se pone el titulo o el nombre del post
	  (<:div :class "posttitle" 
		 (<:br)
		 (<:span :class "sptitle"		
			 (<:as-is (format nil "<blink>P r e v i e w </blink> " ))
			 (<:br)
			 (<:as-html (format nil "~A" post-name ))))
	  (<:h2
;; En este parrafo se pone el  post 
	   (<:p 
		(<:as-is (format nil "~A" post  ))))
;; En este parrafo se pone el autor del post 
	  (<:p :class "postauthor"
	       (<:as-html (format nil "Author: ~A" post-author)))
;; En este parrafo se pone la fecha de creacion del post
	  (<:p :class "postdate"
	       (<:as-html (format nil "Creation time: ~A" xcreation-time )))
;; En este parrafo se pone el id del post 
	  (<:p 
	   (<:as-html (format nil "Id of the post: ~A" post-id)))
	  (<:div :class "bpreviewpost" 
		 (<ucw:submit  :id "idaddpost"
			       :class "button-preview"
			       :style "cursor:pointer"
			       :value "Publish"
			       :onmouseover (ps (submit_mouseover "idaddpost"))
			       :onmouseout  (ps (submit_mouseout "idaddpost")) 
;; Esta accion envia la informacion del post a la accion "add-post" para ser almacenda en la base de datos
			       :action (add-post topic-id
						    (my-date  (get-universal-time)) ; Se obtiene la fecha actual en formaro aaaa/mm/dd h:m:s
						    (my-date  (get-universal-time)) ; Se obtiene la fecha actual en formaro aaaa/mm/dd h:m:s
						    post-name
						    post-author
						    post-abstract
						    1
						    post))
		 
		 (<ucw:submit :id "idaddpostxxxxxxxxx"
			       :class "button-preview"
			       :style "cursor:pointer; align: center; "
			       :value "Correct"
			       :onmouseover (ps (submit_mouseover "idaddpost"))
			       :onmouseout  (ps (submit_mouseout "idaddpost"))
			       :onclick (ps (goBack))
			       :action (sss)
			       )))))

;;;;;;;;;;;;;;;;;;;;-----------------------------------pagina web------------------------------------------------------------>

(defun preview-add-show-page  (id_pag xcreation-time post-nombre post-abstract post-views post post-id)
  (<ucw:form  
   :function (constantly t)
   (<:div :id "post1"
	  ;; En este div se pone el titulo o el nombre del post
	  (<:div :class "posttitle" 
		 (<:br)
		 (<:span :class "sptitle"		
			 (<:as-is (format nil "<blink>P r e v i e w </blink> " ))
			 (<:br)
			 (<:as-html (format nil "~A" post-nombre))))
	  (<:h2
	   ;; En este parrafo se pone el  post 
	   (<:p 
	    (<:as-is (format nil "~A" post  ))))
	  
;; En este parrafo se pone la fecha de creacion del post
	  (<:p :class "postdate"
	       (<:as-html (format nil "Creation time: ~A" xcreation-time )))
	  (<:div :class "bpreviewpost" 
		 (<ucw:submit  :id "idaddpost"
			       :class "button-preview"
			       :style "cursor:pointer"
			       :value "Publish-->"
			       :onmouseover (ps (submit_mouseover "idaddpost"))
			       :onmouseout  (ps (submit_mouseout "idaddpost")) 
			       ;; Esta accion envia la informacion del post a la accion "add-post" para ser almacenda en la base de datos
			       :action (add-page id_pag
						 (my-date  (get-universal-time)) ; Se obtiene la fecha actual en formaro aaaa/mm/dd h:m:s
						 (my-date  (get-universal-time)) ; Se obtiene la fecha actual en formaro aaaa/mm/dd h:m:s
						 post-nombre
						 post-abstract
						 post))
		 
		 (<ucw:submit :id "idaddpostxxxxxxxxx"
			      :class "button-preview"
			      :style "cursor:pointer; align: center; "
			      :value "Correct-->"
			      :onmouseover (ps (submit_mouseover "idaddpost"))
			      :onmouseout  (ps (submit_mouseout "idaddpost"))
			      :onclick (ps (goBack))
			      :action (sss)
			      )))))