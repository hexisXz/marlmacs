;; enable/install use package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


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

(add-hook 'my-pretty-language-hook 'turn-on-pretty-mode)


(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/"))
      use-package-always-ensure t)

(package-initialize)

(require 'use-package-ensure)

(use-package quelpa
  :ensure)

(use-package quelpa-use-package
  :demand
  :config
  (quelpa-use-package-activate-advice))


(require 'quelpa)


(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")

(require 'eaf)

(require 'eaf-browser)

(require 'eaf-video-player)


(setq package-archives '(("gnu-devel" . "https://elpa.gnu.org/devel/")
                         ("nongnu-devel" . "https://elpa.nongnu.org/nongnu-devel/")))



(add-to-list 'load-path "/home/hexis/.emacs.d/xelb/")
(add-to-list 'load-path "/home/hexis/.emacs.d/exwm/")
(add-to-list 'load-path "/home/hexis/.emacs.d/")


(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'exwm)
(require 'exwm-config)
(exwm-config-example)

