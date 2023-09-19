(use-package evil-collection
  :custom
  (evil-want-keybinding nil)
  :config
  (evil-collection-init))

(use-package evil
  :config

  (evil-set-leader 'normal (kbd "SPC"))
  (evil-define-key 'normal 'global (kbd "<leader>f") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>q") 'evil-quit)
  (evil-define-key 'normal 'global (kbd "<leader>n") 'tab-new)
  (evil-define-key 'normal 'global (kbd "<leader>SPC") 'project-find-file)
  (evil-define-key 'normal 'global (kbd "<leader>b") 'consult-buffer)
  (evil-define-key 'normal 'global (kbd "<leader>o f") 'consult-org-roam-file-find)
  (evil-define-key 'normal 'global (kbd "<leader>o s") 'consult-org-roam-search)
  )

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode 1))
