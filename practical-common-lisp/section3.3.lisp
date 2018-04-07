;; (defun dump-db ()
;;   (dolist (cd *db*)
;;     (format t "~{~a:~10t~a~%~}~%" cd)))

(defun dump-db ()
  (format t "~{~{~a:~10t~a~%~}~%~}" *db*))
