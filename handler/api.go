package handler

import (
	"encoding/json"
	"github.com/YKMeIz/KV"
	"github.com/YKMeIz/Pill"
	"github.com/YKMeIz/caribou/util"
	"net/http"
	"path/filepath"
	"strings"
	"time"
)

var (
	standardTTL = time.Duration(24 * time.Hour)
	cache       = KV.NewNameSpace(KV.Config{
		DiskLess: true,
	})
)

func apiHandle(w http.ResponseWriter, req *http.Request) {
	base := filepath.Base(req.URL.Path)
	b := getMetadata(strings.TrimSuffix(base, ".json"))
	if b != nil {
		w.Write(b)
		return
	}
	notFound(w)
}

func getMetadata(id string) []byte {
	b, err := cache.Get([]byte(id))

	if err != nil {
		info, err := pill.Pixiv(id)
		if err != nil {
			util.LogError(err)
			return nil
		}

		b, err = json.Marshal(info)
		if err != nil {
			util.LogError(err)
			return nil
		}
	}

	err = cache.Put([]byte(id), b, standardTTL)
	if err != nil {
		util.LogError(err)
		return nil
	}

	return b
}

func getPixivInfo(id string) (pill.PixivInfo, error) {
	var info pill.PixivInfo
	err := json.Unmarshal(getMetadata(id), &info)
	return info, err
}
