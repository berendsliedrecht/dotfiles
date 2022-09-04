(use-package projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-sort-order 'recently-active)

(add-hook 'projectile-after-switch-project-hook 'neotree-projectile-action)
