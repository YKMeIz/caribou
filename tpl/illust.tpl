{{ define "illust" }}
{{ template "header" }}

<title>「{{ .Title }}」/「{{ .Author.Name }}」のイラスト</title>
</head>
<body>
<div class="container grid-lg" style="padding-top:2em">
    <div class="columns">
        <div class="column col-1"></div>
        <div class="column col-10">
            <div class="tile">
                <div class="tile-icon">
                    <figure class="avatar avatar-lg">
                        <a href="https://www.pixiv.net/member.php?id={{ .Author.ID }}">
                            <img src="{{ .Author.Avatar }}" alt="...">
                        </a>
                    </figure>
                </div>
                <div class="tile-content">
                    <p class="tile-title">
                        <span class="text-bold text-large lang-ja" lang="ja">{{ .Title }}</span>
                        <br>
                        <span class="text-gray lang-ja" lang="ja">by <a
                                    href="https://www.pixiv.net/member.php?id={{ .Author.ID }}" lang="ja">{{ .Author.Name }}</a></span>&nbsp;&nbsp;<span
                                class="text-gray lang-ja" id="created_by" lang="ja">{{ .CreatedAt }}</span>
                    </p>
                    <p class="tile-subtitle lang-ja" lang="ja">{{ .Description }}</p>
                    <div class="tile-action">
                        {{ range .Tags }}
                            <span class="label label-rounded lang-ja" lang="ja" style="margin: 0.2em 0.1em">{{ . }}</span>
                        {{ end }}
                    </div>
                </div>
            </div>
        </div>
        <div class="column col-1"></div>
    </div>
    <div class="columns" style="padding-top:1em">
        <div class="column col-1"></div>
        <div class="column col-10">
            {{ range .Sources }}
                <img src="{{ . }}" class="img-responsive" style="padding-top:1em">
            {{ end }}
        </div>
        <div class="column col-1"></div>
    </div>
    <script>
        const t = document.getElementById("created_by").textContent;
        const nt = new Date(t * 1000);
        const options = {
            weekday: 'short',
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: 'numeric',
            minute: 'numeric',
            second: 'numeric'
        };
        document.getElementById("created_by").textContent = nt.toLocaleDateString('ja-JP', options);
    </script>

{{ template "footer" }}
{{ end }}