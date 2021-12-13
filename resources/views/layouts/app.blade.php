@extends('layouts.skeleton')

@section('app')
<nav class="page-sidebar" data-pages="sidebar">
    {{-- @include('partials.sidebar') --}}
    <sidebar></sidebar>
</nav>

<!-- START PAGE-CONTAINER -->
<div class="page-container">
    @include('partials.header')
    <!-- START PAGE CONTENT WRAPPER -->
    <div class="page-content-wrapper">
        <div class="container-block">
            <!-- START PAGE CONTENT -->
            <router-view></router-view>
            <vue-progress-bar></vue-progress-bar>

            <div class="container-fluid container-fixed-lg footer pull-bottom sm-pull-bottom">
                @include('partials.footer')
            </div>
        </div>
    </div>
</div>


<!-- START OVERLAY SEARCH -->
<div class="overlay hide" data-pages="search">
    @include('partials.search')
</div>
<!-- END OVERLAY -->

@endsection
