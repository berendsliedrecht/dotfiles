(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (add-to-list 'ivy-initial-inputs-alist
	       '(ivy-switch-buffer . "^[^*]")))
