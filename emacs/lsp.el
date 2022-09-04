(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-enable-symbol-highlighting nil)
  :hook ((typescript-mode . lsp)
         (eslint-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :custom
   (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr")))

;; Ivy integration
(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

;; Nice lsp on the sideline
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
