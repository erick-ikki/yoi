(in-package #:ws.ikki.yoi)

(defvar *db-parameters* (list "yoi_db" "yoi_dbuser" "d3f4ulty01p4ss$" "localhost" :pooled-p t))

(defmacro with-database (&body query)
  "This macro do the connection and disconnection with specified database in *db-parameter* and execute the query.
   IN: query that representing the users' query
   OUT: result of the query"
  `(postmodern:with-connection *db-parameters* ,@ query))

