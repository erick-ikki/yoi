(in-package #:ws.ikki.yoi)

;;; Funcion que checa las credenciasles en la base de datos

(defaction check-login (user password)
  (if (find-user user password)
      (progn
	;; Si el resultado de la funcion find-user es verdadero se le asigna una sesion al usuario y se llama al componente "main-component"
	(setf $usersession user)
	(call 'main-component ))
      ;; Si el resultado de la funcion find-user es falso  se llama al componente "login-post"
      (call 'login-post)))