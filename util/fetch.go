package util

import (
	"io/ioutil"
	"net/http"
)

func Fetch(u string) ([]byte, error) {
	c := http.DefaultClient

	req, err := http.NewRequest("GET", u, nil)
	if err != nil {
		return nil, err
	}

	req.Header.Set("Accept-Language", "en-US,en")
	req.Header.Set("User-Agent", "Mozilla/5.0 Firefox")
	req.Header.Set("Referer", "https://www.pixiv.net/member_illust.php?mode=medium&illust_id=")

	resp, err := c.Do(req)

	if err != nil {
		return nil, err
	}

	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, err
	}

	b, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}

	return b, nil
}
