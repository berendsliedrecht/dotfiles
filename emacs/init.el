(load-file (locate-user-emacs-file "no-littering.el"))

;; Set the custom variable file so we do not bloat our config
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)


;; Setup the package manager
(load-file (locate-user-emacs-file "package-manager.el"))

;; Functions
(load-file (locate-user-emacs-file "functions.el"))

;; General confugration
(load-file (locate-user-emacs-file "general.el"))

;; Generic keybindings
(load-file (locate-user-emacs-file "key-bindings.el"))

;; Tabbar
(load-file (locate-user-emacs-file "tabbar.el"))

;; --- Plugins ---
(load-file (locate-user-emacs-file "evil.el"))
(load-file (locate-user-emacs-file "evil-collection.el"))
(load-file (locate-user-emacs-file "ivy.el"))
(load-file (locate-user-emacs-file "counsel.el"))
(load-file (locate-user-emacs-file "projectile.el"))
(load-file (locate-user-emacs-file "lsp.el"))
(load-file (locate-user-emacs-file "rg.el"))
(load-file (locate-user-emacs-file "magit.el"))
(load-file (locate-user-emacs-file "neotree.el"))
(load-file (locate-user-emacs-file "prettier.el"))
(load-file (locate-user-emacs-file "which-key.el"))
