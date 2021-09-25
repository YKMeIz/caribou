package handler

import (
	"github.com/YKMeIz/caribou/util"
	"net/http"
)

func indexHandle(w http.ResponseWriter) {
	w.Header().Set("Link", defaultLinkHeaderValue)
	mw := minifyer.Writer("text/html", w)

	err := tpl.Lookup("index.tpl").ExecuteTemplate(mw, "index", struct {
		Domain string
	}{"caribou-archive.ykmeiz.dev"})
	_ = mw.Close()

	if err != nil {
		util.LogError(err)
	}
}
