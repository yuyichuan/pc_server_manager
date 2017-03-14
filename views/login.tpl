<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1" />
		<!-- 上述三个meta标签必须放在最前面，任何其他内容都必须跟随其后  -->
		<meta name="description" content="">
		<meta name="author" content="" />
		<title>设备管理</title>
		<link href="include/css/normalize.css" rel="stylesheet" />
		<!--Bootstrap core css  -->
		<link href="include/css/bootstrap.css" rel="stylesheet">
		<link href="include/css/bootstrap-responsive.css" rel="stylesheet">
		<!--custom styles for this template  -->
		<link href="include/css/device.css" rel="stylesheet" />
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="lib/html5/src/html5shiv.js"></script>
		<script src="lib/html5/src/html5shiv-printshiv.js"></script>
		<![endif]-->
	</head>
	<body class="loginBg">
		<form class="form-signin" action="/login" method="post">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="" class="sr-only">username</label>
			<input class="form-control"  type="text" placeholder="username" name="uname">
			<label for="" class="sr-only">password</label>
			<input class="form-control" type="password" placeholder="password" name="upwd">
			<button class="btn btn-lg btn-primary btn-block mtb10" type="submit">
				Sign in
			</button>
            <div style="color:red;">{{viewmodel['errmsg']}}</div>
		</form>
		<script src="include/js/lib/jquery/jquery.min-1.12.4.js"></script>
		<script src="include/js/lib/bootstrap/bootstrap.min.js"></script>
		<script src="include/js/pages/deviceManage.js"></script>
	</body>
</html>