;;; orgmode.el --- pack -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;todo org mode
(require 'org)
(add-to-list 'org-modules 'org-habit)

(setq org-agenda-files '("~/org/"))
;; active Babel languages
(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)))

(use-package toc-org
    :ensure t
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets
  :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package ox-gfm
  :ensure t
  :defer t
  :after org)

(defvar my-notes-dir "~/wiki/org")
(defvar my-site-dir "~/wiki/org/site")


(setq org-publish-project-alist
      '(("notes"
         :base-directory "~/wiki/org"
         :publishing-directory "~/wiki/org/site" 
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">"
         :with-author t
         :with-creator nil
         :with-toc t
         :section-numbers nil)

        ("static"
         :base-directory ,my-notes-dir
         :publishing-directory ,my-site-dir
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif"
         :publishing-function org-publish-attachment)

        ("website"
         :components ("notes" "static"))))

;; (defun ek/babel-ansi ()
;;   (when-let ((beg (org-babel-where-is-src-block-result nil nil)))
;;     (save-excursion
;;       (goto-char beg)
;;       (when (looking-at org-babel-result-regexp)
;;         (let ((end (org-babel-result-end))
;;               (ansi-color-context-region nil))
;;           (ansi-color-apply-on-region beg end))))))
;; (add-hook 'org-babel-after-execute-hook 'ek/babel-ansi)

(provide 'orgmode)
;;; orgmode.el ends here
