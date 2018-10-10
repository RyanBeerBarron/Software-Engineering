(defpackage LCA-test
	(:use :LCA :lisp-unit :cl :bst)
	(:export :*tree*))


(in-package LCA-test)
(defparameter *tree* (bst-from-values '(4 2 6 1 3 5 7)))
(print *tree*)

(define-test test-LCA
	(assert-equal nil (LCA *tree* 390543 2))
	(assert-equal 10 (LCA *tree* 2 7))
	(assert-equal 10 (LCA *tree* 1 3))
	(assert-equal 4 (LCA *tree* 2 7))
	(assert-equal 2 (LCA *tree* 1 3)))