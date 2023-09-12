(require 'cl-lib)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(defvar my-packages
  '(catppuccin-theme evil nov calibre pdf-tools)
  "A list of packages to be installed at launch"
  )



(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
	   when (not (package-installed-p p)) do (cl-return nil)
	   finally (cl-return t)))

(unless (my-packages-installed-p)
    (package-refresh-contents)
    (dolist (p my-packages)
      (when (not (package-installed-p p))
	(package-install p))))


(require 'evil)
(evil-mode 1)
(recentf-mode 1)
(hl-line-mode 1)
(savehist-mode 1)

(pdf-loader-install)
(add-hook 'pdf-view-mode-hook #'pdf-links-minor-mode)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(setq display-line-numbers 'relative)

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font Mono-15" ))
(set-face-attribute 'default t :font "FiraCode Nerd Font Mono-15" )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calibre-libraries '(("books" . "~/Books")))
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("26149a1b5de476aa661bbb9c8f79540509c038fbba58c1c719466851c2968464" default))
 '(package-selected-packages '()))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

