(add-to-list 'custom-theme-load-path "~/.config/hexmacs/atom-one-dark-theme")

;;(load-theme 'doom-one t) ;; doom-one theme

;;(load-theme 'dracula t) ;; dracula theme

;;(load-theme 'zeno t) ;; zeno theme

(load-theme 'atom-one-dark t) ;; atom theme

;;(load-theme 'one-dark t) ;; one theme

(menu-bar-mode -1)

(tool-bar-mode -1)

;; install evil-mode
(use-package evil
  :ensure t)


;; install org-mode
(use-package org
  :ensure t)


;; install lua-mode
(use-package lua-mode
  :ensure t)

;; install go-mode
(use-package go-mode
  :ensure t)

;; install doom-themes
(use-package doom-themes
  :ensure t)

;; install one-dark theme
(use-package atom-one-dark-theme
  :ensure t)

;; enable org mode
(require 'org)

;; enable syntax hightlighting for go
(add-to-list 'auto-mode-alist '("\.go\'" . go-mode))

;; enable lua-mode
(require 'lua-mode)

;; enable/install use package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;;(require 'exwm)
;;(require 'exwm-config)
;;(exwm-config-example)

;; find files
(global-set-key (kbd "M-f") 'find-file)

;; file manager
(global-set-key (kbd "M-d") 'dired)

;; browser
(global-set-key (kbd "M-w") 'eww)

;; buffers
(global-set-key (kbd "M-b") 'switch-to-buffer)

;; split the window right
(global-set-key (kbd "M-\r") 'split-window-right)

;; split the window down
(global-set-key (kbd "M-s") 'split-window-below)

;; close a window
(global-set-key (kbd "M-C") 'delete-window)

;; org tangel
(global-set-key (kbd "M-o") 'org-babel-tangle)

;; reload hexmacs
(defun load-init-file ()
  "Load the init.el file."
  (interactive)
  (load-file (expand-file-name "~/.emacs.d/init.el")))

(global-set-key (kbd "M-l") 'load-init-file)
(global-set-key (kbd "M-p") 'org-export-dispatch)

(defvar start-image "~/.config/hexmacs/emacs3.png")

(defun start ()
  (interactive)
  (switch-to-buffer (get-buffer-create "*start*"))
  (erase-buffer)
  (let ((image (create-image start-image)))
    (insert-image image)
    (newline))
  (insert "Welcome to hexmacs\n\n")
  (insert "Here are some useful keybinds:\n")
  (insert "\n- C-x-C-f or M-f for the file manager\n")
  (insert "- alt + x to run other commands\n")
  (insert "- C-x-C-b or M-b to see all buffers\n")
  (insert "- shift + Z + Z to save and quit\n")
  (insert "- C-x-3 or M-ENTER to split windows\n")
  (insert "- M-SHIFT-C to close split windows\n")
  (insert "- M-s to open a window below\n")
  (insert "- M-w to open the emacs browser\n")
  (insert "- M-o to run org tangle in a org doc\n")
  (insert "- M-l to reload emacs\n"))


(setq initial-buffer-choice 'start)

;;; Startup
;;; PACKAGE LIST
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;;; UNDO
;; Vim style undo not needed for emacs 28
(use-package undo-fu)

;;; Vim Bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b54bf2fa7c33a63a009f249958312c73ec5b368b1094e18e5953adb95ad2ec3a" default))
 '(package-selected-packages
   '(circe xwidgets-reuse exwm-x exwm one-dark one-themes melancholy-theme atom-one-dark-theme zeno-theme highlight-numbers evil-visual-mark-mode org-modern lua-mode mpv emms mu4easy doom-themes go-mode dracula-theme evil-collection evil undo-fu use-package exec-path-from-shell epl)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
