package handler

import (
	"fmt"
	"github.com/YKMeIz/caribou/util"
	"github.com/tdewolff/minify"
	"github.com/tdewolff/minify/html"
	"io/ioutil"
	"net/http"
	"regexp"
	"strings"
	"text/template"
)

var (
	tpl      *template.Template
	minifyer *minify.M
)

const defaultLinkHeaderValue = "</static/spectre.min.css>; as=style; rel=preload"

func init() {
	var tplFiles []string
	files, err := ioutil.ReadDir("tpl")
	if err != nil {
		fmt.Println(err)
	}
	for _, file := range files {
		filename := file.Name()
		if strings.HasSuffix(filename, ".tpl") {
			tplFiles = append(tplFiles, "tpl/"+filename)
		}
	}

	tpl, err = template.ParseFiles(tplFiles...)
	if err != nil {
		util.LogPanic(err)
	}

	minifyer = minify.New()
	minifyer.AddFunc("text/html", html.Minify)
}

func RootHandleFunc() http.HandlerFunc {
	return func(w http.ResponseWriter, req *http.Request) {

		// index page
		if strings.TrimSuffix(req.URL.Path, "/") == "" {
			indexHandle(w)
			return
		}

		// json api
		if strings.Contains(req.Header.Get("Accept"), "application/json") || strings.HasSuffix(req.URL.Path, ".json") {
			apiHandle(w, req)
			return
		}

		// image short link
		if regexp.MustCompile(`\.[jpegnifJPEGNIF]{3,4}$`).MatchString(req.URL.Path) {
			proxyHandle(w, req)
			return
		}

		// illustration page
		illustHandle(w, req)

	}
}
