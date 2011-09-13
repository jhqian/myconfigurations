;; -*- Emacs-Lisp -*-
(setq c-default-style "linux")

;; show parenthesis
(show-paren-mode 1)

;; show column number
(column-number-mode 1)
(line-number-mode 1)

(defun linux-c-mode-set-settings ()
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with Linux kernel."
  (interactive)
  (c-mode)
  (linux-c-mode-set-settings))

(defun gnu-c-mode-set-settings ()
  (c-set-style "gnu")
  (setq indent-tabs-mode nil))

(defun gnu-c-mode ()
  "GNU-style C mode, with tabs as spaces."
  (interactive)
  (c-mode)
  (gnu-c-mode-set-settings))

(defun stroustrup-c-mode-set-settings ()
  (c-set-style "Stroustrup")
  (setq tab-width 4
	indent-tabs-mode t))

(defun stroustrup-c-mode ()
  "Stroustrup-style C/C++ mode, 4 spaces tabs."
  (interactive)
  (c++-mode)
  (stroustrup-c-mode-set-settings))

(add-hook
 'text-mode-hook
 '(lambda ()
    (setq indent-line-function 'tab-to-tab-stop)))

(add-hook
 'text-mode-hook
 '(lambda ()
    (local-set-key "\r" 'newline-and-indent)
    (when (fboundp 'column-marker-1)
      (column-marker-1 79))
    (setq show-trailing-whitespace t
	  indent-tabs-mode nil)))

(add-hook
 'c-mode-common-hook
 '(lambda ()
    (local-set-key "\r" 'newline-and-indent)
    (when (fboundp 'column-marker-1)
      (column-marker-1 79))
    (setq show-tailing-whitespace t)))

(add-hook
 'c-mode-hook
 '(lambda ()
    (linux-c-mode-set-settings)))

(add-hook
 'c++-mode-hook
 '(lambda ()
    ;; (stroustrup-c-mode-set-settings)))
    (linux-c-mode-set-settings)))

