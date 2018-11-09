(defpackage bst-test
	(:use :cl :bst)
	(:export :*tree*))

(in-package bst-test)
(defvar *tree* (bst-from-values '(10)))
(setf *tree* (bst-add *tree* 5))
(setf *tree* (bst-add *tree* 20))

(bst-search *tree* 5)
(bst-search *tree* 3)
