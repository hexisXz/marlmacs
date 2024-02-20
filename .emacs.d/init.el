;;enable line numbers
(global-display-line-numbers-mode 1)


(add-hook 'after-init-hook 'global-company-mode)

(setq font-lock-maximum-decoration t)


(add-to-list 'default-frame-alist '(alpha-background . 80))


(setq prettify-symbols-alist nil)

;; load config files
(load-file "~/.config/marlmacs/config/packages.el")

(load-file "~/.config/marlmacs/config/keybinds.el")

(load-file "~/.config/marlmacs/config/startpage.el")

(load-file "~/.config/marlmacs/config/themes.el")

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

