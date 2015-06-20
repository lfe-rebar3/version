(defmodule lfe-version
  (behaviour provider)
  ;; (export (init 1)
  ;;         (do 1)
  ;;         (format_error 1)))
  (export all))

(defun provider-name () 'version)
(defun short-desc () "The LFE rebar3 version plugin.")
(defun deps ()
  '(#(default compile)
    #(default app_discovery)
    #(lfe compile)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Public API
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun init (state)
  (let* ((opts `(#(name ,(provider-name))        ; The 'user friendly' name of the task
                 #(module ,(MODULE))             ; The module implementation of the task
                 #(namespace lfe)                ; All LFE plugins need to have this ns
                 #(bare true)                    ; The task can be run by the user, always true
                 #(deps ,(deps))                 ; The list of dependencies
                 #(example "rebar3 lfe version") ; How to use the plugin
                 #(short ,(short-desc))          ;
                 #(desc ,(info (short-desc)))    ;
                 #(opts '())))                   ; list of options understood by the plugin
         (provider (providers:create opts))
         (new-state (rebar_state:add_provider state provider)))
    `#(ok ,new-state)))

(defun do (state)
  `#(,(lutil:get-versions) ,state))

(defun format_error (reason)
  (io_lib:format "~p" `(,reason)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Internal functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun info (desc)
  (io_lib:format
    (++ "~n~s~n~n"
        "Enter your help text for your version plugin here.~n"
        "~n")
    `(,desc)))
