(package-initialize)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/")
             t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/")
             t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/")
             t)

(autoload 'package-pinned-packages "package")

(setq required-packages '(
                          (ag . "melpa-stable")
                          (bats-mode . "melpa")
                          (better-defaults . "melpa-stable")
                          (cider . "melpa-stable")
                          (clojure-mode . "melpa-stable")
                          (expand-region . "melpa-stable")
                          (ido-completing-read+ . "melpa-stable")
                          (ido-ubiquitous . "melpa-stable")
                          (ido-vertical-mode . "melpa-stable")
                          (magit . "melpa-stable")
                          (markdown-mode . "melpa-stable")
                          (paredit . "melpa-stable")
                          (php-mode . "melpa-stable")
                          (projectile . "melpa-stable")
                          (smex . "melpa-stable")
                          (yaml-mode . "melpa-stable")
                          ))
(defun install-required-packages ()
  (interactive)
  (mapc (lambda (package)
          (message "%s" (car package))
          (package-install (car package)))
        required-packages))

;;; Force us to be explicit about killing emacs
(global-unset-key (kbd "C-x C-c"))

(load-theme 'tsdh-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode smex projectile php-mode paredit markdown-mode magit ido-vertical-mode ido-ubiquitous ido-completing-read+ expand-region clojure-mode cider better-defaults bats-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode 1)
