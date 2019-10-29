package handler

import (
	"github.com/YKMeIz/caribou/util"
	"net/http"
)

func notFound(w http.ResponseWriter) {
	w.Header().Set("Link", defaultLinkHeaderValue)
	err := tpl.Lookup("notfound.tpl").ExecuteTemplate(w, "notfound", nil)
	if err != nil {
		util.LogError(err)
		w.Write([]byte("404 Not Found."))
	}
}
