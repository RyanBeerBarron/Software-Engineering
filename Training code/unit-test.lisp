(defpackage :test
	(:use :common-lisp-user :common-lisp :lisp-unit :sum-package))

(in-package :test)

(define-test test-sum
	(assert-equal 5 (sum 3 2))
	(assert-equal 10 (sum 9 1)))