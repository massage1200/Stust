; C-h を BackSpace に
(global-set-key "\C-h" 'delete-backward-char)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
;; mozc
(require 'mozc)
(setq default-input-method "japanese-mozc")
;; 候補をカーソル下に配置したい時は下のコメントを外す
;(setq mozc-candidate-style 'overlay)
;; 半角/全角キーでmozcをオンにしたい時は下のコメントを外す
;(global-set-key [zenkaku-hankaku] 'toggle-input-method)
;(defadvice mozc-handle-event (around intercept-keys (event))
;  (if (member event (list 'zenkaku-hankaku))
;      (progn
;       (mozc-clean-up-session)
;       (toggle-input-method))
;    (progn ;(message "%s" event) ;debug
;      ad-do-it)))
;(ad-activate 'mozc-handle-event)
;; リージョンをハイライト
(transient-mark-mode t)
;; cc-mode
(defun my-c-mode-hook ()
  (c-set-style "stroustrup")
  ; タブをスペースに
  (setq indent-tabs-mode nil))
(add-hook 'c-mode-hook 'my-c-mode-hook)
; スペースの連続を1回の削除で消す
(defun my-c-common-mode ()
  (c-toggle-hungry-state 1))
(add-hook 'c-mode-common-hook 'my-c-common-mode)
; C-c c で compile コマンドを呼び出す
(define-key mode-specific-map "c" 'compile)
; C-c e で next-error コマンドを呼び出す
(define-key mode-specific-map "e" 'next-error)
;; gdb設定
(setq gdb-many-windows t)
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
(setq gdb-use-separate-io-buffer t)
;; フォントの設定
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "VL ゴシック")))))
;; migemo
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\a"))
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
(setq migemo-regex-dictionary nil)
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(require 'migemo)
;; 装飾キー＋矢印キーでウインドウを移動
;(windmove-default-keybindings) ; Shift＋矢印にしたいときはこのコメントを外す
(windmove-default-keybindings 'meta) ; Alt＋矢印
;(windmove-default-keybindings 'super) ; Win＋矢印にしたいとき

;; スタート画面を消すには以下のコメントを外す
;(custom-set-variables
; '(inhibit-startup-screen t))

