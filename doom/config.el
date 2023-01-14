;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load! "+bindings")
(load! "+ui")
(load! "+lsp")
(load! "+misc")
(load! "+org")
(load! "+git")

(setq user-full-name "Berend Sliedrecht"
      user-mail-address "blu3beri@proton.me"
      display-line-numbers-type t
      org-directory "~/org/"
      scroll-step 1
      scroll-margin 7)

