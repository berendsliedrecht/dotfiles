;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

(setq +doom-dashboard-ascii-banner-fn nil)

(setq my/light-theme 'doom-ayu-light
      my/dark-theme 'doom-ayu-dark)

(global-hide-mode-line-mode)

;; Ignore buffers that start with the *
(setq ivy-ignore-buffers '("\\` " "\\`\\*"))

(defun my/apply-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme my/light-theme t))
    ('dark (load-theme my/dark-theme t))))

(add-hook 'ns-system-appearance-change-functions #'my/apply-theme)

(setq doom-theme my/light-theme)
(setq doom-font (font-spec :family "Hack Nerd Font" :size 14.0))

(after! neotree
  (setq neo-theme nil))
