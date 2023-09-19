
 (use-package company
   :custom
   (company-idle-delay 0.1)
   (company-minimum-prefix-length 2)
   :config
   (add-hook 'after-init-hook 'global-company-mode)
   )
