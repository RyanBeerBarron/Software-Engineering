(in-package :software-engineering-test)
;; NOTE: To run this test file, execute `(asdf:test-system :software-engineering)' in your Lisp.

(defparameter *graph* (digraph:make-digraph :initial-vertices '(a b c d e f g h i j)))
(digraph:insert-edge *graph* 'a 'b)
(digraph:insert-edge *graph* 'a 'c)
(digraph:insert-edge *graph* 'a 'd)
(digraph:insert-edge *graph* 'b 'e)
(digraph:insert-edge *graph* 'b 'f)
(digraph:insert-edge *graph* 'e 'g)
(digraph:insert-edge *graph* 'c 'g)
(digraph:insert-edge *graph* 'e 'i)
(digraph:insert-edge *graph* 'g 'j)
(digraph:insert-edge *graph* 'c 'i)

	

(plan nil)

(is (LCA *graph* 'b 'c) 'a)
(is (LCA *graph* 'c 'd) 'a)
(is (LCA *graph* 'e 'd) 'a)
(is (LCA *graph* 'e 'f) 'b)
(is (LCA *graph* 'g 'i) (list 'c 'e))
(is (LCA *graph* 'g 'j) 'g)

(finalize)