(defpackage :unit-test
	(:use :lisp-unit :cl-user :sum-package))

(in-package :unit-test)

(define-test test-sum
	(assert-equal 5 (sum 3 2))
	(assert-equal 10 (sum 9 1)))