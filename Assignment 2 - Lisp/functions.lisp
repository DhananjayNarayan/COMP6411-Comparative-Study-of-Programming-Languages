;Function 1
(defun consR (L e)
(let ((ret 0)) 
(if (> (length L) 1)
(progn
(setq ret (consR (cdr L) e))
(cons (car L) ret)
)
(cons (car L) (cons e ()))
)
))


;Function 2
(defun fn(arg)
(cond((numberp arg) #'+)
((listp arg) #'append)))
(defun combine(&rest args)
(apply(fn(car args)) args))

;Function 3
(defun combine-max(list1 list2)
 (cond((null list1)list2)
 ((null list2)list1)
 (( > (car list1)(car list2))(cons(car list1)(combine-max(cdr list1)(cdr list2))))
 (t (cons (car list2)(combine-max(cdr list1)(cdr list2))))
 ))

;Function 4
(defun dist(n lst)
(if (null lst)
nil
(cons (list n (car lst)) (dist n (cdr lst)))
))


;Function 5
(defun rem-if-dupl (list1)
(cond ((null list1) nil)
((member (car list1) (cdr list1)) (rem-if-dupl (my-remove (car list1) (cdr list1))))
(T (cons (car list1) (rem-if-dupl (cdr list1))))
))
(defun my-remove (element list)
(cond
((null list) list)
((eql element (car list)) (my-remove element (cdr list)))
((list* (car list) (my-remove element (cdr list))))))

;Function 6
(defun oseq (num &optional current)
(let ((lst ())) 
(if (<= num 1) nil)
(if (> num 1)
(progn
(if current
(progn
(if (< current num)
(progn
(setq lst (oseq num (+ current 2)))
(cons current lst))
lst))
(progn
(setq lst (oseq num 1))))))))


;Function 7
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

;Function 8
(defun is-bst (tree)
(let ((result "yes")) 
(let ((lright 0)) 
(let ((lleft 0)) 
(let ((root 0)) 


(setq lright (car(cdr (cdr tree))))
(setq lleft (car (cdr tree)))
(setq root (car tree))

(if lleft
(progn 
(if (<= (car lleft) root)
(setq result (is-bst lleft))
(setq result "no")
)
))

(if lright
(progn 
(if (< root (car lright) )
(setq result (is-bst lright))
(setq result "no")
)
))

result
)))))


;Function 9
(defun height (tree)
(let ((lright 0)) 
(let ((lleft 0)) 
(let ((depthr 0)) 
(let ((depthl 0)) 
(setq lright (length (car(cdr (cdr tree)))))
(setq lleft (length (car (cdr tree))))
(if (= 0 lright lleft) 
(+ 0 0) 
(progn
    (setq depthr (height (car(cdr (cdr tree)))))
    (setq depthl (height (car (cdr tree))))
    (if (> depthl depthr)
    (+ depthl 1)
    (+ depthr 1))
)))))))


;Function 10
(defun PostorderTraversal (tree)
(let ((lright 0)) 
(let ((lleft 0)) 
(let ((root 0)) 
(let ((returnValue ())) 
(let ((leftValue 0)) 
(let ((rightValue 0)) 

(setq lright (car(cdr (cdr tree))))
(setq lleft (car (cdr tree)))
(setq root (car tree))

(if root 
(progn 
    (setq leftValue (PostorderTraversal lleft))
    (if leftValue (setq returnValue(append leftValue returnValue)))
    (setq rightValue (PostorderTraversal lright))
    (if rightValue (setq returnValue(append rightValue returnValue)))
    (setq returnValue(cons root returnValue))
    returnValue
)
nil
))))))))
