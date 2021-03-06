# Frontcoding

front coding common lisp implementation.

http://en.wikipedia.org/wiki/Incremental_encoding

## Usage

```
CL-USER> (ql:quickload :frontcoding)
To load "frontcoding":
  Load 1 ASDF system:
    frontcoding
; Loading "frontcoding"
..................................................
[package frontcoding].
(:FRONTCODING)
CL-USER> (defparameter *f* (make-instance 'frontcoding:frontcoding))
*F*
CL-USER> (frontcoding:push "abc" *f*)
"abc"
CL-USER> (frontcoding:push "abcd" *f*)
"abcd"
CL-USER> (frontcoding:push "accd" *f*)
"accd"
CL-USER> (describe *f*)
#<FRONTCODING:FRONTCODING {1004A037E3}>
  [standard-object]

Slots with :INSTANCE allocation:
  LIS              = ("^Accd" "^Cd" "^@abc")
  PREVIOUS-STRING  = "accd"
; No value
CL-USER> (frontcoding:do-strings (s *f*) (format t "~a~%" s))
abc
abcd
accd
NIL
```

## Installation



## Author

* Takayuki Sato (takayuki.sato.dev@gmail.com)

## Copyright

Copyright (c) 2012 Takayuki Sato (takayuki.sato.dev@gmail.com)

# License

Licensed under the LLGPL License.
