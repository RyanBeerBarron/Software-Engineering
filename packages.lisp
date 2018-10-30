(defpackage software-engineering
  (:use :cl))


(defpackage software-engineering-test
  (:use :cl
        :software-engineering
        :prove)
  (:export :*graph*))
