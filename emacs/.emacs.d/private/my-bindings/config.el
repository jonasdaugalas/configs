(cua-mode t)

;; Files
(global-set-key (kbd "C-o") 'find-file)
;;(global-set-key (kbd "C-r") 'revert-buffer)

;; Basic movement
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)

(global-set-key (kbd "M-L") 'end-of-line)
(global-set-key (kbd "M-J") 'beginning-of-line)
(global-set-key (kbd "M-K") (lambda () (interactive) (scroll-up-command 16)))
(global-set-key (kbd "M-I") (lambda () (interactive) (scroll-down-command 16)))

(global-set-key (kbd "M-C-i") 'backward-paragraph)
(global-set-key (kbd "M-C-k") 'forward-paragraph)

(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-o") 'forward-word)

(global-set-key (kbd "M-h") 'beginning-of-buffer)
(global-set-key (kbd "M-H") 'end-of-buffer)

;; Basic editing
(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "M-f") 'delete-char)
(global-set-key (kbd "M-D") 'backward-kill-word)
(global-set-key (kbd "M-F") 'kill-word)

;; Mark
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "M-S-SPC") 'mark-paragraph)
(global-set-key (kbd "M-b") 'pop-to-mark-command)

;; Comments
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(defun my-bindings/init-comment-dwim-2 ()
  (use-package comment-dwim-2
    :config
    (global-set-key (kbd "M-;") 'comment-dwim-2)
    ))

(defun my-bindings/init-rebox2 ()
  (use-package rebox2
    :config
    (global-set-key (kbd "M-:") 'rebox-cycle)
    ))



(defun my-bindings/post-init-helm ()
  (use-package helm
    :defer t
    ;; :init
    ;; ;; Code to execute before Helm is loaded
    :config
    (global-set-key (kbd "M-a") 'helm-M-x)
    ;; helm-mini
    (global-unset-key (kbd "C-\\"))
    (global-set-key (kbd "C-\\") 'helm-mini)
    ;; helm-mt
    (global-set-key (kbd "C-|") 'helm-mt)
    (define-key helm-map (kbd "M-i") 'helm-previous-line)
    (define-key helm-map (kbd "M-k") 'helm-next-line)
    (define-key helm-map (kbd "M-j") 'helm-previous-source)
    (define-key helm-map (kbd "M-l") 'helm-next-source)
  )
)


(defun my-bindings/post-init-dired ()
  (use-package dired
    :defer t
    :config
    (define-key dired-mode-map (kbd "C-o") 'find-file)
    )
  )

(defun my-bindings/post-init-window-numbering ()
  (use-package window-numbering
    :defer t
    :config
    (progn
      (global-unset-key (kbd "M-7"))
      (define-key window-numbering-keymap (kbd "M-7") nil)
      (global-set-key (kbd "M-7") 'select-line)
      (global-set-key (kbd "M-ų") 'select-line)
      ;; unset M-8 for 'expand-region'
      (define-key window-numbering-keymap (kbd "M-8") nil)
)))


(defun my-bindings/post-expand-region ()
  (use-package expand-region
    :defer t
    :config
    (global-unset-key (kbd "M-8"))
    (global-set-key (kbd "M-8") 'er/expand-region)
    (global-set-key (kbd "M-ū") 'er/expand-region)
    ))


(defun my-bindings/post-init-company ()
  (use-package company
    :config
    (define-key company-active-map (kbd "M-i") 'company-select-previous)
    (define-key company-active-map (kbd "M-k") 'company-select-next)
    ))

(defun my-bindings/post-init-js2 ()
  (use-package js2
    :config
    (define-key js2-mode-map (kbd "M-j") nil) ; disable js2-line-break
    ))


(defun my-bindings/post-init-flyspell ()
  (use-package flyspell
    :config
    ;; disable auto correct word for 'backward-paragraph'
    (define-key flyspell-mode-map (kbd "M-C-i") nil)
    ))


;; Search & replace
;; Use regex searches by default.
(global-unset-key (kbd "C-M-r")) ;; isearch-backwards
(global-set-key (kbd "C-f") 'isearch-forward-regexp)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "C-r") 'isearch-repeat-backward)
(global-set-key (kbd "M-R") 'replace-regexp)

;;(define-key smartparens-mode-map (kbd "M-s") nil) ;; disable sp-splice-sexp
(global-set-key (kbd "M-s") 'other-window)
;;(define-key smartparens-mode-map (kbd "M-S") nil) ;; disable sp-split-sexp
(global-set-key (kbd "M-S") '(lambda () (interactive) (other-window -1)))

(global-unset-key (kbd "C-a"))
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'save-buffer)
(global-unset-key (kbd "C-S-s"))
(global-set-key (kbd "C-S-s") 'write-file)

(global-unset-key (kbd "C-n"))
(global-set-key (kbd "C-n") 'xah-new-empty-buffer)
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") 'xah-close-current-buffer)
(global-unset-key (kbd "M-q"))
(global-set-key (kbd "M-q") 'compact-uncompact-block)
(global-unset-key (kbd "M-w"))
(global-set-key (kbd "M-w") 'just-one-space)

(global-set-key (kbd "M-]") 'aj-toggle-fold)
