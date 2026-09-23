;;; startup.el --- pack -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package page-break-lines
  :ensure t
  :config
  (global-page-break-lines-mode 1))
(use-package dashboard
  :ensure t
  :defer t
  :init
  (setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
  ;; (setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner 3) 
  ;; (setq dashboard-startup-banner "~/.config/emacs/images/banner.svg")  ;; use custom image as banner
  ;; (setq dashboard-startup-banner nil)
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 3)
                          (projects . 3)
                          (registers . 3)))
  :custom
  (dashboard-modify-heading-icons '((recents . "file-text")
				      (bookmarks . "book")))
  :config
  (dashboard-setup-startup-hook))
(provide 'startup)
;;; startup.el ends here
