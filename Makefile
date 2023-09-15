format:
	go fmt ./...

clean_test_cache:
	go clean -testcache

test: clean_test_cache
	go test ./...

coverage:
	go test ./... -coverprofile=coverage.out
	go tool cover -html=coverage.out

update_deps:
	go get -t -u ./...

SMOCKER_VERSION=0.18.2

start-smocker:
	docker run -d \
	-p 8080:8080 \
	-p 8081:8081 \
	--name smocker \
	thiht/smocker:${SMOCKER_VERSION}

stop-smocker:
	docker stop smocker
	docker rm smocker
