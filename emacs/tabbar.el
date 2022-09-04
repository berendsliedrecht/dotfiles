;; Enable the tabbline
(global-tab-line-mode t)

;; Disable images
(setq tabbar-use-images nil)

;; do not show add-new button
(setq tab-line-new-button-show nil) 

;; do not show close button
(setq tab-line-close-button-show nil)

;; Empty seperator
(setq tab-line-separator "  ")
 
;; background behind tabs
(set-face-attribute 'tab-line nil 
		    :background 'unspecified
		    :foreground 'unspecified
		    :height 1.1
		    :box nil)

;; active tab in another window
(set-face-attribute 'tab-line-tab nil 
		    :inherit 'tab-line
		    :foreground 'unspecified
		    :background 'unspecified
		    :box nil)

;; inactive tab
(set-face-attribute 'tab-line-tab-inactive nil 
		    :background 'unspecified
		    :foreground 'unspecified
		    :box nil)

;; active tab
(set-face-attribute 'tab-line-tab-current nil
		    :background 'unspecified
		    :foreground "#FF00FF"
		    :box nil)

;; Underline on cursor focus
(set-face-attribute 'tab-line-highlight nil
		    :background 'unspecified
		    :foreground 'unspecified
		    :underline t
		    :box nil)

