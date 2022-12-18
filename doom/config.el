(setq user-full-name "Berend Sliedrecht" user-mail-address "blu3beri@proton.me")

(setq doom-theme 'doom-henna)

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(add-hook 'after-change-major-mode-hook #'hide-mode-line-mode)

(assoc-delete-all "Jump to bookmark" +doom-dashboard-menu-sections)
(assoc-delete-all "Open documentation" +doom-dashboard-menu-sections)
