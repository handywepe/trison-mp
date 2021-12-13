<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title>Trison MP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="apple-touch-icon" href="pages/ico/60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="pages/ico/76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="pages/ico/120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="pages/ico/152.png">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="assets/plugins/pace/pace-theme-flash.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/jquery-scrollbar/jquery.scrollbar.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="assets/plugins/switchery/css/switchery.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
    <script type="text/javascript">
        window.onload = function()
        {
            // fix for windows 8
            if (navigator.appVersion.indexOf("Windows NT 6.2") != -1)
            document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="pages/css/windows.chrome.fix.css" />'
        }
    </script>

</head>

<body>
    <div id="app" style="height: 100% !important">
            @yield('content')
    </div>

    {{-- <script src="{{ asset('assets') }}/plugins/pace/pace.min.js"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/jquery/jquery-3.2.1.min.js" type="text/javascript"></script> --}}
    <script src="{{ asset('assets') }}/plugins/modernizr.custom.js" type="text/javascript"></script>
    {{-- <script src="{{ asset('assets') }}/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/popper/umd/popper.min.js" type="text/javascript"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/jquery/jquery-easy.js" type="text/javascript"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/jquery-ios-list/jquery.ioslist.min.js" type="text/javascript"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/jquery-actual/jquery.actual.min.js"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/jquery-scrollbar/jquery.scrollbar.min.js"></script> --}}
    {{-- <script type="text/javascript" src="{{ asset('assets') }}/plugins/select2/js/select2.full.min.js"></script> --}}
    {{-- <script type="text/javascript" src="{{ asset('assets') }}/plugins/classie/classie.js"></script> --}}
    {{-- <script src="{{ asset('assets') }}/plugins/switchery/js/switchery.min.js" type="text/javascript"></script> --}}


    {{-- BEGIN CORE TEMPLATE JS --}}
    <script src="{{ mix('js/app.js') }}"></script>
    <script src="js/pages.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>