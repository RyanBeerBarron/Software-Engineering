(in-package :software-engineering)

(defun LCA (digraph vertex1 vertex2)
	(if (or (digraph:emptyp digraph)
			(not (digraph:contains-vertex-p digraph vertex1))
			(not (digraph:contains-vertex-p digraph vertex2))
			(eq vertex1 nil)
			(eq vertex2 nil)
			(eq digraph nil))
		nil
		()
		))