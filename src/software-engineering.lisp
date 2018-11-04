(in-package :software-engineering)
(defparameter *testgraph* (digraph:make-digraph :initial-vertices '(1 2 3 4 5 6 7 8 9)))

(defun LCA (digraph vertex1 vertex2)
	(if (eq digraph nil) (return-from LCA nil) ())
	(if (or (digraph:emptyp digraph)
			(not (digraph:contains-vertex-p digraph vertex1))
			(not (digraph:contains-vertex-p digraph vertex2))
			(eq vertex1 nil)
			(eq vertex2 nil))
		nil
		(if (digraph:reachablep digraph vertex1 vertex2)
			(return-from LCA vertex1)
			(if (digraph:reachablep digraph vertex2 vertex1)
				(return-from LCA vertex2)
				(progn 
				(let ((pred1 '())
					  (pred2 '())
			  		  (graph (digraph:copy-digraph digraph)))
				(setf pred1 (ancestor_list graph vertex1 pred1))
				(setf pred2 (ancestor_list graph vertex2 pred2))
				(let* ((ancestors (intersection pred1 pred2))
					   (vertex-to-remove (set-difference (digraph:vertices graph) ancestors)))
					(if (= 0 (length ancestors))
						(return-from LCA nil)
						(if (= 1 (length ancestors))
							(return-from LCA (nth 0	ancestors))
							(progn 
								(loop for v in vertex-to-remove do
								 	(digraph:remove-vertex graph v))
								(let ((leaf (digraph:leafs graph)))
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