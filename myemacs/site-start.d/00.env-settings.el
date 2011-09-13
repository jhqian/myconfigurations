;; -*- Emacs-Lisp -*-
(setq user-mail-address "b32804@freescale.com")
(setq user-full-name "Ryan QIAN")

;; save place
(require 'saveplace)
(setq-default save-place t)

;; disable auto saving
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

;; disable startup message
(setq inhibit-startup-message t)

;; enable clipboard
(setq x-select-enable-clipboard t)

;; search highlight
(setq search-hightlight t)
(setq query-replace-highlight t)
(setq mouse-sel-retain-highlight t)

;; disable toolbar
(progn
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
)

;; hightlight current line
(global-hl-line-mode 1)

;; maximize window
(global-set-key [f11] 'my-fullscreen)

;; full screen
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

;; maximize window
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

;; maximized window at start up
;(my-maximized)

;; enlarge kill-ring
(setq kill-ring-max 200)

;; default fill column
(setq default-fill-column 79)

;; set scroll margin
(setq scroll-margin 7
      scroll-conservatively 10000)

(setq default-major-mode 'text-mode)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "emacs@%b")

;; enable image support
(auto-image-file-mode)

;; syntax on
(global-font-lock-mode t)

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;(server-start)

;; transparency settings
;; (set-frame-parameter (selected-frame) 'alpha '(active [<inactive>]))
;(set-frame-parameter (selected-frame) 'alpha '(85 50))
;(add-to-list 'default-frame-alist `(alpha ,85 50))

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 50))))
;(global-set-key (kbd "C-c t") 'toggle-transparency)
