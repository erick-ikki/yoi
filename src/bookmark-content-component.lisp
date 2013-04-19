(in-package #:ws.ikki.yoi)

(defcomponent bookmark-content () 
  ())

(defmethod render ((bookmark bookmark-content ))
  (render-formulario 'id))

(defun render-formulario (function-name)
  (<:form 
   (<:div :id "contentwrap"
	  (<:div :id "content"
		 (<:h2
		  (<:as-html "Post Id")
		  (<:&nbsp)
		  (<:input :type "text"		
			   :name (string-downcase function-name))
		  (<:&nbsp)
		  (<:submit :value "Show Post" ))))))

(defun id ()
  $topic-id)