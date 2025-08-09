;; external configuration
(load-file "~/.awok-emacs/.emacs-packages.el")

(setq custom-file "~/.awok-emacs/.emacs-customvar.el")
(load custom-file) ; changing default custom-set-variable to another file

;; key binding
(setq grep-command "grep -rn ")
(global-set-key (kbd "C-c o") 'grep) ; grep for searching definition

;; customizing some utility
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(setq dired-kill-when-opening-new-dired-buffer t)

;; list of used packages
(use-package ivy)
:init
(ivy-mode 1)

(use-package magit
:ensure t)
