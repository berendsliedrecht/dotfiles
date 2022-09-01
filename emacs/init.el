;; Set the custom variable file so we do not bloat our config
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Setup the package manager
(load-file (locate-user-emacs-file "package-manager.el"))
(load-file (locate-user-emacs-file "packages.el"))
(load-file (locate-user-emacs-file "package-require.el"))
(load-file (locate-user-emacs-file "general.el"))
(load-file (locate-user-emacs-file "key-bindings.el"))
(load-file (locate-user-emacs-file "theme.el"))
