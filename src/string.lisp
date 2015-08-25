(in-package :laconic)

(defun substr (str start &optional end)
  "=> DISPLACED-SUBSTRING
Make a shared substring of `STR` using `MAKE-ARRAY :displaced-to`"
  (let* ((end (or end (length str)))
         (len (- end start)))
    (make-array len :element-type (array-element-type str)
                    :displaced-to str
                    :displaced-index-offset start)))

(declaim (inline string+))
(defun string+ (string &rest strings)
  "=> NEW-STRING
Concatenate string designators into a new string."
  (apply #'concatenate 'string (string string)
         (mapcar #'string strings)))

(defun string-join (list string)
  (labels ((zipper (c list)
             (when list
               (list* c (format nil "~A" (car list))
                      (zipper string (cdr list))))))
    (apply #'concatenate 'string
           (zipper "" list))))

