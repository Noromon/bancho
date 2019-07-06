build: main.go
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o gobuild.exe

test:
	go test ./...

assets: frontend/Gulpfile.js frontend/package.json
	cd frontend; npm install; gulp
	make assetsbin

getdeps:
	go get -u -v

assetsbin:
	go-bindata -pkg bindata -nomemcopy -o bindata/bindata.go frontend/static/ frontend/templates/
