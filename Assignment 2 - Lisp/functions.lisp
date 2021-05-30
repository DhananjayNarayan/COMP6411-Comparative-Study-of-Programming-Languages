#1

(defun consR (L e)

(setq lst (cons e ()))

(setq L (reverse L))

(dolist (x L) (setq lst (cons x lst)))

lst
)

;; Usage Example (print(consR(consR '(1 2) 3) 4))
;; Recursive Usage in Mathmatical Notation consR(consR({A,B},C),D) = {A,B,C,D} 
