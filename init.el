

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-vc-git-default-clone-depth 2)

(straight-use-package 'catppuccin-theme)
(straight-use-package 'evil)
(straight-use-package 'org-roam)
(straight-use-package 'nov)
(straight-use-package 'calibre)
(straight-use-package 'pdf-tools)

(evil-mode 1)
(recentf-mode 1)
(hl-line-mode 1)
(savehist-mode 1)
(tool-bar-mode -1)
(hl-line-mode 1)
(setq display-line-numbers 'relative)


(pdf-loader-install)
(add-hook 'pdf-view-mode-hook #'pdf-links-minor-mode)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(setq display-line-numbers 'relative)

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
 '(calibre-libraries '(("books" . "~/Books")))
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("26149a1b5de476aa661bbb9c8f79540509c038fbba58c1c719466851c2968464" default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

