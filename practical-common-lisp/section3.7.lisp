(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  (setf *db*
        (mapcar
         #'(lambda (row)
             (when (funcall selector-fn row)
               (if title    (setf (getf row :title) title))
               (if artist   (setf (getf row :artist) artist))
               (if rating   (setf (getf row :rating) rating))
               (if ripped-p (setf (getf row :ripped) ripped)))
             row) *db*)))

;; (update (where :artist "Dixie Chicks") :rating 11)
;; (select (where :artist "Dixie Chicks"))

(defun delete-rows (selector-fn)
  (setf *db* (remove-if-not selector-fn *db*)))

;; (delete-rows (where :artist "Dixie Chicks"))
