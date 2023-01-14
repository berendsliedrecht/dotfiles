;;; $DOOMDIR/+bindings.el -*- lexical-binding: t; -*-

(map! :leader
      :prefix "o"
      "x" #'split-and-browse
      "g" #'split-and-query-google
      "p" #'neotree-toggle)

(map! :leader
      :prefix "y"
      "a" #'smerge-keep-current
      "n" #'smerge-next)

(map! :after evil
      :n "j"     #'evil-next-visual-line
      :n "k"     #'evil-previous-visual-line
      :n "C-h"   #'evil-window-left
      :n "C-j"   #'evil-window-down
      :n "C-k"   #'evil-window-up
      :n "C-l"   #'evil-window-right
      :n "C-s-h" #'shrink-window-horizontally
      :n "C-s-j" #'enlarge-window
      :n "C-s-k" #'shrink-window
      :n "C-s-l" #'enlarge-window-horizontally)

(map! :leader
      "k" 'magit
      "t" #'+vterm/toggle)

(map! :after lsp-mode
      :leader
      :mode lsp-mode
      "]" #'lsp-eslint-apply-all-fixes
      "[" #'prettier-prettify
      "e" #'flycheck-display-error-at-point
      "a" #'lsp-execute-code-action)

(map! :after lsp-mode
      "C-SPC" #'company-complete)

(map! :after lsp-ui
      :map lsp-ui-doc-mode-map
      :n "K" #'lsp-ui-doc-glance
      :n "C-K" #'lsp-ui-doc-focus-frame)
