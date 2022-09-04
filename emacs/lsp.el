(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  :hook ((typescript-mode . lsp)
         (eslint-mode . lsp))
  :commands lsp)
