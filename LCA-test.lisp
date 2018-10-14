(defpackage LCA-test
	(:use :LCA :lisp-unit :cl :bst)
	(:export :*tree* :*tree2*))


(in-package LCA-test)
(defparameter *tree* (bst-from-values '(4 2 6 1 3 5 7)))			;			4
																	;		   / \
																	;		  2   6
																	;		 / \ / \
																	;		1  3 5  7
(defparameter *tree2* (bst-from-values '(nil)))
(define-test test-LCA
	(assert-equal nil (LCA *tree* 390543 2))
	(assert-equal nil (LCA *tree* 31294 20392))
	(assert-equal 4 (LCA *tree* 2 7))
	(assert-equal 2 (LCA *tree* 1 3))
	(assert-equal 4 (LCA *tree* 3 5))
	(assert-equal 4 (LCA *tree* 2 6))
	(assert-equal 4 (LCA *tree* 2 4))
	(assert-equal 6 (LCA *tree* 6 7))
	(assert-equal 4 (LCA *tree* 4 4))
	(assert-equal 1 (LCA *tree* 1 1))
	(assert-equal nil (LCA nil 10 5))
	(assert-equal nil (LCA *tree2* 10 5))
	(assert-equal nil (LCA *tree* nil nil))
	(assert-equal nil (LCA nil nil nil)))