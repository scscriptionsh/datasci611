(cl-defmacro 611-chain (name init &body body)
  `(let ((,name ,init))
     ,@(cl-loop for term in body collect
                `(setq ,name ,term))
     ,name))

(defun 611-shell-command-to-lines (&rest args)
  (611-chain $ (apply #'shell-command-to-string args)
             (split-string $ (format "\n") t "[[:space:]]")))

(defun 611-list-images ()
  (611-shell-command-to-lines "find . -type f \\( -iname \"*.png\" -o -iname \"*.jpg\" -o -iname \"*.jpeg\" -o -iname \"*.gif\" \\)"))

(defun 611-insert-rpres-image ()
  (interactive)
  (let* ((files (611-list-images))
         (file (ido-completing-read "Which file? " files)))
    (insert (format "```{r, echo=FALSE}
knitr::include_graphics(%S);
```" file))))

(defun 611-smallen-region (s e)
  (interactive "r")
  (let ((r-text (buffer-substring s e)))
    (delete-region s e)
    (insert (format "<small>\n"))
    (insert r-text)
    (insert (format "\n</small>"))))

(defun 611-bash-block ()
  (interactive)
  (let ((caption (read-string "Caption: "))
        (name (read-string "Name: ")))
    (insert (format "#+CAPTION: %s
#+NAME: %s
#+begin_src bash :results org replace :exports both
" caption name))
    (save-excursion 
      (insert "#+end_src"))))
