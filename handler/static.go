package handler

import (
	"io/ioutil"
	"net/http"
	"strings"
)

func StaticHandleFunc() http.HandlerFunc {
	return func(w http.ResponseWriter, req *http.Request) {
		b, err := ioutil.ReadFile(req.URL.Path[1:])

		if err != nil {
			notFound(w)
			return
		}

		if strings.HasSuffix(req.URL.Path, ".js") {
			w.Header().Set("Content-Type", "text/javascript; charset=utf-8")
		}

		if strings.HasSuffix(req.URL.Path, ".css") {
			w.Header().Set("Content-Type", "text/css; charset=utf-8")
		}

		w.Write(b)
		return
	}
}
