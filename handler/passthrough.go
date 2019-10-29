package handler

import (
	"github.com/YKMeIz/caribou/util"
	"net/http"
)

func PassthroughHandleFunc() http.HandlerFunc {
	return func(w http.ResponseWriter, req *http.Request) {
		b := passThrough("https://i.pximg.net" + req.URL.Path)
		if b == nil {
			notFound(w)
			return
		}
		w.Write(b)
		return
	}
}

func passThrough(u string) []byte {
	b, err := util.Fetch(u)
	if err != nil {
		util.LogError(err)
	}

	return b
}
