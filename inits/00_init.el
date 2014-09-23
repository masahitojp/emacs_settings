;; PATHｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿ
;; $SHELLｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿｿ
(add-to-list 'exec-path (expand-file-name "/usr/local/bin"))

;;; current line
(global-hl-line-mode 1)

;;; color
(set-face-background 'hl-line "darkolivegreen")
(savehist-mode 1)

;;; memory cursol
(setq-default save-place t)
(require 'saveplace)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-o") 'dabbrev-expand)

;;; 時刻を表示
(display-time)

;;; GC
(setq gc-cons-threshold (* 5 gc-cons-threshold))
(setq message-log-max 1000)
(setq enable-recursive-minibuffers t)

;; 履歴をたくさん保存
(setq history-length 1000)

;; キーストローク
(setq echo-keystroke 0.1)

;; 大きいファイルを開くと警告
(setq large-file-warning-threshold (* 25 1024 1024))
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;; yesの代わりにyと入力
(defalias 'yes-or-no-p 'y-or-n-p)

;;
(require 'sequential-command-config)
(sequential-command-setup-keys)

;; マイナーモード衝突問題を解決
(require 'minor-mode-hack)
;; 現在位置のファイル・URLを開く
(ffap-bindings)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; 最近使ったファイルを開く
(setq recentf-max-saved-items 500)
(require 'recentf-ext)

;; ファイル名の変更
;;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(require 'color-moccur)
(setq moccur-split-word t)

(require 'moccur-edit)
(setq moccur-split-word t)

;; anything-mode有効
;;(require 'anything-startup)
;; paren-mode
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline "#ffff00" :weight 'extra-bold)

;; ブロックを折り畳む
(require 'hideshow)
(require 'fold-dwim)

;; 現在の関数名を常に表示
(which-func-mode 1)
(setq which-func-modes t)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))



;;
(require 'text-translator)
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-enja)

;; print-page
(setq print-region-function
      (lambda (start end
                     &optional lpr-prog
                     delete-text buf display
                     &rest rest)
        (let* ((procname (make-temp-name "w32-print-"))
               (tempfile
                (subst-char-in-string
                 ?/ ?\\
                 (expand-file-name procname temporary-file-directory)))
               (coding-system-for-write 'sjis-dos))
          (write-region start end tempfile)
          (set-process-sentinel
           (start-process procname nil "C:\\Users\\nakamura\\bin\\sakura2\\sakura.exe" tempfile)
           (lambda (process event)
             (let ((tempfile
                    (expand-file-name (process-name process)
                                      temporary-file-directory)))
               (when (file-exists-p tempfile)
                 (delete-file tempfile))))))))

(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)
