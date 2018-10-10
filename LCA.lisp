(defpackage LCA
	(:use :cl :bst)
	(:export :LCA))

(in-package LCA)

(defun LCA (tree node1 node2)
	(if (or (not (bst-search tree node1))
			(not (bst-search tree node2)))
		(quote nil)
		(quote 10)))