(in-package #:ws.ikki.yoi)
;;Componente para mostrar cual layout quieren en un elemento select
(defcomponent layout-post ()
  ())

(defmethod render :wrapping ((self  layout-post ))  
  ;; se declara una variable local para poder cambiar y asignarle un valor del layout
  (let ((stylesheet nil)) 
    (<ucw:form 
     :method "post"
     :function (constantly t)
     (<:div :id "contentwrap"
	    (<:div :id "content"  
		   (<:h1  (<:as-html "Choose your Layout") )
		   (<:br)
		   ;; Se realiza un select para poder ver los valores de cuantos layouts tenemos y que estilos poseen el
		   
		   (<ucw:select :accessor stylesheet
				(with-open-file (stream 
						 (merge-pathnames "configfiles/layouts.dat" 
								  (asdf:component-pathname (asdf:find-system :yoi))))
				  (loop for line = (read-line stream nil 'EOF)
					until (eq line 'EOF)
					do (progn			       
					     (<ucw:option :value (subseq line 0 1 ) (<:as-html (subseq line 2)))))))
		   ;;En el elemento submit se crea un boton para elegir el layout y realiza un answer para ver el resultado que tiene stylesheet
		   (<ucw:submit :value "Set layout >>"		 
				:style "cursor:pointer"				 			     
				:action (answer stylesheet)))))))
#|				
(<:div :id "boton"
       (<ucw:a :class "boton"
	       :action (call-component $contenido (make-instance 'paginas-web)) "Paginas Web"))		  
|#


