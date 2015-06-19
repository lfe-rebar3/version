# lfe-version

*The LFE rebar3 version plugin*

<img src="resources/images/logo.png" />


## Build


```bash
    $ rebar3 compile
```


## Use

Add the plugin to your ``rebar.config``:

```erlang
{plugins, [
  {'lfe-version', ".*",
    {git, "https://github.com/lfex/rebar3-lfe-version.git",
      {branch, "master"}}}
]}.
```

Then just call your plugin directly from your project directory:

```bash
$ rebar3 help lfe version
...
```

```bash
$ rebar3 lfe version
...
```
