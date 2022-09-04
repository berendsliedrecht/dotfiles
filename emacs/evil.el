(use-package evil
  :ensure t
  :init
  ;; Used for evil-collection
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-set-undo-system 'undo-redo)
  (evil-mode))

;; Set leader to space
(evil-set-leader 'normal (kbd "SPC"))

;; Only navigate with visual lines
(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)

;; Move between windows with C-(h|j|k|l)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; --- Leader mapping ---

;; delete the focussed window
(evil-define-key 'normal 'global (kbd "<leader> q") 'evil-delete-buffer)

;; find files in project
(evil-define-key 'normal 'global (kbd "<leader> SPC") 'projectile-find-file)

;; find project
(evil-define-key 'normal 'global (kbd "<leader> p") 'projectile-switch-project)

;; find project
(evil-define-key 'normal 'global (kbd "<leader> k") 'projectile-kill-buffers)

;; Ripgrep through project
(evil-define-key 'normal 'global (kbd "<leader> /") 'projectile-ripgrep)

;; Eslint fix all
(evil-define-key 'normal 'global (kbd "<leader> ]") 'lsp-eslint-apply-all-fixes)

;; Run prettier
(evil-define-key 'normal 'global (kbd "<leader> [") 'prettier-prettify)

;; Lsp code action
(evil-define-key 'normal 'global (kbd "<leader> a") 'lsp-execute-code-action)

;; Open magit
(evil-define-key 'normal 'global (kbd "<leader> m") 'magit)

;; Open neotree
(evil-define-key 'normal 'global (kbd "<leader> o") 'neotree-toggle)
