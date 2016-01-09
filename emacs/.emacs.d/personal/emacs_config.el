;; ------------------------------------------------- ;;
;; basic emacs configuration to be used with prelude ;;
;; ------------------------------------------------- ;;

;; Add MELPA repository for packages
(add-to-list 'package-archives '("melpa", "http://melpa.org/packages/") t)

;;;;;;;;;;;;;;;;;;;;;
;; prelude options ;;
;;;;;;;;;;;;;;;;;;;;;

;; install additional packages - add any to this list that you want to
;; be installed automatically
(require 'prelude-packages nil 'noerror)
(prelude-require-packages '(multiple-cursors expand-region))

;; enable arrows
(setq prelude-guru nil)

;; smooth scrolling
(setq prelude-use-smooth-scrolling t)

;; change highlight color
(set-face-attribute 'region nil :background "#003040")

;; file backups
(setq prelude-auto-save nil)
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "/tmp/emacs-backups"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;;;;;;;;;;;;;;
;; cua mode ;;
;;;;;;;;;;;;;;
(cua-mode t)
(transient-mark-mode 1)
(defalias 'redo 'undo-tree-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm turn off for find file ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

;;;;;;;;;;;;;;;;;;;;;;
;; Scrolling config ;;
;;;;;;;;;;;;;;;;;;;;;;
(setq next-screen-context-lines 5)
(setq scroll-preserve-screen-position t)

;;;;;;;;;;;;;;
;; Reboxing ;;
;;;;;;;;;;;;;;
(setq rebox-style-loop '(21 23 25 26 27))

;;;;;;;;;;;;;;;;;;;;;
;; My key bindings ;;
;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load "helpers.el"

  ;; Emacs
  (global-set-key (kbd "M-a") 'execute-extended-command)

  ;; Files
  (global-set-key (kbd "C-o") 'find-file)
  (define-key dired-mode-map (kbd "C-o") 'find-file)
  (global-set-key (kbd "C-r") 'revert-buffer)

  ;; Basic movement
  (global-set-key (kbd "M-i") 'previous-line)
  (define-key helm-map (kbd "M-i") 'helm-previous-line)
  (define-key company-active-map (kbd "M-i") 'company-select-previous)
  (global-set-key (kbd "M-k") 'next-line)
  (define-key helm-map (kbd "M-k") 'helm-next-line)
  (define-key company-active-map (kbd "M-k") 'company-select-next)
  (global-set-key (kbd "M-j") 'backward-char)
  (define-key helm-map (kbd "M-j") 'helm-previous-source)
  (global-set-key (kbd "M-l") 'forward-char)
  (define-key helm-map (kbd "M-l") 'helm-next-source)

  (global-set-key (kbd "M-L") 'end-of-line)
  (global-set-key (kbd "M-J") 'beginning-of-line)
  (global-set-key (kbd "M-u") 'backward-word)
  (define-key prelude-mode-map (kbd "M-o") nil) ; disable smart open line
  (global-set-key (kbd "M-o") 'forward-word)

  (define-key flyspell-mode-map (kbd "M-C-i") nil) ; disable auto correct word
  (global-set-key (kbd "M-C-i") 'backward-paragraph)
  (global-set-key (kbd "M-C-k") 'forward-paragraph)
  (global-set-key (kbd "M-K") 'scroll-up-command)
  (global-set-key (kbd "M-I") 'scroll-down-command)
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
  (global-set-key (kbd "M-;") 'comment-dwim-2)
  ;; (global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
  (global-set-key (kbd "M-:") 'rebox-cycle)

  ;; Search & replace
  ;; Use regex searches by default.
  (global-unset-key (kbd "C-M-r")) ;; isearch-backwards
  (global-set-key (kbd "C-f") 'isearch-forward-regexp)
  (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "C-r") 'isearch-repeat-backward)
  ;; disable sp-splice-sexp-killing-around
  ;; (define-key smartparens-mode-map (kbd "M-r") nil)
  (global-set-key (kbd "M-R") 'replace-regexp)

                                        ;asdf

  ;; Frames & windows
  (global-unset-key (kbd "M-2"))
  (global-set-key (kbd "M-2") 'split-window-vertically)
  (global-set-key (kbd "M-č") 'split-window-vertically)
  (global-unset-key (kbd "M-3"))
  (global-set-key (kbd "M-3") 'split-window-horizontally)
  (global-set-key (kbd "M-ę") 'split-window-horizontally)
  (global-unset-key (kbd "M-4"))
  (global-set-key (kbd "M-4") 'balance-windows)
  (global-set-key (kbd "M-ė") 'balance-windows)
  (global-unset-key (kbd "M-9"))
  (global-set-key (kbd "M-9") 'delete-other-windows)
  (global-set-key (kbd "M-„") 'delete-other-windows)
  (global-unset-key (kbd "M-0"))
  (global-set-key (kbd "M-0") 'delete-window)
  (global-set-key (kbd "M-“") 'delete-window)
  (define-key smartparens-mode-map (kbd "M-s") nil) ;; disable sp-splice-sexp
  (global-set-key (kbd "M-s") 'other-window)
  (define-key smartparens-mode-map (kbd "M-S") nil) ;; disable sp-split-sexp
  (global-set-key (kbd "M-S") '(lambda () (interactive) (other-window -1)))

  (global-unset-key (kbd "C-a"))
  (global-set-key (kbd "C-a") 'mark-whole-buffer)
  (global-unset-key (kbd "C-s"))
  (global-set-key (kbd "C-s") 'save-buffer)
  (global-unset-key (kbd "C-S-s"))
  (global-set-key (kbd "C-S-s") 'write-file)
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z") 'undo)
  (global-unset-key (kbd "C-y"))
  (global-set-key (kbd "C-y") 'redo)
  (global-unset-key (kbd "C-n"))
  (global-set-key (kbd "C-n") 'xah-new-empty-buffer)
  (global-unset-key (kbd "C-w"))
  (global-set-key (kbd "C-w") 'xah-close-current-buffer)
  (global-unset-key (kbd "M-q"))
  (global-set-key (kbd "M-q") 'compact-uncompact-block)
  (global-unset-key (kbd "M-7"))
  (global-set-key (kbd "M-7") 'select-line)
  (global-set-key (kbd "M-ų") 'select-line)
  (global-unset-key (kbd "M-8"))
  (global-set-key (kbd "M-8") 'er/expand-region)
  (global-set-key (kbd "M-ū") 'er/expand-region)
  (global-unset-key (kbd "C-\\"))
  (global-set-key (kbd "C-\\") 'helm-mini)
  (global-unset-key (kbd "M-w"))
  (global-set-key (kbd "M-w") 'just-one-space)
  (global-set-key (kbd "M-]") 'aj-toggle-fold)
  )
(provide 'emacs_config)
;;; emacs_config.el ends here
