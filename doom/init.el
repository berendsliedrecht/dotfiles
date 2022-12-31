;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       ivy

       :ui
       doom
       doom-dashboard
       doom-modeline
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
       magit

       :os
       (:if IS-MAC macos)
       tty

       :lang
       (emacs-lisp +lsp)

       :config
       (default +bindings +smartparens))
