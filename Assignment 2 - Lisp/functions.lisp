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
(remove-if (lambda (item) (< item p)) lst)
)
)
