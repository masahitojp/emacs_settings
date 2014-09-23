(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
(package-initialize)


(require 'cl)

(defvar installing-package-list
  '(
    ;; �����Ɏg���Ă���p�b�P�[�W�������B
    auto-async-byte-compile
    auto-complete
    clojure-mode
    cider
    ac-nrepl
    clojure-cheatsheet
    slamhound
    paredit
    markdown-mode
    direx
    init-loader
    helm
    helm-c-moccur
    helm-ag
    helm-gtags
    nyan-mode
    wgrep-helm
    yaml-mode
    rainbow-delimiters
    tuareg
    js2-mode
    yasnippet
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))


;; load-path
(add-to-list 'load-path "~/.emacs.d/")

;; init-loader �̐ݒ�
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
;; �f�t�H���g��"~/.emacs.d/inits"�ȉ��̃t�@�C�������[�h����
(require 'init-loader)
(init-loader-load)

;; ���j���[�o�[���\��
(if (eq system-type 'darwin)
    (ns-toggle-toolbar))
