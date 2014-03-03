# laconic

This is a (very) small collection of "brevity" functions for common
operations.

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
* `alist &rest VALUES`: Like `LIST`, but returns an alist; e.g.,
  `(alist :x 1 y 2) => ((:x . 1) (:y . 2))`
