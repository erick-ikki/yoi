(in-package #:ws.ikki.yoi)

(defcomponent style-post ()
  ((layout :accessor layout
	   :initarg :layout)))

(defmethod render :wrapping ((st style-post ))  
  (let ((stylesheet nil)) 
    (<ucw:form 
     :method "post"
     :function (constantly t)
     (<:div :id "contentwrap"
	    (<:div :id "content"  
		   (<:h1  (<:as-html "Choose your Style.") )
		   (<:br)
		   (<ucw:select :accessor stylesheet
				(with-open-file (stream 
						 (merge-pathnames (concatenate 'string "configfiles/stylesheet" (layout st) ".dat") 
								  (asdf:component-pathname (asdf:find-system :yoi))))
				  (loop for line = (read-line stream nil 'EOF)
					until (eq line 'EOF)
					do (progn			       
					     (<ucw:option :value line (<:as-html line ) )))))
		   (<ucw:submit :value "Set Style >>"		 
				:style "cursor:pointer"				 			    
				:action (answer stylesheet)))))))