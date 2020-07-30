;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.


;; (let ((s (current-time-string)))
;;   (format-time-string s))

;; (format-time-string "%m %d %Y" (parse-time-string ))

;; (decode-time "1998-09-12T12:21:54-0200")

;; (format-time-string "%b %d %Y" (encode-time 0 0 0 10 8 2020))

(require 'shadchen)

(defmacro let-stuff (terms &rest body)
  (match terms 
    ((list) `(progn ,@body))
    ((list* (list (p #'symbolp s)
                  expr)
            rest)
     `(let ((,s ,expr))
        (let-stuff ,rest ,@body)))
    ((list* (list* (p #'symbolp s)
                   (list* arg-list)
                   body1 body-rest)
            rest)
     `(cl-labels ((,s ,arg-list ,body1 ,@body-rest))
        (let-stuff ,rest ,@body)))))

(let-stuff ((x (+ 1 1))
            (f (x) (+ x 1)))
           (f x))




(with-current-buffer (get-buffer "README.org") 
  (let-stuff ((st (point))
              (one-day (time-subtract (encode-time 0 0 0 11 8 2020)
                                      (encode-time 0 0 0 10 8 2020)))
              (one-week (time-subtract (encode-time 0 0 0 17 8 2020)
                                       (encode-time 0 0 0 10 8 2020)))
              (join-strings (strings delim)
                            (cl-reduce (lambda (a b)
                                         (concat a delim b))
                                       strings))
              (ts (tv) (format-time-string "%m-%d-%Y" tv))
              (add-week (d)
                        (time-add d one-week))
              (add-day (d)
                       (time-add d one-day))
              (ft (&rest args)
                  (apply #'format args))
              (insert-cells (items)
                            (insert (concat "|" (join-strings items "|") (format "|\n"))))
              (insert-cells* (&rest r)
                             (insert-cells r))
              (generate-week (monday)
                             (insert (format "")))
              (date->string (d)
                            (format-time-string "%b %d (%A) %Y" d)))
             (insert-cells (list "Day" "Time" "Class Type" "Subject" "Materials" "HW"))
             (match-let ((week-date (encode-time 0 0 0 10 8 2020))
                         (weeks 0)
                         (topics *topics*))
               (cond ((>= weeks 16)
                      :done)
                     (:else
                      (insert-cells* (date->string week-date)
                                     "5:20-6:35 pm"
                                     "Lecture"
                                     (car topics)
                                     ""
                                     "")
                      (insert-cells* (date->string (add-day week-date))
                                     "3:00-4:00 pm"
                                     "Lab/Recitation"
                                     ""
                                     ""
                                     "")
                      (insert-cells* (date->string (add-day (add-day week-date)))
                                     "5:20-6:35 pm"
                                     "Lecture"
                                     (car (cdr topics))
                                     ""
                                     "")
                      (recur (add-week week-date)
                             (+ weeks 1)
                             (cdr (cdr topics))))))
             (org-cycle)))







(setq *topics* (list "Intro and Demo"
                       "Compute Resources"
                       "Programming Languages via R"
                       "Linux and Bash ..."
                       "Docker & Make & Party"
                       "Git Concepts and Practices"
                       "Putting it all Together"
                       "Most Data is Awful"
                       "Data Cleaning 2"
                       "Relational Data and Tidy Data"
                       "Agile Data Science?"
                       "Classification"
                       "Parameter Fitting and Optim"
                       "Model Val & Char"
                       "The Dark Art of Clustering"
                       "Best in Show: Gradient Boosting Machines"
                       "GBMs in Practice"
                       "Project Presentations"
                       "Shiny Introduction"
                       "Docker Recap and Shiny"
                       "Programming Languages and Python"
                       "Pandas, Dplyr, SQL 1"
                       "Pandas, Dplyr, SQL 2"
                       "Scikit Learn"
                       "A Taste of Neural Networks"
                       "Regular Expressions"
                       "Talk to Working Data Scientists"
                       "Data Science Ethics"
                       "Presentations 1"
                       "Presentations 2"))

