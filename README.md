# DEPRECATED / ARCHIVED

This functionality is now available in the far more streamlined project https://github.com/lfe-rebar3/rebar3_lfe

# lfe-version

[![Build Status][travis badge]][travis] [![LFE Versions][lfe badge]][lfe] [![Erlang Versions][erlang badge]][versions] [![Tags][github tags badge]][github tags] [![Downloads][hex downloads]][hex package]

*The LFE rebar3 version plugin*

[![Org Logo][lr3-logo]][lr3-logo]


#### Contents [&#x219F;](#contents)

* [Build](#build-)
* [Use](#use-)


## Build


```bash
$ rebar3 compile
```


## Use [&#x219F;](#contents)

Add the required plugins and provider hooks to your ``rebar.config``:

```erlang
{plugins, [
  {'lfe-compile', ".*",
    {git, "https://github.com/lfe-rebar3/compile.git", {tag, "0.5.0"}}},
  {'lfe-version', ".*",
    {git, "https://github.com/lfe-rebar3/version.git", {tag, "0.6.0"}}}
]}.

{provider_hooks, [
   {post, [{compile, {lfe, compile}}]}
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
 #(lfe "1.1.1")
 #(rebar "3.1.1"))
```

## License [&#x219F;](#contents)

BSD 3-Clause License

Copyright © 2015-2019, Duncan McGreggor <oubiwann@gmail.com>

Copyright © 2016, Eric Bailey <eric@ericb.me>


<!-- Named page links below: /-->

[lr3-logo]: priv/images/logo.png
[org]: https://github.com/lfe-rebar3
[github]: https://github.com/lfe-rebar3/version
[gitlab]: https://gitlab.com/lfe-rebar3/version
[travis]: https://travis-ci.org/lfe-rebar3/version
[travis badge]: https://img.shields.io/travis/lfe-rebar3/version.svg
[lfe]: https://github.com/rvirding/lfe
[lfe badge]: https://img.shields.io/badge/lfe-1.3.0-blue.svg
[erlang badge]: https://img.shields.io/badge/erlang-17.5%20to%2022.0-blue.svg
[versions]: https://github.com/lfe-rebar3/version/blob/master/.travis.yml
[github tags]: https://github.com/lfe-rebar3/version/tags
[github tags badge]: https://img.shields.io/github/tag/lfe-rebar3/version.svg
[github downloads]: https://img.shields.io/github/downloads/atom/atom/total.svg
[hex badge]: https://img.shields.io/hexpm/v/rebar3_lfe_version.svg?maxAge=2592000
[hex package]: https://hex.pm/packages/rebar3_lfe_version
[hex downloads]: https://img.shields.io/hexpm/dt/rebar3_lfe_version.svg
