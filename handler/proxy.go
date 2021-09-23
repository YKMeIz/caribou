package handler

import (
	"encoding/json"
	"github.com/YKMeIz/Pill"
	"github.com/YKMeIz/caribou/util"
	"net/http"
	"path/filepath"
	"strings"
)

func proxyHandle(w http.ResponseWriter, req *http.Request) {
	util.LogDefault(strings.Split(filepath.Base(req.URL.Path), "_")[0])
	b := getMetadata(strings.Split(filepath.Base(req.URL.Path), "_")[0])
	if b == nil {
		notFound(w)
		return
	}

	var info pill.PixivInfo
	if err := json.Unmarshal(b, &info); err != nil {
		util.LogError(err)
		notFound(w)
		return
	}

	for _, v := range info.Sources {
		if strings.Contains(v, req.URL.Path) {
			w.Write(passThrough(v))
			return
		}
	}

	notFound(w)
}
