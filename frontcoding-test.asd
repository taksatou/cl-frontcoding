#|
  This file is a part of frontcoding project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage frontcoding-test-asd
  (:use :cl :asdf))
(in-package :frontcoding-test-asd)

(defsystem frontcoding-test
  :author "Takayuki Sato"
  :license "LLGPL"
  :depends-on (:frontcoding
               :cl-test-more
               :split-sequence)
  :components ((:module "t"
                :components
                ((:file "frontcoding"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
