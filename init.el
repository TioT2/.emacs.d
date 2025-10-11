;;; init.el --- TioT2 Emacs configuration main file

;; Setup custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil evil-commentary)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add package source repositories
(use-package package
  :config

  ;; Add package archives (org, melpa, melpa-stable)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)

  ;; Prioritize stability over recency for packages
  (setq package-archive-priorities
	'(("gnu"          . 50)
	  ("nongnu"       . 40)
	  ("melpa-stable" . 30)
	  ("melpa"        . 20)
	  ("org"          . 10))))

;; Install EVIL package
(use-package evil
  :ensure t
  :config
  (evil-mode t))

;; Install comment additions to EVIL mode
(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

;; Remap ':q' and ':wq' commands to not terminate EMACS instance
(evil-ex-define-cmd "q" 'kill-current-buffer)
(evil-ex-define-cmd "wq" (lambda ()
			   (save-buffer)
			   (kill-current-buffer)))

;; Disable EMACS backup files
(setq make-backup-files nil)

;;; init.el ends here
