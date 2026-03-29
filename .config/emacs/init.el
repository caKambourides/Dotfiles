;;gui cleanup
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;; enable package.el
(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
;;(package-refresh-contents)

;;use package should be installed by default?
;; package refresh contents updates the repos, could be done manually with m x package-refresh-contents?
;; Ensure use-package is installed
;;(unless (package-installed-p 'use-package)
  ;; (package-refresh-contents)
  ;; (package-install 'use-package))
;; enable use package
;; (require 'use-package)

;;enable which key
(which-key-mode)

;;show numbers
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;;theme
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(custom-enabled-themes '(tango-dark))
 ;;'(package-selected-packages nil))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))
;;transparency
(add-to-list 'default-frame-alist '(alpha-background . 95)) ; For all new frames henceforth

;; EVIL MODE

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
;;todo use evil collection for extra stuff

;;todo god mode
;;(unless (package-installed-p 'god-mode)
;;(package-install 'god-mode))
;;(require 'god-mode)
;;(god-mode)


;; tree sitter (built in?)
;;(unless (package-installed-p 'tree-sitter)
;;(package-install 'tree-sitter))
;;(require 'tree-sitter)
;;(unless (package-installed-p 'tree-sitter-langs)
;;(package-install 'tree-sitter-langs))
;;(require 'tree-sitter-langs)
;;(global-tree-sitter-mode)

;;(unless (package-installed-p 'treesit)
;;(package-install 'treesit))
;;(require 'treesit)

;;(unless (package-installed-p 'treesit-auto)
;;(package-install 'treesit-auto))
;;(use-package treesit-auto
;;  :custom
;;  (treesit-auto-install 'prompt)
;;  :config
;;  (treesit-auto-add-to-auto-mode-alist 'all)
;;  (global-treesit-auto-mode))

;;By default, Emacs requires you to hit ESC three times to escape quit the minibuffer
(global-set-key [escape] 'keyboard-escape-quit)

;;todo lsp mode

;;(unless (package-installed-p 'lsp-mode)
;;(package-install 'lsp-mode))
;;(use-package lsp-mode
;;  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  ;; (setq lsp-keymap-prefix "C-c l")
 ;; (setq lsp-auto-guess-root nil)
 ;; :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;;(XXX-mode . lsp)
   ;;      (js-base-mode . lsp)
         ;; if you want which-key integration
     ;;    (lsp-mode . lsp-enable-which-key-integration))
  ;;:commands lsp)

;;errors
;;(unless (package-installed-p 'flycheck)
;;(package-install 'flycheck))
;;(use-package flycheck
;;  :ensure t
;;  :config
;;  (add-hook 'after-init-hook #'global-flycheck-mode))

;; optionally
;;(unless (package-installed-p 'lsp-ui)
;;(package-install 'lsp-ui))
;;(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user

;;(unless (package-installed-p 'lsp-ivy)
;;(package-install 'lsp-ivy))
;;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
;;(use-package which-key
;;    :config
;;    (which-key-mode))

;;alt eglot: install the lsp on your machine and configure it here 
;;(use-package eglot
;;  :hook ((typescript-ts-mode tsx-ts-mode js-ts-mode) . eglot-ensure))



;; dashboard (startup)

(use-package dashboard
  :ensure t 
  :init
  (setq initial-buffer-choice 'dashboard-open)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.config/emacs/images/dtmacs-logo.png")  ;; use custom image as banner
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

;; company (complete any command)
(use-package company
  :ensure t
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))

(use-package company-box
  :ensure t
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

;;todo modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 35      ;; sets modeline height
        doom-modeline-bar-width 5    ;; sets right bar width
        doom-modeline-persp-name t   ;; adds perspective name to modeline
        doom-modeline-persp-icon t)) ;; adds folder icon next to persp name

;;todo verb mode

;;todo dbml mode
;;(use-package dbml-mode
;;  :ensure t)

;;todo puml mode
;;(use-package plantuml-mode :ensure t)
;;todo set path variable and install jar file with command

;;todo db client
;;(ejc-create-connection
;; "wildlife-connection"
;; :classpath (concat "~/.m2/repository/org.postgresql/postgresql/42.6.0/"
;;                    "postgresql-42.6.0.jar")
;; :subprotocol "postgresql"
;; :subname "//localhost:5432/wildlife"
;; :user "charalambos"
;; :password "") ;;TODO env var

;;todo prespective

;;todo org mode

;;todo neotree
(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t
        neo-show-hidden-files t
        neo-window-width 55
        neo-window-fixed-size nil
        inhibit-compacting-font-caches t
        projectile-switch-project-action 'neotree-projectile-action) 
        ;; truncate long file names in neotree
        (add-hook 'neo-after-create-hook
           #'(lambda (_)
               (with-current-buffer (get-buffer neo-buffer-name)
                 (setq truncate-lines t)
                 (setq word-wrap nil)
                 (make-local-variable 'auto-hscroll-mode)
                 (setq auto-hscroll-mode nil)))))

;;todo rainbow mode
(use-package rainbow-mode
  :ensure t
  :diminish
  :hook org-mode prog-mode)
;;todo magit

;;dired 
(use-package dired-open :ensure t
  :config
  (setq dired-open-extensions '(("gif" . "sxiv")
                                ("jpg" . "sxiv")
                                ("png" . "sxiv")
                                ("mkv" . "mpv")
                                ("mp4" . "mpv"))))

(use-package peep-dired :ensure t
  :after dired
  :hook (evil-normalize-keymaps . peep-dired-hook)
  :config
    (evil-define-key 'normal dired-mode-map (kbd "h") 'dired-up-directory)
    (evil-define-key 'normal dired-mode-map (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
    (evil-define-key 'normal peep-dired-mode-map (kbd "j") 'peep-dired-next-file)
    (evil-define-key 'normal peep-dired-mode-map (kbd "k") 'peep-dired-prev-file)
)

;;todo vterm
(use-package vterm :ensure t
:config
(setq shell-file-name "/bin/sh"
      vterm-max-scrollback 5000))
(use-package vterm-toggle :ensure t
  :after vterm
  :config
  ;; When running programs in Vterm and in 'normal' mode, make sure that ESC
  ;; kills the program as it would in most standard terminal programs.
  (evil-define-key 'normal vterm-mode-map (kbd "<escape>") 'vterm--self-insert)
  (setq vterm-toggle-fullscreen-p nil)
  (setq vterm-toggle-scope 'project)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                     (let ((buffer (get-buffer buffer-or-name)))
                       (with-current-buffer buffer
                         (or (equal major-mode 'vterm-mode)
                             (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                  (display-buffer-reuse-window display-buffer-at-bottom)
                  ;;(display-buffer-reuse-window display-buffer-in-direction)
                  ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                  ;;(direction . bottom)
                  ;;(dedicated . t) ;dedicated is supported in emacs27
                  (reusable-frames . visible)
                  (window-height . 0.4))))
;;todo fonts
(set-face-attribute 'default nil
  :font "FiraCode"
  :height 110
  :weight 'medium)
(set-face-attribute 'variable-pitch nil
  :font "FiraCode"
  :height 120
  :weight 'medium)
(set-face-attribute 'fixed-pitch nil
  :font "FiraCode"
  :height 110
  :weight 'medium)
;; Makes commented text and keywords italics.
;; This is working in emacsclient but not emacs.
;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
  :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
  :slant 'italic)

;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-11"))

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)
;;sane defaults
(delete-selection-mode 1)    ;; You can select text and delete it by typing.
(electric-indent-mode -1)    ;; Turn off the weird indenting that Emacs does by default.
(electric-pair-mode 1)       ;; Turns on automatic parens pairing

;; Zoom in and out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;tab space
;; Source - https://stackoverflow.com/a
;; Posted by alcortes, modified by community. See post 'Timeline' for change history
;; Retrieved 2026-01-10, License - CC BY-SA 2.5
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


;;my stuff



;;(defun dbml-sql()
;;  "draw dbml"
;;  (interactive)
;;  (if (not buffer-file-name)
;;      (message "Buffer is not visiting a file!")
;;    (let* ((filename (shell-quote-argument buffer-file-name)) ; safely quote file name
;;           (command(format "dbml2sql %s" filename)) ;;psql by default
	   ;;(command (format "dbml-renderer -i %s" filename))   ; replace 'my-command' with your command
;;           (buffer-name "*dbml out*")
;;           (buffer (get-buffer-create buffer-name)))
      ;; Clear the buffer
 ;;     (with-current-buffer buffer
  ;;      (read-only-mode -1)
  ;;      (erase-buffer))
      ;; Run the command
  ;;    (let ((exit-code (call-process-shell-command command nil buffer t)))
        ;; Add header and make read-only
  ;;      (with-current-buffer buffer
  ;;        (goto-char (point-min))
  ;;        (insert (format "Command: %s\nExit code: %d\n\n" command exit-code))
   ;;       (read-only-mode 1))
        ;; Show the buffer
   ;;     (display-buffer buffer)))))


;;(defun dbml-draw ()
;;  "draw dbml"
;;  (interactive)
;;  (if (not buffer-file-name)
;;      (message "Buffer is not visiting a file!")
;;    (let* ((input-file (shell-quote-argument buffer-file-name))
;;           (svg-data (shell-command-to-string (format "dbml-renderer -i %s" input-file)))
 ;;          (buffer-name "*dbml preview*")
 ;;          (buffer (get-buffer-create buffer-name)))
 ;;     (with-current-buffer buffer
 ;;       (read-only-mode -1)
 ;;       (erase-buffer)
 ;;       ;; Insert SVG as image
 ;;       (insert-image (create-image svg-data 'svg t))
 ;;       (read-only-mode 1))
 ;;     (display-buffer buffer))))

