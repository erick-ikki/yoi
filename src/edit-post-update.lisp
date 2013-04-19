(in-package #:ws.ikki.yoi)

;;; Esta accion actualiza los datos del post con los datos que nos envian al momento de invocarla

(defaction edit-post-update (utpost-id utopic-id upost-name upost-author upost-abstract upost )
  (post-update utpost-id utopic-id upost-name upost-author upost-abstract upost))
