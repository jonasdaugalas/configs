;; ------------------------------------------------- ;;
;; basic emacs configuration to be used with prelude ;;
;; ------------------------------------------------- ;;

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

;; Add MELPA repository for packages
(add-to-list 'package-archives '("melpa", "http://melpa.org/packages/") t)

;;;;;;;;;;;;;;;;;;;;;
;; prelude options ;;
;;;;;;;;;;;;;;;;;;;;;

;; install additional packages - add any to this list that you want to
;; be installed automatically
(require 'prelude-packages nil 'noerror)
(prelude-require-packages
 '(comment-dwim-2 rebox2 multiple-cursors expand-region
                  mu4e-alert mu4e-maildirs-extension ox-reveal))

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
(eval-after-load 'helm-mode
  '(add-to-list 'helm-completing-read-handlers-alist '(find-file)))


;;;;;;;;;;;;;;;;
;; org reveal ;;
;;;;;;;;;;;;;;;;
(setq org-reveal-root "file:///opt/revealjs")

;;;;;;;;;;;;;;;;;;;;;;
;; Scrolling config ;;
;;;;;;;;;;;;;;;;;;;;;;
(setq next-screen-context-lines 5)
(setq scroll-preserve-screen-position t)

;;;;;;;;;;
;; mu4e ;;
;;;;;;;;;;
(require 'mu4e)

;; tell message-mode how to send mail
(setq message-send-mail-function 'smtpmail-send-it)
(setq starttls-use-gnutls t)
(setq mu4e-view-show-addresses t)
(setq
 mu4e-maildir "~/Maildir"
 mu4e-get-mail-command "offlineimap"
 mu4e-update-interval 300)             ;; update every 5 minutes
;; (setq mu4e-html2text-command "w3m -T text/html")

(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "Cern"
           :enter-func (lambda () (mu4e-message "CERN context"))
           ;; leave-func not defined
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                                                               :to "jonas.daugalas@cern.ch")))
           :vars '((user-mail-address . "jonas.daugalas@cern.ch"  )
                   (user-full-name . "Jonas Daugalas")
                   ;; (mu4e-get-mail-command . "offlineimap -a Cern")
                   ;; (mu4e-maildir . "~/Maildir/Cern")
                   ;; (mu4e-mu-home . "~/.mu-cern")
                   (mu4e-sent-folder . "/Cern/Sent Items")
                   (mu4e-drafts-folder . "/Cern/Drafts")
                   (mu4e-trash-folder . "/Cern/Deleted Items" )
                   (mu4e-refile-folder . "/Cern/keep")
                   (smtpmail-smtp-server . "smtp.cern.ch")
                   (smtpmail-default-smtp-server . "smtp.cern.ch")
                   (smtpmail-smtp-service . 587)
                   (mu4e-sent-messages-behavior . sent)
                   (mu4e-maildir-shortcuts
                    . ( ("/Cern/INBOX"         . ?i)
                        ("/Cern/keep"          . ?a)
                        ("/Cern/Sent Items"    . ?s)
                        ("/Cern/Deleted Items" . ?t)
                        ("/Cern/Drafts"        . ?d)))
                   ))
         ,(make-mu4e-context
           :name "Gmail"
           :enter-func (lambda () (mu4e-message "Gmail context"))
           ;; leave-fun not defined
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                                                               :to "jonas.daugalas@gmail.com")))
           :vars '((user-mail-address . "jonas.daugalas@gmail.com" )
                   (user-full-name . "Jonas Daugalas")
                   ;; (mu4e-get-mail-command . "offlineimap -a Gmail")
                   ;; (mu4e-maildir . "~/Maildir/Gmail")
                   ;; (mu4e-mu-home . "~/.mu-gmail")
                   (smtpmail-default-smtp-server . "smtp.gmail.com")
                   (smtpmail-smtp-server . "smtp.gmail.com")
                   (smtpmail-smtp-service . 587)
                   (smtpmail-stream-type . starttls)
                   (mu4e-sent-folder . "/Gmail/[Gmail].Sent Mail")
                   (mu4e-drafts-folder . "/Gmail/[Gmail].Drafts")
                   (mu4e-trash-folder . "/Gmail/[Gmail].Trash" )
                   (mu4e-refile-folder . "/Gmail/keep")
                   (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
                   ;; (smtpmail-auth-credentials . (expand-file-name "~/.authinfo"))
                   ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
                   (mu4e-sent-messages-behavior . delete)
                   (mu4e-maildir-shortcuts
                    . ( ("/Gmail/INBOX"        . ?i)
                        ("/Gmail/keep"         . ?a)
                        ("/Gmail/[Gmail].Sent Mail" . ?s)
                        ("/Gmail/[Gmail].Trash"     . ?t)
                        ("/Gmail/[Gmail].Drafts"    . ?d)
                        ("/Gmail/social"            . ?c)
                        ("/Gmail/promotions"        . ?p)
                        ("/Gmail/updates"           . ?u)))
                   ))))

;;;;;;;;;;;;;;;;
;; mu4e-alert ;;
;;;;;;;;;;;;;;;;
(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
(setq alert-fade-time 10)

;;;;;;;;;;;;;;
;; Reboxing ;;
;;;;;;;;;;;;;;
(setq rebox-style-loop '(21 23 25 26 27))

;;;;;;;;;;;;;;;;;;;;;
;; My key bindings ;;
;;;;;;;;;;;;;;;;;;;;;

(with-eval-after-load "helpers.el"

  ;; Emacs
  (global-set-key (kbd "M-a") 'helm-M-x)

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
  (define-key js2-mode-map (kbd "M-j") nil) ; disable js2-line-break
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
