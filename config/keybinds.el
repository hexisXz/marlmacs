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
