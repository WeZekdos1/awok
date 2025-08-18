;; setup repository
(require 'package)
(setq package-archives
'(("gnu" . "https://elpa.gnu.org/packages/")
  ("nongnu" . "https://elpa.nongnu.org/nongnu/")
  ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; setup gruber-darker as main theme
(unless (package-installed-p 'gruber-darker-theme) (package-install 'gruber-darker-theme))
(load-theme 'gruber-darker t)

;; ensuring that use-package already installed & use-package is always ensure t
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; ivy setup
(use-package ivy
:init
(ivy-mode 1)
(setq ivy-count-format "(%d/%d) "))

;; magit setup
(use-package magit)

;; lsp-mode setup
(setq lsp-keymap-prefix "s-l")
(use-package lsp-mode
  :hook ((c-mode c++-mode python-mode) . lsp-deferred)
  :commands lsp
  :init
  (setq lsp-prefer-capf t
	lsp-enable-snippet t
	lsp-idle-delay 0.5)
  :config
  (setq lsp-clients-clangd-executable "/usr/bin/clangd-19")
  (setq lsp-pylsp-server-command '("/usr/bin/pylsp")))
(global-set-key (kbd "s-c l") #'lsp)

(use-package lsp-ivy
  :after (lsp-mode ivy))

;; completation anything
(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode))

;; for multiple cursors purpose
(use-package multiple-cursors
  :bind (("C-c m" . mc/edit-lines)
	 ("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-m" . mc/mark-all-like-this)))
