package handler

import (
	"github.com/YKMeIz/caribou/util"
	"net/http"
	"path/filepath"
	"strconv"
	"strings"
)

func illustHandle(w http.ResponseWriter, req *http.Request) {
	if !validID(filepath.Base(req.URL.Path)) {
		notFound(w)
		return
	}

	info, err := getPixivInfo(filepath.Base(req.URL.Path))
	if err != nil {
		util.LogError(err)
		notFound(w)
		return
	}

	for i, v := range info.Sources {
		info.Sources[i] = strings.ReplaceAll(v, "https://i.pximg.net", "")
	}

	info.Author.Avatar = strings.ReplaceAll(info.Author.Avatar, "https://i.pximg.net", "")

	linkHeaderValue := defaultLinkHeaderValue
	for _, v := range info.Sources {
		linkHeaderValue += ", <" + v + ">; as=image; rel=preload"
	}
	linkHeaderValue += ", <" + info.Author.Avatar + ">; as=image; rel=preload"

	w.Header().Set("Link", linkHeaderValue)
	mw := minifyer.Writer("text/html", w)

	err = tpl.Lookup("illust.tpl").ExecuteTemplate(mw, "illust", info)
	_ = mw.Close()

	if err != nil {
		util.LogError(err)
		notFound(w)
	}
}

func validID(id string) bool {
	_, err := strconv.Atoi(id)
	return err == nil
}
