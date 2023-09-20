;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)
(customize-set-variable 'treesit-font-lock-level 4)
;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

(require 'package)
(add-to-list 'package-archives
	     ;'("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/") t
	     '("melpa" . "https://melpa.org/packages/") t
)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(fset #'jsonrpc--log-event #'ignore)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(load "~/.emacs.d/myconf/treesitter.el")
(load "~/.emacs.d/myconf/myevil.el")
(load "~/.emacs.d/myconf/myorg.el")

(use-package benchmark-init
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package no-littering)

(use-package yasnippet
  :config
  (yas-global-mode 1)
  )

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package vertico
  :init
  (vertico-mode)
  )

(use-package visual-fill-column
  :custom
  (visual-fill-column-center-text 1)
  (visual-fill-column-width 85)
  :defer t
  )

(use-package neotree
  :custom
(neo-theme 'icons)
  )

(use-package dashboard
  :ensure t
  :custom
  (setq dashboard-display-icons-p t) ;; display icons on both GUI and terminal
  (setq dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
  :config
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package rust-mode
  :defer t
  ;; :config
  ;; (add-hook 'rust-mode-hook 'eglot-ensure)
 )

(use-package markdown-mode
  :defer t
  ;; :config
  ;; (add-hook 'rust-mode-hook 'eglot-ensure)
 )


(use-package anki-editor
  :defer t)

(use-package consult
  :defer t)

(use-package catppuccin-theme
             :config
             (load-theme 'catppuccin t))

(setq use-dialog-box nil)
(global-auto-revert-mode 1)

(use-package consult-org-roam
   :ensure t
   :after org-roam
   :init
   (require 'consult-org-roam)
   ;; Activate the minor mode
   (consult-org-roam-mode 1)
   :custom
   ;; Use `ripgrep' for searching with `consult-org-roam-search'
   (consult-org-roam-grep-func #'consult-ripgrep)
   ;; Configure a custom narrow key for `consult-buffer'
   (consult-org-roam-buffer-narrow-key ?r)
   ;; Display org-roam buffers right after non-org-roam buffers
   ;; in consult-buffer (and not down at the bottom)
   (consult-org-roam-buffer-after-buffers t)
   :config
   ;; Eventually suppress previewing for certain functions
   (consult-customize
    consult-org-roam-forward-links
    :preview-key (kbd "M-."))
)

(use-package nov

  :custom
  (nov-text-width 80)
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



(evil-mode 1)
(recentf-mode 1)
(hl-line-mode 1)
(savehist-mode 1)
(save-place-mode 1)

(if (fboundp 'scroll-bar-mode)
    (progn
      (scroll-bar-mode -1)
      (tool-bar-mode -1)
      )
  )

(if (file-directory-p "~/stuff/lsp-bridge")
    (progn
      (add-to-list 'load-path "/home/benjamin/stuff/lsp-bridge")
      (require 'lsp-bridge)
      (global-lsp-bridge-mode)
      )
)



; (pixel-scroll-precision-mode 1)


(setq org-hide-emphasis-markers t)


(add-hook 'pdf-view-mode-hook #'pdf-links-minor-mode)

(add-hook 'nov-mode-hook 'hl-line-mode)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))



(add-hook 'prog-mode-hook 'my-programming-hook)

;; (add-hook 'tsx-ts-mode-hook 'eglot-ensure)

(defun my-programming-hook ()
  (setq display-line-numbers 'relative)
  (hl-line-mode 1))

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font Mono-15" ))
(set-face-attribute 'default t :font "FiraCode Nerd Font Mono-15" )

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

