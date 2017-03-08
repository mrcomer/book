#!/bin/sh
command -v go >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo >&2 "Please install https://golang.org/doc/install#install"
    exit 1
fi

#convert to ipynb file
#GOPATH=/tmp/go go get -u github.com/wangkuiyi/ipynb/markdown-to-ipynb

for file in $@ ; do
	/tmp/go/bin/markdown-to-ipynb < $file > ${file%.*}".ipynb"
    if [ $? -ne 0 ]; then
        echo >&2 "markdown-to-ipynb $file error"
        exit 1
    fi
done

