<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin | Register</title>

<link rel="preload" href="{{ asset('assets/css/adminlte.css') }}" as="style" />

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css"
media="print"
onload="this.media='all'" />

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/styles/overlayscrollbars.min.css"/>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"/>

<link rel="stylesheet" href="{{ asset('assets/css/adminlte.css') }}" />
</head>


<body class="register-page bg-body-secondary">

<div class="register-box">

<div class="card card-outline card-primary">

<div class="card-body register-card-body">

<p class="register-box-msg">Register a new membership</p>

<!-- Global Error Messages -->
@if ($errors->any())
<div class="alert alert-danger">
<ul class="mb-0">
@foreach ($errors->all() as $error)
<li>{{ $error }}</li>
@endforeach
</ul>
</div>
@endif


<form method="POST" action="{{ route('register') }}">
@csrf

<!-- Name -->
<div class="input-group mb-1">
<div class="form-floating">
<input id="registerFullName"
type="text"
class="form-control"
name="name"
value="{{ old('name') }}"
placeholder="">

<label for="registerFullName">Full Name</label>
</div>

<div class="input-group-text">
<span class="bi bi-person"></span>
</div>
</div>

@if ($errors->has('name'))
<span class="text-danger small">
{{ $errors->first('name') }}
</span>
@endif



<!-- Email -->
<div class="input-group mb-1 mt-3">
<div class="form-floating">
<input id="registerEmail"
name="email"
type="email"
class="form-control"
value="{{ old('email') }}"
placeholder="">

<label for="registerEmail">Email</label>
</div>

<div class="input-group-text">
<span class="bi bi-envelope"></span>
</div>
</div>

@if ($errors->has('email'))
<span class="text-danger small">
{{ $errors->first('email') }}
</span>
@endif



<!-- Password -->
<div class="input-group mb-1 mt-3">
<div class="form-floating">
<input id="registerPassword"
type="password"
name="password"
class="form-control"
placeholder="">

<label for="registerPassword">Password</label>
</div>

<div class="input-group-text">
<span class="bi bi-lock-fill"></span>
</div>
</div>

@if ($errors->has('password'))
<span class="text-danger small">
{{ $errors->first('password') }}
</span>
@endif



<!-- Confirm Password -->
<div class="input-group mb-1 mt-3">
<div class="form-floating">
<input id="registerPasswordConfirm"
type="password"
class="form-control"
name="password_confirmation"
placeholder="">

<label for="registerPasswordConfirm">Confirm Password</label>
</div>

<div class="input-group-text">
<span class="bi bi-lock-fill"></span>
</div>
</div>

@if ($errors->has('password_confirmation'))
<span class="text-danger small">
{{ $errors->first('password_confirmation') }}
</span>
@endif



<div class="col-12 mt-3" style="text-align:right;">
<div class="d-grid gap-2">
<button type="submit" class="btn btn-primary">
Sign Up
</button>
</div>
</div>

</form>


<p class="mb-0 mt-3" style="text-align:center">
<a href="{{route('login')}}" class="link-primary text-center">
I already have a membership
</a>
</p>


</div>
</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/browser/overlayscrollbars.browser.es6.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.min.js"></script>

<script src="{{ asset('assets/js/adminlte.js') }}"></script>

</body>
</html>
