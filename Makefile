.PHONY: serve
serve:
	bundle exec jekyll serve --port 8000 --livereload --livereload_port 8001 --config _config.yml,_config_dev.yml

.PHONY: deploy
deploy:
	cd _deploy && ./deploy
