;;; $DOOMDIR/+misc.el -*- lexical-binding: t; -*-


(defun my/support-xwidget-p ()
  "Check whether emacs has webkit support"
  (string-match-p "xwidget" system-configuration-options))

(defun my/browse-url (url)
  "Wrapper function to browse url"
  (xwidget-webkit-browse-url url t))

(defun my/split-and-follow ()
  "Wrapper function to split window and follow"
  (+evil/window-vsplit-and-follow))

(defun split-and-browse (url)
  "Vertically split window and browse url"
  (interactive)
  (if (my/support-xwidget-p)
  (let (url)
    (setq url (read-string "Enter url: "))
    (my/split-and-follow)
    (my/browse-url url))
  (message "No xwidget support")))


(defun split-and-query-google ()
  "Vertically split window and browse url"
  (interactive)
  (if (my/support-xwidget-p)
  (let (query)
    (setq query (read-string "Enter query: "))
    (my/split-and-follow)
    (setq url (url-encode-url (format "https://google.com/search?q=%s" query)))
    (my/browse-url url))
  (message "No xwidget support")))
