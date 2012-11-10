#|
  This file is a part of frontcoding project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage frontcoding-test
  (:use :cl
        :frontcoding
        :cl-test-more)
  (:shadow :push))
(in-package :frontcoding-test)

(plan 7)

(loop for dat in '(("abc" "abc")
                   ("abc" "qwe")
                   ("" "")
                   ("abc" "")
                   ("" "abc")
                   ("aaa" "abc"))
     do (let ((prev (car dat))
              (str (cadr dat)))
          (is str (decode prev (encode prev str)))))

(let ((dat (split-sequence:split-sequence #\Space "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
      (f (make-instance 'frontcoding))
      (result))
  (loop for s in dat do (frontcoding:push s f))
  (do-strings (s f) (cl:push s result))
  (is dat (reverse result)))

(finalize)
