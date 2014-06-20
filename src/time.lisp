(in-package :laconic)

(defun get-real-time-seconds ()
  (/ (get-internal-real-time)
     (coerce internal-time-units-per-second 'float)))

(defun get-run-time-seconds ()
  (/ (get-internal-run-time)
     (coerce internal-time-units-per-second 'float)))
