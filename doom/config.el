;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Berend Sliedrecht" user-mail-address "blu3beri@proton.me")

(setq doom-theme 'doom-old-hope)
(setq doom-font (font-spec :family "Hack Nerd Font" :size 14.0))

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(setq scroll-step 1)

(setq scroll-margin 7)

(after! evil
  (map! :n "j"   #'evil-next-visual-line)
  (map! :n "k"   #'evil-previous-visual-line)
  (map! :n "C-h" #'evil-window-left)
  (map! :n "C-j" #'evil-window-down)
  (map! :n "C-k" #'evil-window-up)
  (map! :n "C-l" #'evil-window-right))

(map! :leader
      "k" 'magit)

(map! :leader
      :prefix "o"
      "p" #'neotree-toggle)

(map! :leader "]" #'lsp-eslint-apply-all-fixes)
(map! :leader "[" #'prettier-prettify)

(use-package! lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-enable-symbol-highlighting nil)
  :hook
  (typescript-mode . lsp-deferred)
  (eslint-mode . lsp-deferred)
  :commands lsp lsp-deferred)

(use-package! lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode)

(use-package! company
  :after lsp-mode
  :hook
  (global-company-mode))

(use-package! typescript-mode
  :after lsp-mode)

(use-package! lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package! which-key
  :config
  (which-key-mode))

(after! neotree
  (setq neo-theme nil))
