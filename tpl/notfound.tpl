{{ define "notfound" }}
{{ template "header" }}

<title>404小隊：「出錯啦！」</title>
</head>
<body>
<div class="container grid-lg" style="padding-top:35vh;">
    <div class="columns" style="height:65vh;">
        <div class="column col-1 hide-md"></div>
        <div class="column col-10 col-xs-12 col-sm-12 col-md-12">
            <img src="https://static.hdslb.com/error/very_sorry.png" class="img-responsive">
        </div>
        <div class="column col-1 hide-md"></div>
    </div>

{{ template "footer" }}
{{ end }}
