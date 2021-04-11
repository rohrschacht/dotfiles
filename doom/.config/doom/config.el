;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tobias Petrich"
      user-mail-address "tobias.petrich@campus.tu-berlin.de")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 14))
(setq doom-font (font-spec :family "DejaVu Sans Mono Nerd Font" :size 14))
;; (setq doom-font (font-spec :family "Fira Code" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (defun random_theme () (nth (random 5) '(doom-gruvbox doom-Iosvkem doom-peacock doom-molokai doom-monokai-classic)))
;; (setq doom-theme (random_theme))
;; (defun theme-randomize ()
;;   (interactive)
;;   (load-theme (random_theme)))

(use-package! base16-theme
  :config
  (load-theme 'base16-darcula-goland t))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; Search for agenda files recursively in org-directory
(setq org-agenda-file-regexp ".*\\.org")
(setq org-agenda-files (apply 'append
                              (mapcar
                               (lambda (directory)
                                 (directory-files-recursively
                                  directory org-agenda-file-regexp))
                               '("~/org/"))))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Exit insert mode without reaching for the escape key
(setq evil-escape-key-sequence "fd")

;; Communicate TRAMP status
(setq tramp-terminal-type "dumb")

;; Log when task is done
(setq org-log-done 'time)

;; Setup org capture templates
(after! org
  (add-to-list 'org-capture-templates
                 '("w" "Todo for [w]ork" entry
                  (file+headline "~/org/work.org" "Inbox")
                  "* TODO %?\n %i\n %a"
                  :prepend t)
               ))

;; Initialize project sidebar with workspace-presets
(defun my-treemacs-init ()
  (interactive)
  (run-with-timer 0.1 nil (lambda () (abort-recursive-edit)))
  (run-with-timer 0.2 nil (lambda () (treemacs-switch-workspace)))
  (treemacs))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(defun set-tab-width (w)
  (interactive)
  ; START TABS CONFIG [from: https://dougie.io/emacs/indentation/]
  ;; Create a variable for our preferred tab width
  (setq custom-tab-width w)

  ;; Two callable functions for enabling/disabling tabs in Emacs
  (defun disable-tabs () (setq indent-tabs-mode nil))
  (defun enable-tabs  ()
    (local-set-key (kbd "TAB") 'tab-to-tab-stop)
    (setq indent-tabs-mode t)
    (setq tab-width custom-tab-width))

  ;; Hooks to Enable Tabs
  (add-hook 'prog-mode-hook 'enable-tabs)
  ;; Hooks to Disable Tabs
  (add-hook 'lisp-mode-hook 'disable-tabs)
  (add-hook 'emacs-lisp-mode-hook 'disable-tabs)

  ;; Language-Specific Tweaks
  (setq-default python-indent-offset custom-tab-width) ;; Python
  (add-hook 'python-mode-hook 'disable-tabs)
  (setq-default js-indent-level custom-tab-width)      ;; Javascript

  ;; Making electric-indent behave sanely
  (setq-default electric-indent-inhibit t)

  ;; Make the backspace properly erase the tab instead of
  ;; removing 1 space at a time.
  (setq backward-delete-char-untabify-method 'hungry)

  ;; (OPTIONAL) Shift width for evil-mode users
  ;; For the vim-like motions of ">>" and "<<".
  (setq-default evil-shift-width custom-tab-width)

  ;; WARNING: This will change your life
  ;; (OPTIONAL) Visualize tabs as a pipe character - "|"
  ;; This will also show trailing characters as they are useful to spot.
  (setq whitespace-style '(face tabs tab-mark trailing))
  (custom-set-faces
   '(whitespace-tab ((t (:foreground "#636363")))))
  (setq whitespace-display-mappings
        '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
  (global-whitespace-mode) ; Enable whitespace mode everywhere

  ;; FINALLY MAKE EMACS INSERT TAB CHARACTERS WHEN PRESSING TAB
  (setq tab-always-indent nil)
  ; END TABS CONFIG
  )

(set-tab-width 4)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "#636363")))))
