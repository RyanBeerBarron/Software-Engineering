#|
  This file is a part of Software-Engineering project.
|#

(defsystem "software-engineering-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :serial t
  :depends-on ("software-engineering")
  :components ((:module "tests"
                :components
                ((:test-file "software-engineering"))))
  :description "Test system for software-engineering"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
