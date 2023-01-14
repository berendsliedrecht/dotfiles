;;; $DOOMDIR/+org.el -*- lexical-binding: t; -*-

(use-package! org
  :after org
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-todo-keywords
        '((sequence "TODO" "INPR" "REVW" "DONE"))))
