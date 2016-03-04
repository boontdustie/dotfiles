(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.

  Return a list of installed packages or nil for every skipped package."
    (mapcar
         (lambda (package)
                (if (package-installed-p package)
                           nil
                                  (if (y-or-n-p (format "Package %s is missing. Install it? " package))
                                               (package-install package)
                                                        package)))
            packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
        (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'evil
			  'magit
			  'helm
			  'git-gutter
			  'projectile
			  'org)

;; THINGS TO LOAD ON STARTUP

;; General
;;;; Select the help window automatically when opening
(setq help-window-select t)

;;;; Load the theme
(load-theme 'manoj-dark)

;; Require and Load Evil Mode
(require 'evil)
(evil-mode t)

;; Load git gutter mode
(global-git-gutter-mode +1)

;;;; Customize the git-gutter display
(custom-set-variables
 '(git-gutter:modified-sign "  ")
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-"))

(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

;; Load projectile
(projectile-global-mode)

;; Load org mode details
(setq org-todo-keywords
            '((sequence "☛ TODO" "○ IN-PROGRESS" "⚑ WAITING" "|" "✓ DONE" "✗ CANCELED")))

;;;; ORG-MODE: Behavior and key map for opening the agenda
(defun gpk-pop-to-org-agenda (split)
  "Visit the org agenda, in the current window or a SPLIT."
  (interactive "P")
  (org-agenda-list)
  (when (not split)
    (delete-other-windows)))

(define-key global-map (kbd "C-c t a") 'gpk-pop-to-org-agenda)

(setq org-capture-templates
      '(("a" "My TODO task format." entry
	 (file "todo.org")
	 "* ☛ TODO %?
      SCHEDULED: %t")))

;;;; ORG-MODE: Behavior and key-map for capturing tasks
(defun gpk-org-task-capture ()
  "Capture a task with my default template."
  (interactive)
    (org-capture nil "a"))

(define-key global-map (kbd "C-c c") 'gpk-org-task-capture)

;;;; ORG-MODE: Setting up where agenda/todo files go
(setq org-agenda-files '("~/git/me/todo"))
(setq org-default-notes-file "~/git/me/todo/todo.org")
(setq org-directory "~/git/me/todo")


;;;; ORG-MODE: Other customizations
(setq org-agenda-text-search-extra-files '(agenda-archives))
(setq org-blank-before-new-entry '((heading . t)
                                    (plain-list-item . t)))
(setq org-enforce-todo-dependencies t)
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))

;;;; ORG-MODE: Evil key mapping
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (define-key org-agenda-mode-map "j"         'org-agenda-next-line)
            (define-key org-agenda-mode-map "k"         'org-agenda-previous-line)
            (define-key org-agenda-mode-map "n"         'org-agenda-next-date-line)
            (define-key org-agenda-mode-map "p"         'org-agenda-previous-date-line)
            (define-key org-agenda-mode-map "c"         'air-org-agenda-capture)
            (define-key org-agenda-mode-map (kbd "RET") 'org-agenda-switch-to)

            ))

;;;; ORG-MODE: Auto insert when capturing tasks
(add-hook 'org-capture-mode-hook
          (lambda ()
            (evil-insert-state)))
