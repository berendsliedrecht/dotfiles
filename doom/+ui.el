;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

(setq my/light-theme 'doom-one-light
      my/dark-theme 'doom-old-hope)

(global-hide-mode-line-mode)

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme my/light-theme t))
    ('dark (load-theme my/dark-theme t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

(setq doom-theme my/dark-theme)
(setq doom-font (font-spec :family "Hack Nerd Font" :size 14.0))

(after! neotree
  (setq neo-theme nil))
