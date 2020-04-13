.PHONY: serve
serve:
	bundle exec jekyll serve --port 8000 --livereload --config _config.yml,_config_dev.yml

.PHONY: deploy
deploy:
	cd _deploy && ./deploy
