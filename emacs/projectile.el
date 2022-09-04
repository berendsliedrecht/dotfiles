(use-package projectile
  :ensure t
  :init
  (setq projectile-enable-caching t)
  (setq projectile-sort-order 'recently-active)
  (add-hook 'projectile-after-switch-project-hook 'neotree-projectile-action)
  :config
  (projectile-global-mode))

