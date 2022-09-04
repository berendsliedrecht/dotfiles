(use-package neotree)
(require 'neotree)

;; Remove the icons
(setq neo-theme nil)

(add-hook 'projectile-after-switch-project-hook 'neotree-projectile-action)
