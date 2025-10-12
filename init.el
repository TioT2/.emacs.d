;;; init.el --- TioT2 Emacs configuration main file

;; Setup custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages '(corfu evil-collection evil-commentary magit slime)))
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
  (add-to-list 'package-archives '("org"          . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa"        . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)

  ;; Prioritize stability over recency for packages
  (setf package-archive-priorities
	'(("gnu"          . 50)
	  ("nongnu"       . 40)
	  ("melpa-stable" . 30)
	  ("melpa"        . 20)
	  ("org"          . 10))))


;; Make evil-collection happy
(setf evil-want-keybinding nil)

;; Install EVIL (Extensible VI Layer) package
(use-package evil
  :ensure t
  :config
  (evil-mode t))

;; Install commenting utilities for to EVIL mode
(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

;; Install package that enables EVIL-flavoured keymaps for Magit, Corfu, etc.
(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init)

  ;; Enable EVIL mode flavoured bindings for specific modes only
  ;; (=> save traditional (**documented**) key bindings for everything else)
  (setf evil-collection-mode-list
	'(corfu)))

;; Install Magit
(use-package magit
  :ensure t)

;; Install OrgMode
(use-package org
  :ensure t)

;; Install package for CommonLisp development (SLIME) and setup it
(use-package slime
  :ensure t
  :config

  ;; Enable SLIME extensions
  (slime-setup '(slime-fancy slime-quicklisp slime-asdf slime-mrepl))

  ;; Enable SLIME in lisp-mode
  (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
  (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

  ;; Specify SBCL as a lisp compiler
  (setf inferior-lisp-program "sbcl"))

;; Install autocomplete
(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  (setf corfu-auto t))

;; Remap ':q' and ':wq' commands to not terminate EMACS instance
(evil-ex-define-cmd "q" 'kill-current-buffer)
(evil-ex-define-cmd "wq" (lambda ()
			   (interactive)
			   (save-buffer)
			   (kill-current-buffer)))

;; Disable EMACS backup files
(setf make-backup-files nil)

;; Decrease font size
(set-face-attribute 'default nil :height 80)

;;; init.el ends here
