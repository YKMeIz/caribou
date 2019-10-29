{{ define "index" }}
{{ template "header" }}

<title>使用幫助 & 其它說明</title>
</head>
<body>
<div class="container grid-lg" style="padding-top:2em">
<div class="columns">
    <div class="column col-1"></div>
    <div class="column col-10">
        <h2 class="text-center">使用幫助</h2><br>
        <p class="lang-zh-hans">
            這個網站提供直接訪問<a href="https://www.pixiv.net">Pixiv</a>(P站)圖片及相關信息的服務。除圖片外、還可獲得包含作者頭像、作者名、作品名、作品發布時間、作品描述、作品標籤等額外信息。使用方式如下：
        </p>
        <h4>通過圖片ID訪問相關信息</h4>
        <p class="lang-zh-hans">
        <pre class="code"><code># 網站域名+P站圖片ID
<a href="https://pximg.ykz.dev/73869218">https://pximg.ykz.dev/73869218</a></code></pre>
        </p>
        <h4>通過文件名直接訪問圖片文件</h4>
        <p class="lang-zh-hans">
        <pre class="code"><code># 網站域名+P站圖片文件名
<a href="https://pximg.ykz.dev/73869218_p0.png">https://pximg.ykz.dev/73869218_p0.png</a>

# P站圖片文件網址替換 (i.pximg.net -> pximg.ykz.dev)
# 作品圖片
<a href="https://pximg.ykz.dev/img-original/img/2019/03/25/19/00/00/73869218_p0.png">https://pximg.ykz.dev/img-original/img/2019/03/25/19/00/00/73869218_p0.png</a>
# 作者頭像
<a href="https://pximg.ykz.dev/user-profile/img/2012/02/20/20/39/04/4236630_43ff9b8f7e2b4182c8ecb85974e4364f_50.gif">https://pximg.ykz.dev/user-profile/img/2012/02/20/20/39/04/4236630_43ff9b8f7e2b4182c8ecb85974e4364f_50.gif</a></code></pre>
        </p>
        <h4>通過圖片ID調用API接口</h4>
        <p class="lang-zh-hans">
        <pre class="code"><code># 網站域名+P站圖片ID.json
<a href="https://pximg.ykz.dev/73869218.json">https://pximg.ykz.dev/73869218.json</a></code></pre>
        另一種方式是在HTTP請求頭文件里包含<code>Accept</code>參數：<br>
        <pre class="code"
             data-lang="bash"><code>curl --header "Accept: application/json" https://pximg.ykz.dev/73869218</code></pre>
        兩者返回的內容是一樣的：
        <pre class="code" data-lang="json"><code>{
   "Title":"嫌パン小説 第4-4話「よみがえり」",
   "id":"73869218",
   "description":"小説本文はこちら→https://ncode.syosetu.com/n5826ff/19/",
   "tags":[
      "オリジナル",
      "女の子",
      "嫌パン",
      "嫌な顔されながらおパンツ見せてもらいたいシリーズ",
      "メイド",
      "小説家になろう",
      "伊東ちとせ",
      "対物ライフル"
   ],
   "created_at":1553508000,
   "sources":[
      "https://i.pximg.net/img-original/img/2019/03/25/19/00/00/73869218_p0.png"
   ],
   "author":{
      "id":"554102",
      "name":"40原",
      "avatar":"https://i.pximg.net/user-profile/img/2012/02/20/20/39/04/4236630_43ff9b8f7e2b4182c8ecb85974e4364f_50.gif"
   }
}</code></pre>
        </p>
        <h2 class="text-center" style="margin-top: 3em">著作權聲明</h2>
        <p class="lang-zh-hans">
        這個網站只搬運圖片。<br>網站上所顯示的所有圖片作品、著作權均屬於作品作者。<br>可以通過作者名字或頭像、來訪問其P站個人頁面。
        </p>
        <h2 class="text-center" style="margin-top: 3em">關於緩存數據</h2>
        <p class="lang-zh-hans">
        有時候訪問這個網站會有點兒慢、是因為作品元數據(即API請求結果里的內容)均從P站採集。<br>圖片文件以代理的方式從P站直接獲取、中間不經過壓縮或修改。<br>
        網站服務器只緩存作品元數據、緩存失效期限為24個小時。網站服務器不會緩存任何圖片文件。<br>
        </p><br>
    </div>
    <div class="column col-1"></div>
</div>

{{ template "footer" }}
{{ end }}
