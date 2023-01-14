;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       ivy

       :ui
       doom
       doom-dashboard
       hl-todo
       (popup +defaults)
       vi-tilde-fringe

       :editor
       (evil +everywhere)

       :emacs
       dired

       :term
       vterm

       :tools
       (eval +overlay)
       (magit +forge)

       :os
       (:if IS-MAC macos)
       tty

       :lang
       (emacs-lisp +lsp)
       (yaml +lsp)
       (org +lsp)

       :config
       (default +bindings +smartparens))
