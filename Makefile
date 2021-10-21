.PHONY: serve
serve:
	bundle exec jekyll serve --port 30000 --livereload --livereload_port 30001 --config _config.yml,_config_dev.yml --trace

.PHONY: deploy
deploy:
	cd _deploy && ./deploy

.PHONY: build
build:
	bundle exec jekyll build
