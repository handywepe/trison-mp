@extends('layouts.auth')

@section('content')
<div class="login-wrapper">
    <div class="bg-pic">
        <img src="images/loginpage.jpg" data-src="images/loginpage.jpg"
        data-src-retina="images/loginpage.jpg" alt="" class="lazy" style="height: 100%; min-width: 55%">
        <div class="bg-caption pull-bottom sm-pull-bottom text-white p-l-20 m-b-20">
            <h2 class="semi-bold text-white">
                What Stationery Can Do for You?</h2>
            <p class="medium">
                Stationery provides a keen place to write, sure. But it can also come to the rescue in a variety of instances, including capturing ideas, bearing witness to your innermost thoughts, and helping to lull you back to sleep.
            </p>
            <p class="medium">
                “Whatever you choose for your stationery is your favorite color because it’s where you pour your heart out.”
                – Mary E. Pearson, American children’s author
            </p>
        </div>
    </div>
    <div class="login-container bg-white float-right">
        <div class="p-l-50 m-l-20 p-r-50 m-r-20 p-t-50 m-t-30 sm-p-l-15 sm-p-r-15 sm-p-t-40">
            <img src="images/logo-tmp.png" alt="logo" data-src="images/logo-tmp.png" data-src-retina="images/logo-tmp.png" height="40">
            <p class="p-t-35">Silahkan login untuk memulai.</p>
            <form method="POST" action="{{ route('login') }}">
                @csrf
                <div class="form-group form-group-default">
                    <label>Email</label>
                    <div class="controls">
                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}"
                        placeholder="email@trison.com" required autocomplete="email" autofocus>
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>
                <div class="form-group form-group-default">
                    <label>Password</label>
                    <div class="controls">
                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password"
                        placeholder="kata kunci" required autocomplete="current-password">
                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>
                <!-- START Form Control-->
                <div class="row">
                    <div class="col-md-6 no-padding sm-p-l-10">
                        <div class="checkbox ">
                            <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                            <label class="form-check-label" for="remember">
                                {{ __('ingat saya') }}
                            </label>
                        </div>
                    </div>
                    {{-- <div class="col-md-6 d-flex align-items-center justify-content-end">
                        <a href="#" class="text-info small">Help? Contact Support</a>
                    </div> --}}
                </div>
                <button class="btn btn-primary btn-cons m-t-10" type="submit">Login</button>
            </form>
        </div>
    </div>
</div>

@endsection
