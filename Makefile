SOURCEDIR=.
SOURCES :=  $(shell find $(SOURCEDIR) -name '*.go')

OUTDIR=
BINARY=

VERSION=1.0.0
BUILD=`date +"%s"`

LDFLAGS=-ldflags "-X github.com/rithium/version.Version=${VERSION} -X github.com/rithium/version.Build=${BUILD}"

build:
	go get -d -v
	go build -v ${LDFLAGS} -o ${BINARY} main.go

xbuild:
	env GOOS=linux GOARCH=arm go build -v ${LDFLAGS} -o ${BINARY} main.go

install:
	go install ${LDFLAGS}

clean:
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

.PHONY: clean install