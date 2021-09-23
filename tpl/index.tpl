{{ define "index" }}
{{ template "header" }}

<title>使用帮助 & 其它说明</title>
</head>
<body>
<div class="container grid-lg" style="padding-top:2em">
<div class="columns">
    <div class="column col-1"></div>
    <div class="column col-10">
        <h2 class="text-center">使用帮助</h2><br>
        <p class="lang-zh-hans">
            这个网站提供直接访问<a href="https://www.pixiv.net">Pixiv</a>(P站)图片及相关信息的服务。除图片外、还可获得包含作者头像、作者名、作品名、作品发布时间、作品描述、作品标签等额外信息。使用方式如下：
        </p>
        <h4>通过图片ID访问相关信息</h4>
        <p class="lang-zh-hans">
        <pre class="code"><code># 网站域名+P站图片ID
<a href="https://{{ .Domain }}/73869218">https://{{ .Domain }}/73869218</a></code></pre>
        </p>
        <h4>通过文件名直接访问图片文件</h4>
        <p class="lang-zh-hans">
        <pre class="code"><code># 网站域名+P站图片文件名
<a href="https://{{ .Domain }}/73869218_p0.png">https://{{ .Domain }}/73869218_p0.png</a>

# P站图片文件网址替换 (i.pximg.net -> {{ .Domain }})
# 作品图片
<a href="https://{{ .Domain }}/img-original/img/2019/03/25/19/00/00/73869218_p0.png">https://{{ .Domain }}/img-original/img/2019/03/25/19/00/00/73869218_p0.png</a>
# 作者头像
<a href="https://{{ .Domain }}/user-profile/img/2012/02/20/20/39/04/4236630_43ff9b8f7e2b4182c8ecb85974e4364f_50.gif">https://{{ .Domain }}/user-profile/img/2012/02/20/20/39/04/4236630_43ff9b8f7e2b4182c8ecb85974e4364f_50.gif</a></code></pre>
        </p>
        <h4>通过图片ID调用API接口</h4>
        <p class="lang-zh-hans">
        <pre class="code"><code># 网站域名+P站图片ID.json
<a href="https://{{ .Domain }}/73869218.json">https://{{ .Domain }}/73869218.json</a></code></pre>
        另一种方式是在HTTP请求头文件里包含<code>Accept</code>参数：<br>
        <pre class="code"
             data-lang="bash"><code>curl --header "Accept: application/json" https://{{ .Domain }}/73869218</code></pre>
        两者返回的内容是一样的：
        <pre class="code" data-lang="json"><code>{
   "Title":"嫌パン小说 第4-4话「よみがえり」",
   "id":"73869218",
   "description":"小说本文はこちら→https://ncode.syosetu.com/n5826ff/19/",
   "tags":[
      "オリジナル",
      "女の子",
      "嫌パン",
      "嫌な颜されながらおパンツ见せてもらいたいシリーズ",
      "メイド",
      "小说家になろう",
      "伊东ちとせ",
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
        <h2 class="text-center" style="margin-top: 3em">著作权声明</h2>
        <p class="lang-zh-hans">
        这个网站只搬运图片。 <br>网站上所显示的所有图片作品、著作权均属于作品作者。 <br>可以通过作者名字或头像、来访问其P站个人页面。
        </p>
        <h2 class="text-center" style="margin-top: 3em">关于缓存数据</h2>
        <p class="lang-zh-hans">
        有时候访问这个网站会有点儿慢、是因为作品元数据(即API请求结果里的内容)均从P站采集。 <br>图片文件以代理的方式从P站直接获取、中间不经过压缩或修改。 <br>
        网站服务器只缓存作品元数据、缓存失效期限为24个小时。网站服务器不会缓存任何图片文件。 <br>
        </p><br>
    </div>
    <div class="column col-1"></div>
</div>

{{ template "footer" }}
{{ end }}
