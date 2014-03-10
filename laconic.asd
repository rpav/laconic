(defpackage :laconic.asdf
  (:use #:cl #:asdf))

(in-package :laconic.asdf)

(defsystem :laconic
  :description "Succinct CL"
  :author "Ryan Pavlik"
  :license "BSD-2-Clause"
  :version "0.0"

  :depends-on (:alexandria)
  :pathname "src"
  :serial t

  :components
  ((:file "package")
   (:file "list")
   (:file "string")
   (:file "asdf")))
