1;;
;; Install (minor) mode for editing python source code.
;;

;; Change initial frame size
;;
(setq initial-frame-plist '(width 80 height 50))

;;
;; Always turn-on color-based syntax highlighting.
;;
;; (global-font-lock-mode t)
;; (setq font-lock-maximum-decoration t)
(font-lock-fontify-buffer)


;;
;; Indent using two spaces instead of four for java.
(defun my-java-mode-hook ()
  (setq c-basic-offset 2))
(add-hook 'java-mode-hook 'my-java-mode-hook)

;;
;; Use bash for shell
;;
 
;; (setq exec-path (cons "C:/cygwin/bin" exec-path))
(setq shell-file-name "bash.exe")
;; (setenv "SHELL" shell-file-name)
;; (setenv "PATH" (concat (getenv "PATH") ";C:\\cygwin\\bin"))
(setq explicit-shell-file-name shell-file-name)
(setq explicit-shell-args '("--login" "-i"))
(setq shell-command-switch "-ic")
(setq w32-quote-process-args t)
(defun bash ()
  (interactive)
  (let ((binary-process-input t)
        (binary-process-output nil))
    (shell)))

(setq process-coding-system-alist (cons '("bash" . 
                                          (raw-text-dos . raw-text-unix))
                                        process-coding-system-alist))


;;
;; AutoHotKey mode.
;;
(setq ahk-syntax-directory "C:/Program Files/AutoHotKey/Extras/Editors/Syntax")
(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-mode))
(autoload 'ahk-mode "ahk-mode" "Mode for editing AutoHotKey scripts." t)

;;;
;;; ANTLR mode
;;;
(autoload 'antlr-mode "antlr-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.g\\'" . antlr-mode))
(add-hook 'speedbar-load-hook  ; would be too late in antlr-mode.el
	  (lambda () (speedbar-add-supported-extension ".g")))
(add-hook 'antlr-mode-hook
 (function (lambda ()
	     (make-local-variable 'indent-tabs-mode)
	     (setq indent-tabs-mode nil)
	     (if window-system
		 (progn
		   (font-lock-mode))))))
;;; Make expanded...g files default to read-only mode
(add-hook 'antlr-mode-hook
	  (function
	   (lambda ()
	     (if (string-match "expanded.*\\.g"  (buffer-name))
		 (toggle-read-only 1)
	       nil))))

;;
;; Install mode for editing Clojure source code.
;;
(require 'clojure-mode)


;;
;; Install (minor) mode for editing C# source code.
;;

(autoload 'csharp-mode "csharp-mode" 
  "Major mode for editing C# code." t)
(setq auto-mode-alist (cons '( "\\.cs\\'" . csharp-mode ) auto-mode-alist ))
(setq interpreter-mode-alist
      (cons '("c#" . csharp-mode)
            interpreter-mode-alist))

;; (load-file "C:/PROGRA~1/XEmacs/site-packages/lisp/csharp-mode-font.el")

;; (require 'csharp-font-lock)
;; (defun my-csharp-mode-hook()
;;        (csharp-font-lock-func)
;;        (turn-on-font-lock))
;; (add-hook 'csharp-mode-hook 'my-csharp-font-lock)

;; Patterns for finding Microsoft C# compiler error messages:
(require 'compile)
(push '("^\\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)): error" 1 2 3 2) compilation-error-regexp-alist)
(push '("^\\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)): warning" 1 2 3 1) compilation-error-regexp-alist)

;; Patterns for defining blocks to hide/show:
(push '(csharp-mode
	"\\(^\\s *#\\s *region\\b\\)\\|{"
	"\\(^\\s *#\\s *endregion\\b\\)\\|}"
	"/[*/]"
	nil
	hs-c-like-adjust-block-beginning)
      hs-special-modes-alist)

;; Install mode for editing DOS batch files.
(setq auto-mode-alist
      (cons '("\\.bat$" . batch-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cmd$" . batch-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("batch" . batch-mode)
            interpreter-mode-alist))

(autoload 'batch-mode "batch-mode" "MS-DOS batch file editing mode." t)


;; Install mode for editing erlang code.
;;
;; (setq load-path (cons  "C:/Program Files/erl<Ver>/lib/tools-<ToolsVer>/emacs"
;; 		       load-path))
;; (setq erlang-root-dir "C:/Program Files/erl5.8.1.1")
;; (setq exec-path (cons "C:/Program Files/erl5.8.1.1/bin" exec-path))
(require 'erlang-start)

;; Enable automatic syntax checking using flymake.
(require 'erlang-flymake)


;; Feature mode for editing cucumber .feature files.
;;
;; Copy files to ~/.emacs.d/elisp/feature-mode and add this to your
;; .emacs to load the mode
;; (add-to-list 'load-path "~/.emacs.d/elisp/feature-mode")
;; ;; optional configurations
;; ;; default language if .feature doesn't have "# language: fi"
;; ;(setq feature-default-language "fi")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
;; ;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; ;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))


;;
;; Windows powershell mode.
;;
;; (require 'powershell-mode)
	

;;
;; Python mode

;; (setq load-path 
;;       (cons "C:/usr/home/jonesl/Professional/Resources/Software/python/python-mode" load-path))

(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

(autoload 'python-mode "python-mode" "Python editing mode." t)

;;
;; rst-mode.el (reStructuredText).

(autoload 'rst-mode "rst-mode" "mode for editing reStructuredText documents" t)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
		("\\.rest$" . rst-mode)) auto-mode-alist))


;; Install mode for editing ruby source code.
;;
(autoload 'ruby-mode "ruby-mode"
  "Major mode for editing Ruby code." t)
(setq auto-mode-alist (cons '( "\\.rb\\'" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("ruby" . ruby-mode)
            interpreter-mode-alist))

;;
;; Install mode for editing ruby source code.
;;

(setq auto-mode-alist
      (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("ruby" . ruby-mode)
            interpreter-mode-alist))
(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)

;;
;; And StringTemplate mode
;;
(autoload 'stringtemplate-mode "stringtemplate-mode"
	"StringTemplate editing mode" t)
(add-to-list 'auto-mode-alist '("\\.st\\'" . stringtemplate-mode))
(add-to-list 'auto-mode-alist '("\\.stg\\'" . stringtemplate-mode))

;; Minor mode to enhance editing of XML files.
(autoload 'xml-lite-mode "xml-lite-mode"
	"Minor mode for editing XML files" t)


;;
;; Emacs does statistics (editor for R).
;;
;; (require 'ess-site)


;; Custom variables



