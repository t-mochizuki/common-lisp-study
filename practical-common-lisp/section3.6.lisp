;; (remove-if-not #'evenp '(1 2 3 4 5 6 7 8 9 10))
;; (remove-if-not #'(lambda (x) (= 0 (mod x 2))) '(1 2 3 4 5 6 7 8 9 10))
;; (remove-if-not #'(lambda (x) (= 1 (mod x 2))) '(1 2 3 4 5 6 7 8 9 10))

(defun select-by-artist (artist)
  (remove-if-not
   #'(lambda (cd) (equal (getf cd :artist) artist))
   *db*))

;; (select-by-artist "Dixie Chicks")

(defun select (selector-fn)
  (remove-if-not selector-fn *db*))

(defun artist-selector (artist)
  #'(lambda (cd) (equal (getf cd :artist) artist)))

;; (select (artist-selector "Dixie Chicks"))

;; (defun foo (&key a b c) (list a b c))
;; (foo :a 1 :b 2 :c 3)
;; (foo :c 3 :b 2 :a 1)
;; (foo :a 1 :c 3)
;; (foo)

;; (defun foo (&key a (b 20) (c 30 c-p)) (list a b c c-p))
;; (foo :a 1 :b 2 :c 3)
;; (foo :c 3 :b 2 :a 1)
;; (foo :a 1 :c 3)
;; (foo)

(defun where (&key title artist rating (ripped nil ripped-p))
  #'(lambda (cd)
      (and
       (if title    (equal (getf cd :title) title) t)
       (if artist   (equal (getf cd :artist) artist) t)
       (if rating   (equal (getf cd :rating) rating) t)
       (if ripped-p (equal (getf cd :ripped) ripped) t))))

;; (select (where :artist "Dixie Chicks"))
