;;; $DOOMDIR/+misc.el -*- lexical-binding: t; -*-

(setq magit-commit-signoff t)

(defun split-and-browse ()
  "Vertically split window and browse url"
  (interactive)
  (if (string-match-p "xwidget" system-configuration-options)
  (let (url)
    (setq url (read-string "Enter url: "))
    (+evil/window-vsplit-and-follow)
    (xwidget-webkit-browse-url url t))
  (message "No xwidget support")))
