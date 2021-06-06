(defun consR (L e)

(setq lst (cons e ()))

(setq L (reverse L))

(dolist (x L) (setq lst (cons x lst)))

lst
)

(defun filter (lst p)
(setq ln (list-length lst))
(if(and (and(> p  0)(integerp p )) (and(> ln 0) (every 'integerp lst)))
(remove-if (lambda (item) (< item p)) lst)
nil)
)