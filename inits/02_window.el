;; サイズ
(setq initial-frame-alist
      (append
       '((top                 . 22)    ; フレームの Y 位置(ピクセル数)
       	 (left                . 600)   ; フレームの X 位置(ピクセル数)
 	 (width               . 81)    ; フレーム幅(文字数)
 	 (height              . 50))   ; フレーム高(文字数)
      initial-frame-alist))

;; 色と透過
(set-background-color "Black")
(set-foreground-color "White")
(add-to-list 'default-frame-alist '(alpha . 85))

;; スクロールバーを非表示
(set-scroll-bar-mode nil)
