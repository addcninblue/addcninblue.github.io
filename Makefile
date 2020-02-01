.PHONY: serve
serve:
	bundle exec jekyll serve --port 8000 --livereload

.PHONY: deploy
deploy:
	cd _deploy && ./deploy
