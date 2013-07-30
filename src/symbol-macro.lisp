(in-package #:ws.ikki.yoi)

;;; Symbol macro que asigna un numero al post.
(define-symbol-macro $topic-id (get-session-value :topic-id))

;;; Symbol macro  que manipula el entorno en el que se atiende a la peticion,
;;; es decir manipula la sesion del cliente usando la key :usersession que esta llave la hemos definido con ese nombre.
(define-symbol-macro $usersession (get-session-value :usersession))

;;; Regresa el entorno en el que se atiende a la peticion (mas reciente) 
;;; "window component" en el contexto de la sesion (*context*).
(define-symbol-macro $window (context.window-component *context*))

;;; El "window-body" es el accessor del slot >> body << del componente "standard-window-component".
;;; Entonces al definir el symbol-macro >> $body << le estamos pasando la informacion al componente "standard-window-component"
;;; en su slot >> body <<  con el contexto de la sesion de >> $window <<  actual.
(define-symbol-macro $body (window-body $window))

;;; Se define el symbol-macro $menus, que se le pasa el componente llamado "menus" al slot >> body << de "standard-window-component"
;;; con el contexto de la sesion actual.
(define-symbol-macro $menus (menus $body))

;;; Se define el symbol-macro $menus, que se le pasa el componente llamado "contenido" al slot >> body << de "standard-window-component"
;;; con el contexto de la sesion actual.
(define-symbol-macro $contenido (contenido $body))
