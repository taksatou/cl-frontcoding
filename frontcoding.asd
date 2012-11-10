#|
  This file is a part of frontcoding project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

#|
  Author: Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage frontcoding-asd
  (:use :cl :asdf))
(in-package :frontcoding-asd)

(defsystem frontcoding
  :version "0.1"
  :author "Takayuki Sato"
  :license "LLGPL"
  :depends-on (:cl-annot :cl-pack)
  :components ((:module "src"
                :components
                ((:file "frontcoding"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op frontcoding-test))))
