(defpackage software-engineering
  (:use :cl)
  (:export :LCA))


(defpackage software-engineering-test
  (:use :cl
        :software-engineering
        :prove)
  (:export :*graph*))
