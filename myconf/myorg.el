(use-package org-bullets
  :defer 5
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0)))

(use-package org-roam
  :defer t
  :custom
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
