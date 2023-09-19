(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-delay  0.1) ;; TOO SMALL - NOT RECOMMENDED
  (corfu-auto-prefix 1) ;; TOO SMALL - NOT RECOMMENDED
  :init
  (global-corfu-mode))
