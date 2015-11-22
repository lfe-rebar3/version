# lfe-version

*The LFE rebar3 version plugin*

[lr3-logo]: resources/images/logo.png

[![][lr3-logo]][lr3-logo]


#### Contents

* [Build](#build-)
* [Use](#use-)


## Build


```bash
$ rebar3 compile
```


## Use

Add the required plugins and provider hooks to your ``rebar.config``:

```erlang
{plugins, [
  {'lfe-compile', ".*",
    {git, "https://github.com/lfe-rebar3/compile.git", {tag, "0.2.1"}}},
  {'lfe-version', ".*",
    {git, "https://github.com/lfe-rebar3/version.git", {tag, "0.2.1"}}}
]}.

{provider_hooks, [
   {pre, [{compile, {lfe, compile}}]}
  ]}.
```

Then just call the plugin directly from your project directory:

```bash
$ rebar3 help lfe version

The LFE rebar3 version plugin.

Display the version info for LFE as well as major components of Erlang/OTP.


Usage: rebar3 lfe version
```

```bash
$ rebar3 lfe version
(#(erlang "18")
 #(emulator "7.0")
 #(driver-version "3.2")
 #(lfe "0.10.1")
 #(rebar "3.0.0-beta.4+build.182.refd2628b6"))
```
