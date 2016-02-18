NAME = kaniabi/hubot
VERSION = 1.1

.PHONY: all build test latest release

all: build

build:
	docker build -t $(NAME):$(VERSION) .

latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

release: latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
