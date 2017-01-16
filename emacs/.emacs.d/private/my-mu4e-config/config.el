(defun my-mu4e-config/post-init-mu4e ()
  (use-package mu4e
    :defer t
    :config    ;; tell message-mode how to send mail
    (setq message-send-mail-function 'smtpmail-send-it)
    (setq starttls-use-gnutls t)
    (setq mu4e-view-show-addresses t)
    (setq
     mu4e-maildir "~/email"
     mu4e-get-mail-command "mbsync -a"
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
                       (mu4e-sent-folder . "/cern/sent")
                       (mu4e-drafts-folder . "/cern/drafts")
                       (mu4e-trash-folder . "/cern/trash" )
                       (mu4e-refile-folder . "/cern/all")
                       (smtpmail-smtp-server . "smtp.cern.ch")
                       (smtpmail-default-smtp-server . "smtp.cern.ch")
                       (smtpmail-smtp-service . 587)
                       (mu4e-sent-messages-behavior . sent)
                       (mu4e-maildir-shortcuts
                        . ( ("/cern/INBOX"  . ?i)
                            ("/cern/all"    . ?a)
                            ("/cern/sent"   . ?s)
                            ("/cern/trash"  . ?t)
                            ("/cern/drafts" . ?d)))
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
                       (mu4e-sent-folder . "/gmail/sent")
                       (mu4e-drafts-folder . "/gmail/drafts")
                       (mu4e-trash-folder . "/gmail/trash" )
                       (mu4e-refile-folder . "/gmail/all")
                       (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
                       ;; (smtpmail-auth-credentials . (expand-file-name "~/.authinfo"))
                       ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
                       (mu4e-sent-messages-behavior . delete)
                       (mu4e-maildir-shortcuts
                        . ( ("/gmail/inbox"      . ?i)
                            ("/gmail/keep"       . ?a)
                            ("/gmail/sent"       . ?s)
                            ("/gmail/trash"      . ?t)
                            ("/gmail/drafts"     . ?d)
                            ("/gmail/social"     . ?c)
                            ("/gmail/promotions" . ?p)
                            ("/gmail/updates"    . ?u)))
                       ))))

    ))


(defun my-mu4e-config/init-mu4e-alert ()
  (use-package mu4e-alert
    :defer t
    :config
    (mu4e-alert-set-default-style 'libnotify)
    (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
    (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
    (setq alert-fade-time 10)
    ))
