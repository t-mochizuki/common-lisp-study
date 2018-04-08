;; (reverse '(1 2 3))

(defmacro backwards (expr) (reverse expr))

;; (backwards ("hello, world" t format))

;; (equal (getf cd :title) title)
;; (equal (getf cd field) value)

;; (defun make-comparison-expr (field value)
;;   (list 'equal (list 'getf 'cd field) value))

;; (make-comparison-expr :rating 10)
;; (make-comparison-expr :title "Give Us a Break")

(defun make-comparison-expr (field value)
  `(equal (getf cd ,field) ,value))

(defun make-comparison-list (fields)
  (loop while fields
     collecting (make-comparison-expr (pop fields) (pop fields))))

(defmacro where (&rest clauses)
  `#'(lambda (cd) (and ,@ (make-comparison-list clauses))))

(where :title "Give Us a Break" :ripped t)
(select (where :title "Give Us a Break" :ripped t))
