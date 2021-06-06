(defun consR (L e)

(setq lst (cons e ()))

(setq L (reverse L))

(dolist (x L) (setq lst (cons x lst)))

lst
)

(defun filter (lst p)
(if(not(listp lst))
(return-from filter nil))
(if(not(integerp p))
(return-from filter nil))
(setq ln (list-length lst))
(if(and(> p  0) (and(> ln 0) (every 'integerp lst)))
(remove-all-small lst p)
)
)
(defun remove-all-small (lst elt)
(if (null lst)
nil
(if (< (car lst) elt)
(remove-all-small (cdr lst) elt)
(cons (car lst) (remove-all-small (cdr lst) elt)))))
