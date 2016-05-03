(in-package :laconic)

(declaim (inline akey aval))
(defun akey (val alist &key (key 'identity) (test 'eq))
  "Get the key for value `VAL` in `ALIST`"
  (car (rassoc val alist :key key :test test)))

(defun aval (akey alist &key (key 'identity) (test 'eq))
  "Get the value for key `KEY` in `ALIST`"
  (cdr (assoc akey alist :key key :test test)))

(defun (setf akey) (v val alist &key (key 'identity) (test 'eq))
  (setf (car (rassoc val alist :key key :test test)) v))

(defun (setf aval) (v val alist &key (key 'identity) (test 'eq))
  (setf (cdr (assoc val alist :key key :test test)) v))

(defmacro alist-bind ((&rest vars) alist &body body)
  "Search `ALIST` and bind values to `VARS`, which may be a a list in
the form `(SYMBOL LOOKUP)`, which binds `SYMBOL` to the `AVAL` of
`LOOKUP`, or just a symbol, which is the equivalent of `(SYMBOL :SYMBOL)`.
That is, a symbol binds to a *keyword* lookup of the same symbol-name.

Note this shares the same O(n*m) efficiency as any series of ALIST
lookups."
  (once-only (alist)
    `(let (,@(mapcar (lambda (x)
                       (if (consp x)
                           `(,(car x) (aval ,(cadr x) ,alist))
                           `(,x (aval ,(make-keyword x) ,alist))))
                     vars))
       ,@body)))

(defun alist (&rest plist)
  (loop for car in plist by #'cddr
        for cdr in (cdr plist) by #'cddr
        collect (cons car cdr)))

(defun alist* (&rest plist)
  "Like `ALIST`, except the final element becomes the `CDR` of the alist,
much like `LIST*`"
  (let* ((head (cons nil nil)))
    (loop for plist-cons on plist by #'cddr
          as cons = head then (cdr cons)
          do (when (cddr plist-cons)
               (setf (car cons) (cons (car plist-cons) (cadr plist-cons)))
               (setf (cdr cons) (if (cdddr plist-cons)
                                    (cons nil nil)
                                    (caddr plist-cons)))))
    head))

