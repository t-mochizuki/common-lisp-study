(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
   (y-or-n-p "Ripped [y/n]: ")))

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
     (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

;; * *db*

;; ((:TITLE "Lyle Lovett" :ARTIST "Lyle Lovett" :RATING 9 :RIPPED T)
;;  (:TITLE "Give Us a Break" :ARTIST "Limpopo" :RATING 10 :RIPPED T)
;;  (:TITLE "Rockin' the Suburbs" :ARTIST "Ben Folds" :RATING 6 :RIPPED T)
;;  (:TITLE "Home" :ARTIST "Dixie Chicks" :RATING 9 :RIPPED T)
;;  (:TITLE "Fly" :ARTIST "Dixie Chicks" :RATING 8 :RIPPED T)
;;  (:TITLE "Roses" :ARTIST "Kathy Mattea" :RATING 7 :RIPPED T))
