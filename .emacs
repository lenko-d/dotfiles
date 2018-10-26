(package-initialize)

(custom-set-variables
 '(package-selected-packages
   (quote
    (helm-swoop ace-jump-mode ace-isearch helm-ls-git helm groovy-mode dockerfile-mode docker salt-mode terraform-mode magit go-dlv go-mode)))
 '(recentf-mode t))
(custom-set-faces
 )


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))


(require 'go-dlv)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x r") 'helm-browse-project)


(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)


(require 'helm-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)


(require 'ace-isearch)
(global-ace-isearch-mode +1)

