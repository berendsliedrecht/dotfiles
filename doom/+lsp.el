;;; $DOOMDIR/+lsp.el -*- lexical-binding: t; -*-

(use-package! lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-doc-show-with-cursor nil
        lsp-enable-symbol-highlighting nil
        lsp-ui-sideline-enable nil
        lsp-modeline-code-actions-enable nil
        lsp-eldoc-enable-hover nil
        lsp-signature-auto-activate nil
        lsp-modeline-diagnostics-enable nil
        lsp-lens-enable nil)
  :hook
  (typescript-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  (eslint-mode . lsp-deferred)
  :commands lsp lsp-deferred)

(use-package! lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode)

(use-package! company
  :after lsp-mode
  :hook
  (global-company-mode)
  :config
  (setq company-idle-delay nil))

(use-package! typescript-mode
  :after lsp-mode)

(use-package! lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package! which-key
  :config
  (which-key-mode))

(use-package! flycheck
  :config
  (setq flycheck-display-errors-delay 5
        flycheck-idle-buffer-switch-delay 5
        flycheck-idle-change-delay 5))
