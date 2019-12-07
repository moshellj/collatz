#!/usr/bin/sbcl --script

; Let it never be said that lisp has intuitive array/list access operations. ;

(defvar temp 0)
;;bubble sort, largest to smallest. couldn't figure out the standard sort.
(defun bubblesort (seq)
	(loop for a in '(8 7 6 5 4 3 2 1 0) do
		(loop for b from 0 to a do
			(if (< (elt (elt seq b) 0) (elt (elt seq (+ b 1)) 0)) (progn
				(setf temp (elt seq b))
				(setf (elt seq b) (elt seq (+ b 1)))
				(setf (elt seq (+ b 1)) temp)
			))
		)
	)
)

;;; Lisp is just utterly bizare. this is an if-elseif-else statement. Could you tell at a glance? (no)
(defun getlength (i)
	(cond 
		((<= i 1) 0)
		( (oddp i) (+ 1 (getlength (+ 1 (* i 3)))) )
		(t (+ 1 (getlength (/ i 2))) )
	)
)

; LISP features arbitrary-size integers by default.
(defvar len 0)
(defvar minlen 0)
(defvar biggest (make-list 10 :initial-element '(0 0)))
;calculate
(dotimes (n 1000000)
	(setq len (getlength n))
	;tracking
	(when (>= len minlen)
		(setf (elt biggest 9) (list len n))
		(bubblesort biggest)
		(setf minlen (elt (elt biggest 9) 0))
		;(print n) (princ " -> ") (princ len) (princ ", ") (princ minlen)
	)
)
;print
(princ "Largest Elements:") (terpri)
(loop for el in biggest do
	(princ "Number = ") (princ (elt el 1)) (princ ", Length = ") (princ (elt el 0)) (terpri)
	;swap
	(setf temp (elt el 0))
	(setf (elt el 0) (elt el 1))
	(setf (elt el 1) temp)
)
(bubblesort biggest)
(princ "By size:") (terpri)
(loop for el in biggest do
	(princ "Number = ")(princ (elt el 0))(princ ", Length = ")(princ (elt el 1))(terpri)
)
