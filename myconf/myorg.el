(require 'org-mouse)

(setq org-return-follows-link t)
(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))
)

(use-package org-roam

  :defer t
  :custom
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . (lambda (file link)
                         (if (eq system-type 'darwin) ; macOS
                             (start-process "open" nil "open" file)
                           (start-process "okular" nil "okular" file))))))

(message "Org mode PDF viewer configured.")

  ;; (org-file-apps
  ;;  '((auto-mode . emacs)
  ;;    ("\\.pdf\\'" . my-pdf-viewer

  ;;     )))
  (org-roam-directory (file-truename "~/wiki/org-roam"))
  (org-roam-dailies-capture-templates
	'(("d" "default" entry
	   "* %?"
	   :target (file+head "%<%Y-%m-%d>.org"
			      "#+title: %<%Y-%m-%d>\n"))))
  :config
  (org-roam-db-autosync-mode)
  :bind (
	 ("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 )
  )

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
