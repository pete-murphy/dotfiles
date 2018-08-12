(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(add-to-list 'custom-theme-load-path "~/.emacs.d/oceanic-theme")
(load-theme 'oceanic t)
(evil-mode 1)
;; (custom-set-faces '(default ((t (:stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "SF Mono")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(blink-cursor-alist (quote ((nil))))
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (oceanic)))
 '(custom-safe-themes
   (quote
    ("5c9bd73de767fa0d0ea71ee2f3ca6fe77261d931c3d4f7cca0734e2a3282f439" default)))
 '(fringe-mode 0 nil (fringe)))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1) 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1B2B34" :foreground "#D8DEE9" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "SF Mono"))))
 '(fringe ((t (:background "windowFrameColor")))))
