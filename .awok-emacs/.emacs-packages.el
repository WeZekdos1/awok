(unless (package-installed-p 'ivy)
  (package-install 'ivy))

(unless (package-installed-p 'gruber-darker-theme))
  (package-install 'gruber-darker-theme)

(unless (package-installed-p 'magit))
  (package-install 'magit)
