;; start page
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Set custom logo path
(setq dashboard-startup-banner '"~/.config/marlmacs/marlmacs.png")
(setq dashboard-banner-logo-title "Welcome to Marlmacs")

(setq dashboard-items '((recents . 5)
                       (bookmarks . 5)
                       (projects . 5)))

