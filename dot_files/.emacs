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

(setq required-packages '((ag . "melpa-stable")
                          (bats-mode . "melpa")
                          (better-defaults . "melpa-stable")
                          (cider . "melpa-stable")
                          (clojure-mode . "melpa-stable")
			  (company . "melpa-stable")
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
                          (yaml-mode . "melpa-stable")))

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
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'after-init-hook             'global-company-mode)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-p s")  'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-p b")  'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "M-k")  'kill-sexp)))

;;;hooks
(add-hook 'clojure-mode-hook (lambda ()
                               (cider-mode +1)
                               (paredit-mode +1)))

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (paredit-mode +1)))

(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "M-g") 'goto-line)
