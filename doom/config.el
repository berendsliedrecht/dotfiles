(setq user-full-name "Berend Sliedrecht" user-mail-address "blu3beri@proton.me")

(setq doom-theme 'doom-henna)

(setq display-line-numbers-type t)

;; Disable escape docstring warning
(setq text-quoting-style 'grave)

;; Disable mode line
(add-hook 'after-change-major-mode-hook #'hide-mode-line-mode)

;; Remove some fields from the dashboard
(assoc-delete-all "Jump to bookmark" +doom-dashboard-menu-sections)
(assoc-delete-all "Open documentation" +doom-dashboard-menu-sections)

;; Only navigate with visual lines
(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)

;; Move between windows with C-(h|j|k|l)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; lsp stuff
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-enable-symbol-highlighting nil)
(setq lsp-completion-show-kind nil)
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-doc-show-with-cursor nil)
(setq lsp-ui-doc-show-with-mouse nil)
(setq lsp-lens-enable nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-sideline-show-diagnostics nil)
(setq lsp-completion-show-detail nil)

;; disable auto completion
(setq company-idle-delay nil)
