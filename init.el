;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/") t
	     ;'("melpa" . "https://melpa.org/packages/") t
)



(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package benchmark-init
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))


(use-package vertico
  :init
  (vertico-mode)
  )



(use-package catppuccin-theme
             :config
             (load-theme 'catppuccin t))

(use-package evil)
(use-package org-roam
  :defer 4
  :custom
  (org-roam-directory (file-truename "~/org-roam"))
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

(use-package nov
  :defer t)

(use-package magit
  :defer t)
(use-package calibre
  :init (setq calibre-libraries '(("books" . "~/Books")))
  :defer t)

(use-package pdf-tools
  :defer 7
  :config
  (pdf-loader-install)
  )

(use-package which-key
  :defer 6
  :config
  (which-key-mode 1))

(use-package org-bullets
  :defer 5
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(evil-mode 1)
(recentf-mode 1)
(hl-line-mode 1)
(savehist-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; (pixel-scroll-precision-mode 1)

(setq display-line-numbers 'relative)

(setq org-hide-emphasis-markers t)


(add-hook 'pdf-view-mode-hook #'pdf-links-minor-mode)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)

(defun my-elisp-mode-hook ()
  (setq display-line-numbers 'relative)
  (hl-line-mode 1))

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font Mono-15" ))
(set-face-attribute 'default t :font "FiraCode Nerd Font Mono-15" )



(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-bullets which-key pdf-tools calibre magit nov org-roam evil catppuccin-theme vertico benchmark-init)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
