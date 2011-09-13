;; -*- Emacs-Lisp -*-

;; remap ctrl+c ctrl+b to ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; enable session
(add-hook 'after-init-hook 'session-initialize)

;; enable kill-ring browsing
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; enable ido
(ido-mode t)