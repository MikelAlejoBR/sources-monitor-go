all: build

build:
	go build

clean:
	go clean

run: build
	./sources-monitor-go -status all

inlinerun:
	go run *.go -status all

available: build
	./sources-monitor-go -status available

unavailable: build
	./sources-monitor-go -status unavailable

lint:
	go vet ./...
	golangci-lint run -E gofmt,gci,bodyclose,forcetypeassert,misspell

gci:
	golangci-lint run -E gci --fix


.PHONY: build clean run inlinerun lint gci available unavailable
