;; -*- Emacs-Lisp -*-
(require 'linum)
;(setq line-number-mode t)

(defun linum-format 
  (lambda (line)
    (propertize (format
		 (let ((w (length (number-to-string
				   (count-lines (point-min) (point-max))))))
		   (concat "%" (number-to-string w) "d "))
		 line)
		'face 'linum)))

(global-linum-mode)
(setq linum-format "%5d ")

