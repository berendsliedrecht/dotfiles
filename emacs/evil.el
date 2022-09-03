(use-package evil)
(require 'evil)

(evil-mode 1)

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

;; Ripgrep through project
(evil-define-key 'normal 'global (kbd "<leader> /") 'projectile-ripgrep)

(evil-define-key 'normal 'global (kbd "<leader> ]") 'lsp-eslint-apply-all-fixes)
