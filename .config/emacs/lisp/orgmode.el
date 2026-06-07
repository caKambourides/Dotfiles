;;; orgmode.el --- pack -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;todo org mode
(setq org-agenda-files '("~/org/"))
;; active Babel languages
(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)))
(use-package ox-gfm
  :ensure t
  :after org)

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
