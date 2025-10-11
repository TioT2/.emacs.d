;;;; TIOT2 EMACS CONFIG "init.el" FILE

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
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize))



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
			   (interactive)
			   (save-buffer)
			   (kill-current-buffer)))

; init.el
