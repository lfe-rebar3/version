(defmodule lr3-ver-util
  (export all))

(defun get-app-version (app-name)
  (application:load app-name)
  (case (application:get_key app-name 'vsn)
    (`#(ok ,vsn) vsn)
    (_ 'app-not-found)))

(defun get-version ()
  (get-app-version 'lfe-version))

(defun get-versions ()
  `(#(erlang ,(erlang:system_info 'otp_release))
    #(emulator ,(erlang:system_info 'version))
    #(driver-version ,(erlang:system_info 'driver_version))
    #(lfe ,(get-app-version 'lfe))))

(defun get-versions-with-rebar ()
  (++ (get-versions)
      `(#(rebar ,(get-app-version 'rebar)))))
