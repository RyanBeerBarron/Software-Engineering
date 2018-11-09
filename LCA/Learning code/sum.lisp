(defpackage :sum-package
	(:use :cl-user)
	(:export :sum))

(in-package :sum-package)

(defun sum (x y)
	(+ x y))
