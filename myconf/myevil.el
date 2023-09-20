(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (evil-set-undo-system 'undo-redo)
  )

(use-package evil
  :config
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>f") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>q") 'evil-quit)
  (evil-define-key 'normal 'global (kbd "<leader>n") 'tab-new)
  (evil-define-key 'normal 'global (kbd "<leader>l") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'project-find-file)
  (evil-define-key 'normal 'global (kbd "<leader>b") 'consult-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>o f") 'consult-org-roam-file-find)
  (evil-define-key 'normal 'global (kbd "<leader>o l") 'org-store-link)
  (evil-define-key 'normal 'global (kbd "<leader>o s") 'consult-org-roam-search)
  (evil-define-key 'normal 'global (kbd "<leader>w SPC w") 'org-roam-dailies-goto-today)
  (evil-define-key 'normal 'global (kbd "<leader>w i") 'org-roam-dailies-goto-date)
  (define-key evil-motion-state-map (kbd "RET") nil)
  ;; (evil-define-key 'normal 'org-mode-map (kbd "<return>") 'org-open-at-point)
  )

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode 1))

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
