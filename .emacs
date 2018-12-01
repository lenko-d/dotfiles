(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages
   (quote
    (go-snippets go-rename go-playground go-eldoc go-autocomplete helm-tramp helm-hunks shell-switcher exec-path-from-shell company-go company helm-swoop ace-jump-mode ace-isearch helm-ls-git helm groovy-mode dockerfile-mode docker salt-mode terraform-mode magit go-dlv go-mode)))
 '(recentf-max-saved-items 2000)
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'go-dlv)

(global-set-key (kbd "C-x g") 'magit-status)


(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-x n") 'helm-recentf)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-x r") 'helm-browse-project)
(global-set-key (kbd "C-x e") 'helm-grep-do-git-grep)
(global-set-key (kbd "C-x t") 'helm-ls-git-ls)
(global-set-key (kbd "C-x c") 'compilation-mode)


(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)


(require 'helm-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)


(require 'ace-isearch)
(global-ace-isearch-mode +1)

(require 'shell-switcher)
(setq shell-switcher-mode t)


(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))


(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'go-autocomplete)
(require 'auto-complete-config)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)



(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)


