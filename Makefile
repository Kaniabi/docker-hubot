NAME = kaniabi/hubot
VERSION = 1.0rc1

.PHONY: all build test latest release

all: build

build:
	sudo docker build -t $(NAME):$(VERSION) .

latest:
	sudo docker tag $(NAME):$(VERSION) $(NAME):latest

release: latest
	git tag ${VERSION}
	git push origin --tags
