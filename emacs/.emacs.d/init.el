;Removes anyoing append while installing packages
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(defvar me/default-font-size 130)

(setq inhibit-startup-message t)
(setq visible-bell t)
;; Keeps only one help buffer on the right
(setq display-buffer-reuse-window t)
(set-face-attribute 'default nil :font "Hack NerdFont Mono" :height me/default-font-size)
(load-theme 'wombat)
(windmove-default-keybindings)
;; (set-scroll-bar-mode nil)
(scroll-bar-mode 0)        ; Disable visible scrollbar
(setq-default tab-width 4)
(save-place-mode t)
; ;; Only enable line numbers on modes:
(dolist (mode '(prog-mode-hook
                text-mode-hook
				fundamental-mode-hook))
  (add-hook mode (lambda ()
				   (setq display-line-numbers 'relative))))
(column-number-mode t)



;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))
;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  :bind (
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         :map ivy-switch-buffer-map
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(ivy-mode)
(use-package all-the-icons)


(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 36)))
(use-package doom-themes
  :init (load-theme 'doom-monokai-pro t))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))
(evil-mode 1)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package general)
(general-create-definer rune/leader-keys
  :keymaps '(normal insert visual emacs)
  :prefix "SPC"
  :global-prefix "C-SPC")
(rune/leader-keys
  "t"  '(:ignore t :which-key "toggles")
  "tt" '(counsel-load-theme :which-key "choose theme"))

(use-package hydra
  :after general)
(defhydra hydra-text-scale (:timeout 4)
   "scale text"
   ("k" text-scale-increase "in")
   ("j" text-scale-decrease "out")
   ("escape" nil "finished" :exit t))
(rune/leader-keys
   "ts" '(hydra-text-scale/body :which-key "scale text"))

