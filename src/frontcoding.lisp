#|
  This file is a part of frontcoding project.
  Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage frontcoding
  (:use :cl)
  (:shadow :push))

(in-package :frontcoding)

(cl-annot:enable-annot-syntax)

@export
(defclass frontcoding ()
  ((lis :initform ())
   (previous-string :initform "")))

@export
(defmethod push ((obj string) (place frontcoding))
  (cl:push (encode (slot-value place 'previous-string) obj)
           (slot-value place 'lis))
  (setf (slot-value place 'previous-string) obj))

@export
(defun encode (prev str)
  (with-output-to-string (ss)
    (let ((siz (min (length prev) (length str)))
          (pos))
      (setf pos (dotimes (n siz)
                  (unless (eql (elt prev n) (elt str n)) (return n))))
      (unless pos (setf pos siz))
      (format ss "~a~a" (encode-vb pos) (subseq str pos)))))

@export
(defun decode (prev str)
  (with-output-to-string (ss)
    (let* ((siz (decode-vb str)))
      (format ss "~a~a" (subseq prev 0 siz) (subseq str (length (encode-vb siz)))))))

@export
(defmacro do-strings ((var obj) &body body)
  (let ((prev (gensym))
        (str (gensym)))
    `(let ((,prev ""))
       (dolist (,str (reverse (slot-value ,obj 'lis)))
         (let ((,var (decode ,prev ,str)))
           (setf ,prev ,var)
           ,@body)))))

@export
(defmethod call-with-each-strings (fn (obj frontcoding))
  (let ((prev ""))
    (dolist (s (reverse (slot-value obj 'lis)))
      (let ((decoded (decode prev s)))
        (setf prev decoded)
        (funcall fn decoded)))))

(defun encode-vb (x)
  (if (eql x 0) " " (cl-pack:pack "w" x)))

(defun decode-vb (x)
  (cl-pack:unpack "w" x))
