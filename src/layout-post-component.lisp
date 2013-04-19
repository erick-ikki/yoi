(in-package #:ws.ikki.yoi)

(defcomponent layout-post ()
  ())

(defmethod render :wrapping ((self  layout-post ))  
  (let ((stylesheet nil)) 
    (<ucw:form 
     :method "post"
     :function (constantly t)
     (<:div :id "contentwrap"
	    (<:div :id "content"  
		   (<:h1  (<:as-html "Choose your Layout") )
		   (<:br)
		   (<ucw:select :accessor stylesheet
				(with-open-file (stream 
						 (merge-pathnames "configfiles/layouts.dat" 
								  (asdf:component-pathname (asdf:find-system :yoi))))
				  (loop for line = (read-line stream nil 'EOF)
					until (eq line 'EOF)
					do (progn			       
					     (<ucw:option :value (subseq line 0 1) (<:as-html (subseq line 2)))))))
		   (<ucw:submit :value "Set layout >>"		 
				:style "cursor:pointer"				 			    
				:action (answer stylesheet)))))))