;;;; blog.asd

(asdf:defsystem #:yoi
  :serial t
  :description "Yoi is a personal Blog Software using UCW"
  :author "Erick Lopez <erick@ikki.ws>"
  :license "BSD Two Clause  (Simplified BSD License aka FreeBSD License. See the LICENCE file."
  :depends-on (#:postmodern
               #:ucw-core
               #:ucw
               #:iolib
               #:cl-ppcre
               #:parenscript)
  :components ((:module :src 
		:components ((:file "package")
			     (:file "symbol-macro" :depends-on ("package"))
			     (:file "blog-func-lib" :depends-on ("package"))
			     (:file "web-server" :depends-on ("package"))
			     (:file "with-database")
			     (:file "blog")
			     (:file "menu-componente")
			     (:file "agregar-post")
			     (:file "post-id")
			     (:file "componente-editar-post")
			     (:file "añadir-post")
			     (:file "eliminar-post")
			     (:file "add-topic-component")
			     (:file "editar-usuario")
			     (:file "agregar-nuevo")			    
			     (:file "style-post-component")
			     (:file "login-post-component")
			     (:file "bookmark-found-component")
			     (:file "bookmark-search-component")
			     (:file "show-all-abstract-component")
			     (:file "show-by-topic-component")
			     (:file "bookmark-content-component")
			     (:file "topic-posts-func-lib")
			     (:file "add-post")
			     (:file "found-post")
			     (:file "view-post-alone")
			     (:file "edit-post-update")
			     (:file "topic-func-lib")
			     (:file "add-topic-db")
			     (:file "delete-post")
			     (:file "login-func-lib")
			     (:file "check-login")
			     (:file "set-stylesheet")
			     (:file "logout")
			     (:file "search-delete-component")
			     (:file "search-post-component")			     
			     (:file "blog-header-2col-footer")
			     (:file "layout-post-component")
			     (:file "set-layout-and-stylesheet")))))
