;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)
(customize-set-variable 'treesit-font-lock-level 4)

(setq major-mode-remap-alist
 '((yaml-mode . yaml-ts-mode)
   (bash-mode . bash-ts-mode)
   (js2-mode . js-ts-mode)
   (typescript-mode . typescript-ts-mode)
   (json-mode . json-ts-mode)
   (css-mode . css-ts-mode)
   (rust-mode . rust-ts-mode)
   (python-mode . python-ts-mode)))

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

(require 'package)
(add-to-list 'package-archives
	     ;'("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/") t
	     '("melpa" . "https://melpa.org/packages/") t
)

(fset #'jsonrpc--log-event #'ignore)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package benchmark-init
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

  (add-to-list 'load-path "/home/benjamin/stuff/lsp-bridge")

(use-package yasnippet
  :config
  (yas-global-mode 1)
  )
  (require 'lsp-bridge)
  (global-lsp-bridge-mode)

 ;; (use-package company
 ;;   :custom
 ;;   (company-idle-delay 0.1)
 ;;   (company-minimum-prefix-length 2)
 ;;   :config
 ;;   (add-hook 'after-init-hook 'global-company-mode)
 ;;   )


; (use-package corfu
;   :custom
;   (corfu-cycle t)
;   (corfu-auto t)
;   (corfu-auto-delay  0.1) ;; TOO SMALL - NOT RECOMMENDED
;   (corfu-auto-prefix 1) ;; TOO SMALL - NOT RECOMMENDED
;   :init
;   (global-corfu-mode))


(use-package vertico
  :init
  (vertico-mode)
  )

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


(use-package evil-collection
  :custom
  (evil-want-keybinding nil)
  :config
  (evil-collection-init))
(use-package evil
  :config
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>f") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'project-find-file)
  )

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode 1))

(use-package org-roam
  :defer t
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
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0)))


(evil-mode 1)
(recentf-mode 1)
(hl-line-mode 1)
(savehist-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

; (pixel-scroll-precision-mode 1)


(setq org-hide-emphasis-markers t)


(add-hook 'pdf-view-mode-hook #'pdf-links-minor-mode)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))



(add-hook 'prog-mode-hook 'my-programming-hook)

;; (add-hook 'tsx-ts-mode-hook 'eglot-ensure)

(defun my-programming-hook ()
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
   '(typescript-mode evil-commentary lsp-mode anki-editor embark-consult embark eglot evil-collection consult company rust-mode corfu notmuch emms org-bullets which-key pdf-tools calibre magit nov org-roam evil catppuccin-theme vertico benchmark-init)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
