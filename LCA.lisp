(defpackage LCA
	(:use :cl :bst)
	(:export :LCA))

(in-package LCA)

(defun LCA (tree node1 node2)
	(if (or (not (bst-search tree node1))
			(not (bst-search tree node2)))
		nil
		(let* ((max-depth (bst-max-depth tree))
			  (path1 (make-array max-depth :fill-pointer 0))
			  (path2 (make-array max-depth :fill-pointer 0)))
		(bst-path tree node1 path1)
		(bst-path tree node2 path2)
		(let ((i (if (< (length path1) (length path2))
				 	 (length path1)
				 	 (length path2))))
		(loop for j from 0 to (- i 1)
			do (if (not (= (elt path1 j) (elt path2 j)))
					(return (elt path1 (- j 1)))))))))