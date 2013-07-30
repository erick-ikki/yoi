(in-package #:ws.ikki.yoi)
;; Se crea un componente para realizar el loguin
(defcomponent login-post () 
  ())

(defmethod render ((l login-post))
  (let
      ((user nil)
       (pwd nil))
    (<:div :id "page-wrap"
	   (<:div :class "login-block"
		  (<ucw:form :function (constantly t) :method "post" :class "loginform"
			     (<:p :class "plogin"
				  (<:label :for "luser" :class "llogin" "User Name")
				  (<ucw:input :type "text" :accessor user :class "inputlogin"))
			     (<:p :class "plogin"
				  (<:label :for "lpwd" :class "llogin" "Password")
				  (<:br)
				  (<ucw:input :type "password" :accessor pwd :class "inputlogin"))
			     (<ucw:submit :value " Login -->" :class "blogin" :action (check-login user pwd)))))))