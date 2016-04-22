(defmodule lr3-ver-util
  (export all))

(defun get-app-version (app-name)
  (application:load app-name)
  (case (application:get_key app-name 'vsn)
    (`#(ok ,vsn) vsn)))

(defun get-version ()
  (get-app-version 'lfe-version))

(defun get-versions ()
  (let ((`#(ok ,rebar-version) (application:get_key 'rebar 'vsn)))
    `(#(erlang ,(erlang:system_info 'otp_release))
      #(emulator ,(erlang:system_info 'version))
      #(driver-version ,(erlang:system_info 'driver_version))
      #(lfe ,(get-app-version 'lfe)))))

(defun get-versions-with-rebar ()
  (++ (get-versions)
      `(#(rebar ,(get-app-version 'rebar)))))
