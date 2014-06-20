# laconic

This is a (very) small collection of "brevity" functions for common
operations.

## ASDF

* `asdf-path SYSTEM &rest PATH`: Find the pathname for `PATH` in
  `SYSTEM`, where `PATH` is a list of nested component names, e.g.:

```lisp
(defsystem :SYSTEM
  :path "x"
  :components
  ((:module "foo"
    :path "y"
    :components
    ((:static-file "bar.png")))))

(asdf-path :system "foo" "bar")
;; => #P"/full/path/to/x/y/bar.png"
```

## Strings

* `string+ STRING &rest STRINGS`: Concatenate strings.
* `substr STRING START &optional END`: Return a **shared** substring
  via displaced array.

## Lists

* `akey VAL ALIST &key KEY IDENTITY`: Get the *key* for value `VAL` in
  an alist.
* `aval AKEY ALIST &key KEY IDENTITY`: Get the *value* for key `AKEY`
  in an alist.
* `alist-bind (&rest VARS) ALIST &body BODY`: Bind a number of alist
  values to variables.  Bindings may be either `(VAR KEY)` or `VAR`,
  which will look for the *keyword* with the same symbol-name as
  `VAR`, e.g., `:foo` for `foo`.
* `alist &rest PLIST`: Like `LIST`, but returns an alist; e.g.,
  `(alist :x 1 y 2) => ((:x . 1) (:y . 2))`
* `alist* &rest PLIST`: Like `ALIST`, but the final element becomes
  the final CDR, like `LIST*`.

## General

* `with (WITH-FORMS) &body BODY`: Combine multiple WITH- blocks into
  one.  `WITH-FORMS` is in the form `NAME &rest PARAMS`, where `NAME`
  is the "rest" of the name of the with block, following "WITH-".
  E.g.,
```lisp
(with ((slots (x y) object)
       (open-file (stream "filename"))
       (gensyms (a b)))
   ...)
```
  This expands to `(WITH-SLOTS ... (WITH-OPEN-FILE ... (WITH-GENSYMS
  ...`.  Note that it is an error unless the resulting `WITH-` symbols
  already exist in the current package.

## Time

* `get-real-time-seconds` and `get-run-time-seconds` correspond to
  `get-internal-real-time` and `get-internal-run-time`, but return
  floating-point seconds instead of internal time units.
