<!-- START HEADER -->
<div class="header ">
<!-- START MOBILE SIDEBAR TOGGLE -->
<a href="#" class="btn-link toggle-sidebar d-lg-none pg pg-menu" data-toggle="sidebar">
</a>
<!-- END MOBILE SIDEBAR TOGGLE -->
<div class="">
    <div class="brand inline m-l-10" style="width: 110px;">
    <img src="images/logo-tmp.png" alt="logo" data-src="images/logo-tmp.png" data-src-retina="images/logo-tmp.png" height="30">
    </div>
    {{-- search --}}
    {{-- <div class="d-lg-inline-block d-none border-left">
        <div style="height: 30px"></div>
    </div> --}}
    <div class="d-lg-inline-block d-none font-montserrat all-caps pl-2 border-left align-middle" style="height: 30px">
        {{-- <div class="my-auto">
            <strong>CV. Trison Media Print</strong>
        </div> --}}
    </div>
    <div class="d-lg-inline-block d-none font-montserrat all-caps pl-2 align-middle" style="font-size: 16px;">
        <strong>CV. Trison Media Print</strong>
    </div>
    {{-- <a href="#" class="search-link d-lg-inline-block d-none" data-toggle="search"><i class="pg-search"></i>Type anywhere to <span class="bold">search</span></a> --}}
</div>

<div class="d-flex align-items-center">
    <!-- START User Info-->
    <div class="pull-left p-r-10 fs-14 font-heading d-lg-inline-block d-none text-dark">
        <span class="semi-bold">Hai, {{ Auth::user()->name }}</span>
    </div>
    <div class="dropdown pull-right">
        <button class="profile-dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="thumbnail-wrapper d32 circular inline sm-m-r-5">
            <img src="images/avatar.svg" alt="" data-src="images/avatar.svg" data-src-retina="images/avatar.svg" width="32" height="32">
            </span>
        </button>
        <div class="dropdown-menu dropdown-menu-right profile-dropdown" role="menu">
            <p class="label bg-white mx-3 mt-2">{{ Auth::user()->type }}</p>
            <router-link to="/setting" class="dropdown-item">
                <i class="pg-settings_small"></i> Pengaturan
            </router-link>
            {{-- <a href="#" class="dropdown-item"><i class="pg-outdent"></i> Feedback</a> --}}
            {{-- <a href="#" class="dropdown-item"><i class="pg-signals"></i> Help</a> --}}
            <a class="clearfix bg-master-lighter dropdown-item" href="{{ route('logout') }}"
                onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                <span class="pull-left">{{ __('Logout') }}</span>
                <span class="pull-right"><i class="pg-power"></i></span>
            </a>

            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                @csrf
            </form>
        </div>
    </div>
    <!-- END User Info-->
    {{-- <a href="#" class="header-icon pg pg-alt_menu btn-link m-l-10 sm-no-margin d-inline-block" data-toggle="quickview" data-toggle-element="#quickview"></a> --}}
    </div>
</div>
<!-- END HEADER -->
