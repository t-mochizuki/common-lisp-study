(defvar *db* nil)

(defun add-record (cd) (push cd *db*))

;; (add-record (make-cd "Roses" "Kathy Mattea" 7 t))
;; (add-record (make-cd "Fly" "Dixie Chicks" 8 t))
;; (add-record (make-cd "Home" "Dixie Chicks" 9 t))
