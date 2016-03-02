NAME = kaniabi/hubot
VERSION = 1.4

.PHONY: all build test latest release

all: build

build:
	sudo docker build -t $(NAME):$(VERSION) .

latest:
	sudo docker tag $(NAME):$(VERSION) $(NAME):latest

release: latest
	@if ! sudo docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	sudo docker push $(NAME)
