;; No GUI prompts
(setq use-dialog-box nil)

;; Disable the mode line
(setq-default mode-line-format nil)

;; Remove startup message
(setq inhibit-startup-message t)

;; Remove the initial sratch message
(setq initial-scratch-message "")

;; No flash and no error bell
(setq ring-bell-function 'ignore)

;; Disable padding on left and right of the window
(set-fringe-mode 0)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scrollbar
(scroll-bar-mode -1)

;; Add global line numbers
(global-display-line-numbers-mode 1)

;; Save history of files
(recentf-mode 1)

;; Set the max history length
(setq history-length 25)

;; Save the history of the minibuffer
(savehist-mode 1)

;; Save the location from previous visit
(save-place-mode 1)

;; Listen to file changes on disk and refresh here
(global-auto-revert-mode 1)

;; Listen to file changes for Dired
(setq global-auto-rever-non-file-buffers t)

;; No backups
(setq make-backup-files nil)

;; Disable lock files
(setq create-lockfiles nil)

;; Scroll down by 1 line
(setq scroll-step 1)

;; Always keep minimum of 7 lines below
(setq scroll-margin 7)
