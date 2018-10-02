(defpackage sum-package
	(:use :common-lisp :common-lisp-user)
	(:export :sum ))

(in-package sum-package)

(defun sum (x y)
	(+ x y))