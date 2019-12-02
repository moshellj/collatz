#!/usr/bin/sbcl --script

; LISP features arbitrary-size integers by default.
(defvar i 1)
(defvar len 0)
(defvar maxlen 0)
;calculate
(dotimes (n 1000000)
	(setq i n)
	(setq len 0)
	(loop
		(if (oddp i)
			(setq i (+ 1 (* i 3)))
			(setq i (/ i 2))
		)
		(incf len)
		(unless (> i 1) (return))
	)
	;tracking
	(when (> len maxlen)
		(setq maxlen len)
		(print len)
	)
)
