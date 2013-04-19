;;;; package.lisp

(defpackage #:ws.ikki.yoi
  (:use #:cl
	#:postmodern
        #:ucw-core
        #:ucw
        #:iolib
        #:cl-ppcre
        #:parenscript)
  (:shadowing-import-from :iolib :connect :disconnect)
  (:shadowing-import-from :ucw-standard :call)
  (:nicknames :yoi))
