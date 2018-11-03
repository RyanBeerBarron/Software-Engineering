(in-package :software-engineering)
(defparameter *testgraph* (digraph:make-digraph :initial-vertices '(1 2 3 4 5 6 7 8 9)))

(defun LCA (digraph vertex1 vertex2)
	(if (eq digraph nil) (progn (format t "test3~%") (return-from LCA nil)) ())
	(if (or (digraph:emptyp digraph)
			(not (digraph:contains-vertex-p digraph vertex1))
			(not (digraph:contains-vertex-p digraph vertex2))
			(eq vertex1 nil)
			(eq vertex2 nil))
		(progn (format t "test4~%") (return-from LCA nil))
		(if (digraph:reachablep digraph vertex1 vertex2)
			(progn (format t "test1~%") (return-from LCA vertex1))
			(if (digraph:reachablep digraph vertex2 vertex1)
				(progn (format t "test2~%") (return-from LCA vertex2))
				(progn 
					(let   ((pred1 '())
					  		(pred2 '()))
				(setf pred1 (ancestor_list digraph vertex1 pred1))
				(setf pred2 (ancestor_list digraph vertex2 pred2))
				(let* ((ancestors (intersection pred1 pred2))
					   (vertex_to_remove (set-difference (digraph:vertices digraph) ancestors)))
					(format t "ancestors of ~a and ~a are: ~a~%" vertex1 vertex2 ancestors)
					(if (= 0 (length ancestors))
						(return-from LCA nil)
						(if (= 1 (length ancestors))
							(return-from LCA (nth 0	ancestors))
							(progn 
								(loop for v in vertex_to_remove do
								 	(digraph:remove-vertex digraph v))
								(let ((leaf (digraph:leafs digraph)))
									(if (= 1 (length leaf))
										(return-from LCA (car leaf))
										(return-from LCA leaf)))))))))))))


(defun ancestor_list (digraph vertex pred)
	(loop for predecessor in (digraph:predecessors digraph vertex) do
		(if (not (member predecessor pred))
			(progn
				(push predecessor pred)
				(setf pred (ancestor_list digraph predecessor pred)))))
	(return-from ancestor_list pred))


		
			