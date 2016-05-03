(in-package :defpackage+-user-1)

(defpackage+ :laconic
  (:use #:cl #:alexandria)
  (:export-only

   ;; list
   #:akey #:aval #:alist-bind #:alist #:alist*

   ;; string
   #:substr #:string+ #:string-join

   ;; time
   #:get-real-time-seconds #:get-run-time-seconds

   ;; asdf
   #:asdf-path

   ;; with
   #:with))
