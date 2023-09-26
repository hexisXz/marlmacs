;;enable line numbers
(global-display-line-numbers-mode 1)


(add-to-list 'custom-theme-load-path "~/.config/marlmacs/")

;;(load-theme 'dracula t) ;; dracula theme

;;(load-theme 'zeno t) ;; zeno theme

(load-theme 'marlmacs t) ;; atom theme

;;(load-theme 'one-dark t) ;; one theme

(menu-bar-mode -1)

(tool-bar-mode -1)

(add-hook 'after-init-hook 'global-company-mode)

(setq font-lock-maximum-decoration t)


(add-to-list 'default-frame-alist '(alpha-background . 80))


(setq prettify-symbols-alist nil)



;; install rainbow-mode
(use-package rainbow-mode
  :ensure t)

;; == irony-mode ==
(use-package irony
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  )

;; == company-mode ==
(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony :ensure t :defer t)
  (setq company-idle-delay              nil
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	company-backends                '((company-irony company-gtags))
	)
  :bind ("C-;" . company-complete-common)
  )


;; install lsp
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))



;; install evil-mode
(use-package evil
  :ensure t)

;; install dashboard
(use-package dashboard
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

;; enable org mode
(require 'org)

;; enable syntax hightlighting for go
(add-to-list 'auto-mode-alist '("\.go\'" . go-mode))

;; enable lua-mode
(require 'lua-mode)

;; enable rainbow-mode
(require 'rainbow-mode)

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

;; display image in dired 
(global-set-key (kbd "M-i") 'image-dired-display-thumbs)

;; term
(global-set-key (kbd "M-t") 'ansi-term)

;; new buffer
(global-set-key (kbd "M-N") (lambda () (interactive) (switch-to-buffer (generate-new-buffer "scratch-pad")) (other-window 1)))

;; kill buffer
(global-set-key (kbd "M-K") 'kill-buffer)

;; open custom buffer
(global-set-key (kbd "M-j") 'create-custom-buffer)


(defun my-insert-content ()
  (insert "insert text: "))

(defun create-custom-buffer ()
  (interactive)
  (let ((buf (generate-new-buffer "custom-buffer")))
    (pop-to-buffer buf)
    (my-insert-content)
    buf))



;; reload marlmacs
(defun load-init-file ()
  "Load the init.el file."
  (interactive)
  (load-file (expand-file-name "~/.emacs.d/init.el")))

(global-set-key (kbd "M-l") 'load-init-file)
(global-set-key (kbd "M-p") 'org-export-dispatch)

;;(defvar start-image "~/.config/marlmacs/emacs3.png")

;;(defun start ()
;;  (interactive)
;;  (switch-to-buffer (get-buffer-create "*start*"))
;;  (erase-buffer)
;;  (let ((image (create-image start-image)))
;;    (insert-image image)
;;    (newline))
;;  (insert "Welcome to marlmacs\n\n")
;;  (insert "Here are some useful keybinds:\n")
;;  (insert "\n- C-x-C-f or M-f for the file manager\n")
;;  (insert "- alt + x to run other commands\n")
;;  (insert "- C-x-C-b or M-b to see all buffers\n")
;;  (insert "- shift + Z + Z to save and quit\n")
;;  (insert "- C-x-3 or M-ENTER to split windows\n")
;;  (insert "- M-SHIFT-C to close split windows\n")
;;  (insert "- M-s to open a window below\n")
;;  (insert "- M-w to open the emacs browser\n")
;;  (insert "- M-o to run org tangle in a org doc\n")
;;  (insert "- M-l to reload marlmacs\n")
;;  (insert "- M-N to open a scratchpad\n")
;;  (insert "- M-K to kill a buffer\n"))


;; start page
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Set custom logo path
(setq dashboard-startup-banner '"~/.config/marlmacs/marlmacs.png")
(setq dashboard-banner-logo-title "Welcome to Marlmacs")

(setq dashboard-items '((recents . 5)
                       (bookmarks . 5)
                       (projects . 5)))


;;(setq initial-buffer-choice 'start)

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
   '(pretty-mode all-the-icons rainbow-mode company-irony company irony auto-complete circe xwidgets-reuse exwm-x exwm one-dark one-themes melancholy-theme atom-one-dark-theme zeno-theme highlight-numbers evil-visual-mark-mode org-modern lua-mode mpv emms mu4easy doom-themes go-mode dracula-theme evil-collection evil undo-fu use-package exec-path-from-shell epl))
 '(warning-suppress-log-types '(((evil-collection)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )






(use-package pretty-mode
  :ensure t)


(global-pretty-mode t)

(add-hook 'my-pretty-language-hook 'turn-on-pretty-mode)





set-face-attribute 'default nil
		:family "JetBrainsMono Nerd Font Mono"
                :height 300)





defun my/org-mode/load-prettify-symbols ()
  (interactive)
  (setq prettify-symbols-alist
    '(("#+begin_src" . ?)
      ("#+BEGIN_SRC" . ?)
      ("#+end_src" . ?)
      ("#+END_SRC" . ?)
      ("#+begin_example" . ?)
      ("#+BEGIN_EXAMPLE" . ?)
      ("#+end_example" . ?)
      ("#+END_EXAMPLE" . ?)
      ("#+header:" . ?)
      ("#+HEADER:" . ?)
      ("#+name:" . ?﮸)
      ("#+NAME:" . ?﮸)
      ("#+results:" . ?)
      ("#+RESULTS:" . ?)
      ("#+call:" . ?)
      ("#+CALL:" . ?)
      (":PROPERTIES:" . ?)
      (":properties:" . ?)
      (":LOGBOOK:" . ?)
      (":logbook:" . ?)))
  (prettify-symbols-mode 1))




(add-hook 'org-mode-hook 'my/org-mode/load-prettify-symbols)



setq org-ellipsis " ")

