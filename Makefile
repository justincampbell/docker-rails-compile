VERSIONS := 2.1.6 2.1.9 2.2.5 2.3.1

build:
	rm -rf **/Dockerfile
	for v in $(VERSIONS); do \
	  mkdir -p $$v; \
	  cp Dockerfile $$v/Dockerfile; \
	  sed -i .bak "s/FROM ruby/FROM ruby:$$v/" $$v/Dockerfile; \
	done
