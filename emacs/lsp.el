(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-enable-symbol-highlighting nil)
  :hook ((typescript-mode . lsp)
         (eslint-mode . lsp)
         (yaml-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :custom
   (lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr")))

;; Completion
(use-package company
  :ensure t
  :after lsp-mode
  :hook (global-company-mode))

;; Ivy integration
(use-package lsp-ivy
  :ensure t
  :after lsp-mode
  :commands lsp-ivy-workspace-symbol)

;; Nice lsp on the sideline
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :commands lsp-ui-mode)

;; Typescript mode detector
(use-package typescript-mode
  :ensure t
  :after lsp-mode)

;; Yaml mode detector
(use-package yaml-mode
  :ensure t
  :after lsp-mode)
