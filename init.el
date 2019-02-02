;;; init.el --- Summary
;;;
;;; Commentary:
;;; Uncle Dave's
;;; This fixed garbage collection, makes Emacs start up faster ;;;;;;;
;;; Code:
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  "No idea?"
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  "Reset garbage collection."
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Package
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")))

(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Config
(when (file-readable-p "~/.emacs.d/MyInit.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/MyInit.org")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-mode t)
 '(package-selected-packages
   (quote
    (pretty-mode meson-mode magit company-shell company-lua slime-company slime company-jedi flycheck-clang-analyzer company-irony company-c-headers flycheck zzz-to-char zerodark-theme expand-region helm projectile async yasnippet-snippets yasnippet swiper popup-kill-ring diminish spaceline company rainbow-delimiters sudo-edit smartparens rainbow-mode avy smex ido-vertical-mode org-bullets spacemacs-theme beacon iedit discover-my-major which-key auto-compile use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 132 :width normal :foundry "DAMA" :family "Ubuntu Mono")))))

;;; init.el ends here
