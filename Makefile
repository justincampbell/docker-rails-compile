VERSIONS := 2.2.3

template:
	rm -rf **/Dockerfile
	for v in $(VERSIONS); do \
	  mkdir -p $$v; \
	  cp Dockerfile $$v/Dockerfile; \
	  sed -i .bak "s/FROM ruby/FROM ruby:$$v/" $$v/Dockerfile; \
	done

build: template
	docker build .
	for v in $(VERSIONS); do (cd $$v && docker build .); done
