package pill

const (
	illustBaseURL = "https://www.pixiv.net/member_illust.php?mode=medium&illust_id="
	pximgBaseURL  = "https://i.pximg.net/img-original"
)

// defaultBrowserHeaders is utilized to pretend http requests are sent from a browser.
var defaultBrowserHeaders = []header{
	{"Accept-Language", "en-US,en"},
	{"User-Agent", "Mozilla/5.0 Firefox"},
}

// header defines http header.
type header struct {
	key,
	val string
}

// PixivInfo describes the details of a Pixiv illustration work.
type PixivInfo struct {
	Title string
	// ID is illustration ID. It comes from url query value of "illust_id".
	ID string `json:"id"`
	// Description is the description texts from illustration page.
	Description string `json:"description"`
	// Tags is the array of tags that illustration has.
	Tags []string `json:"tags"`
	// CreatedAt is unix timestamp of the illustration creation date time.
	CreatedAt int64 `json:"created_at"`
	// Sources is urls of pictures uploaded under the illustration.
	// It is an array because a illustration page may contain multiple pictures.
	Sources []string `json:"sources"`
	// Author is the author of the illustration.
	Author PixivMember `json:"author"`
}

// PixivMember describes the details of a Pixiv member (author).
type PixivMember struct {
	// ID is the Pixiv member ID.
	ID string `json:"id"`
	// Name is the Pixiv member name.
	Name string `json:"name"`
	// Avatar is url of the Pixiv member avatar.
	Avatar string `json:"avatar"`
}
