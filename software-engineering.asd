#|
  This file is a part of Software-Engineering project.
|#

(defsystem "software-engineering"
  :version "0.1.0"
  :author "Ryan Barron"
  :license ""
  :serial t
  :depends-on ("cl-digraph" 
               "prove")
  :components ((:file "packages")
                (:module "src"
                :components
                ((:file "software-engineering"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "software-engineering-test"))))
