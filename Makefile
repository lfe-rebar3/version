make:
	rebar3 compile

clean:
	rm -rf .rebar .rebar3 deps _build rebar.lock ebin/*

push:
	git push github master
	git push gitlab master

push-tags:
	git push github --tags
	git push gitlab --tags

push-all: push push-tags

publish:
	rebar3 as hexpm hex publish
