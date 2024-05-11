.PHONY: build run clean

# Name of the output binary
BINARY_NAME := mysql-anywhere-syncer
BUILD_DIR_NAME := mysql-anywhere-syncer-release

build:
	go build -o $(BINARY_NAME) .

build-linux:
	GOOS=linux GOARCH=amd64 go build -o $(BINARY_NAME) .

clean:
	if [ -f $(BINARY_NAME) ]; then rm $(BINARY_NAME); fi
	if [ -d $(BUILD_DIR_NAME) ]; then rm -rf $(BUILD_DIR_NAME); fi

release-linux: clean build-linux
	mkdir -p ${BUILD_DIR_NAME} && cp $(BINARY_NAME) ${BUILD_DIR_NAME} && \
    cp app.yml ${BUILD_DIR_NAME} 
	rm $(BINARY_NAME)

dev: clean build
	./$(BINARY_NAME)

