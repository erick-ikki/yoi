(in-package #:ws.ikki.yoi)

(defaction set-stylesheet (layout stylesheet)
  
  ;;First update the config file with the user selected preferences.
  (write-file "configfiles/layout.dat" layout)
  (write-file "configfiles/layout-css.dat" stylesheet)
  
  ;;Now update the *style* var used for the system to point to the right css file
  (setf *style* (list (concatenate 'string 
				   "static/"
				   (concatenate 'string 
						*layout-dir*
						(read-first-line-file "configfiles/layout.dat")
						"/"
						stylesheet))))
  

  ;;Here we read the current layout from the config file 
  ;;and according to that call the appropiate window component
  (cond 
    ;; For layout with  two cols
    ((equal (read-from-string (read-first-line-file "configfiles/layout.dat")) 1)
     (call-as-window 'blog-window-head-2col-footer :stylesheet *style*))
    ;; For layout with  three cols
    ((equal (read-from-string (read-first-line-file "configfiles/layout.dat")) 2)
     (call-as-window 'blog-window :stylesheet *style*))
    ;; For layout of the page ikkiware
    ((equal (read-from-string (read-first-line-file "configfiles/layout.dat")) 3)
     (call-as-window 'blog-window-content-page :stylesheet *style*))))

#|
  (setf (ucw::frame.window-component (ucw::context.current-frame *context*))
        (make-instance 'blog-window :stylesheet *style* ))
|#
