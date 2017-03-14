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
		<link href="/include/css/normalize.css" rel="stylesheet" />
		<!--Bootstrap core css  -->
		<link href="/include/css/bootstrap.css" rel="stylesheet">
		<link href="/include/css/bootstrap-responsive.css" rel="stylesheet">
		<!--custom styles for this template  -->
		<link href="/include/css/device.css" rel="stylesheet" />
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="/lib/html5/src/html5shiv.js"></script>
		<script src="/lib/html5/src/html5shiv-printshiv.js"></script>
		<![endif]-->
	</head>
	<body>
		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">设备管理系统</a>
				</div>
				% if viewmodel['user'] > 0:
				<div class="navbar-header">
					<ul class="nav navbar-nav">
					<li class="active">
							<a href="">{{viewmodel['user_name']}}</a>
						</li>
					<li class="active">
							<a href="/logout">退出</a>
						</li>
					</ul>
				</div>
				% else:
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="/login">登录</a>
						</li>

					</ul>
				</div>
				% end
			</div>
		</nav>
		<input type="hidden" name="dispatcher" id="dispatcher" delUrl="include/js/mock-up/success.json"
		refreshUrl="设备管理-列表页.shtml" />
		<div class="main-container">
			<!--<form class="form-inline mtb10">
				<a href="设备管理-详情页.shtml" class="btn btn-primary">新增</a>
			</form>-->
			<div class="">
				<table id="deviceTable" class="table table-condensed table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th class="w60">操作</th>
							<th class="w20"></th>
							<th class="w20"></th>
							<th class="w100">质保</th>
							<th class="w100">投入使用</th>
							<th class="w40">机房</th>
							<th class="w40">机柜</th>
							<th class="w80">位置</th>
							<th class="w80">iDRAC</th>
							<th class="w80">网线标签</th>
							<th class="w150">mac</th>
							<th class="w100">IP地址</th>
							<th class="w40">cpu核</th>
							<th class="w80">硬盘(GB)</th>
							<th class="w80">内存(GB)</th>
							<th class="w120">操作系统</th>
							<th class="w200">业务</th>
							<th class="w40"></th>
							<th class="w200">配置说明</th>
							<th class="w80">型号</th>
							<th class="w80">服务编码</th>
							<th class="w200">备注</th>
							<th class="w80">用户/密码</th>
						</tr>
					</thead>
					<tbody>
					%for itemw in viewmodel['servers']:
					%	item=itemw.server
						<tr data-id="{{item.ind}}">
							<td><a href="/server/{{item.ind}}"><span class="glyphicon glyphicon-cog mr10 " title="详情"></span></a>
								% if viewmodel['user'] > 0:
								<a href="/newserver/{{item.ind}}"><span class="glyphicon glyphicon-plus" title="新增子类"></span></a>
								% end
							</td>
							<td><a class="expandBtn expand" href="javascript:;" title="展开"><span class="glyphicon glyphicon-triangle-top"></span></a></td>
							<td></td>
							<td>{{item.e_time}}</td>
							<td>{{item.s_time}}</td>
							<td>{{item.m_r}}</td>
							<td>{{item.cabinet}}</td>
							<td>{{item.location}}</td>
							<td>{{item.idrac}}</td>
							<td>{{item.cable_label}}</td>
							<td>
							<div class="text-hidden w150" title="{{item.mac}}">{{item.mac}}</div></td>
							<td>{{item.ip}}</td>
							<td>{{item.cpu}}</td>
							<td>{{item.hd}}</td>
							<td>{{item.memory}}</td>
							<td>
							<div class="text-hidden w120" title="{{item.op_sys}}">{{item.op_sys}}</div></td>
							<td>
							<div class="text-hidden w200" title="{{item.bz_name}}">{{item.bz_name}}</div></td>
							<td>{{item.in_using}}</td>
							<td>
							<div class="text-hidden w120" title="{{item.config}}">{{item.config}}</div></td>
							<td>
							<div class="text-hidden w80">{{item.pc_type}}</div></td>
							<td>{{item.pc_code}}</td>
							<td>
							<div class="text-hidden w200" title="{{item.remark}}">{{item.remark}}</div></td>
							<td>{{item.user_pw}}</td>
						</tr>
						%for subitemw in itemw.sub_servers:
						%	subitem=subitemw.server
							<tr data-id="{{item.ind}}-{{subitem.ind}}" data-pid="{{item.ind}}" class="hide">
								<td><a href="/server/{{subitem.ind}}"><span class="glyphicon glyphicon-cog mr10 " title="详情"></span></a>
									% if viewmodel['user'] > 0:
									<a href="/newserver/{{subitem.ind}}"><span class="glyphicon glyphicon-plus" title="新增子类"></span></a>
									% end
								</td>
								<td></td>
								<td><a class="expandBtn expand" href="javascript:;" title="展开"><span class="glyphicon glyphicon-triangle-top"></span></a></td>
								<td>{{subitem.e_time}}</td>
								<td>{{subitem.s_time}}</td>
								<td>{{subitem.m_r}}</td>
								<td>{{subitem.cabinet}}</td>
								<td>{{subitem.location}}</td>
								<td>{{subitem.idrac}}</td>
								<td>{{subitem.cable_label}}</td>
								<td>
								<div class="text-hidden w150" title="{{subitem.mac}}">{{subitem.mac}}</div></td>
								<td>{{subitem.ip}}</td>
								<td>{{subitem.cpu}}</td>
								<td>{{subitem.hd}}</td>
								<td>{{subitem.memory}}</td>
								<td>
								<div class="text-hidden w120" title="{{subitem.op_sys}}">{{subitem.op_sys}}</div></td>
								<td>
								<div class="text-hidden w200" title="{{subitem.bz_name}}">{{subitem.bz_name}}</div></td>
								<td>{{subitem.in_using}}</td>
								<td>
								<div class="text-hidden w120" title="{{subitem.config}}">{{subitem.config}}</div></td>
								<td>
								<div class="text-hidden w80">{{subitem.pc_type}}</div></td>
								<td>{{subitem.pc_code}}</td>
								<td>
								<div class="text-hidden w200" title="{{subitem.remark}}">{{subitem.remark}}</div></td>
								<td>{{subitem.user_pw}}</td>
							</tr>
							%for ssitem in subitemw.sub_servers:
								<tr data-id="{{item.ind}}-{{subitem.ind}}-{{ssitem.ind}}" data-pid="{{item.ind}}-{{subitem.ind}}" class="hide">
									<td><a href="/server/{{ssitem.ind}}"><span class="glyphicon glyphicon-cog mr10 " title="详情"></span></a></td>
									<td></td>
									<td></td>
									<td>{{ssitem.e_time}}</td>
									<td>{{ssitem.s_time}}</td>
									<td>{{ssitem.m_r}}</td>
									<td>{{ssitem.cabinet}}</td>
									<td>{{ssitem.location}}</td>
									<td>{{ssitem.idrac}}</td>
									<td>{{ssitem.cable_label}}</td>
									<td>
									<div class="text-hidden w150" title="{{ssitem.mac}}">{{ssitem.mac}}</div></td>
									<td>{{ssitem.ip}}</td>
									<td>{{ssitem.cpu}}</td>
									<td>{{ssitem.hd}}</td>
									<td>{{ssitem.memory}}</td>
									<td>
									<div class="text-hidden w120" title="{{ssitem.op_sys}}">{{ssitem.op_sys}}</div></td>
									<td>
									<div class="text-hidden w200" title="{{ssitem.bz_name}}">{{ssitem.bz_name}}</div></td>
									<td>{{ssitem.in_using}}</td>
									<td>
									<div class="text-hidden w120" title="{{ssitem.config}}">{{ssitem.config}}</div></td>
									<td>
									<div class="text-hidden w80">{{ssitem.pc_type}}</div></td>
									<td>{{ssitem.pc_code}}</td>
									<td>
									<div class="text-hidden w200" title="{{ssitem.remark}}">{{ssitem.remark}}</div></td>
									<td>{{ssitem.user_pw}}</td>
								</tr>
							%end
						%end
					%end
					</tbody>
				</table>
			</div>
		</div>
		<script src="/include/js/lib/jquery/jquery.min-1.12.4.js"></script>
		<script src="/include/js/lib/bootstrap/bootstrap.min.js"></script>
		<script src="/include/js/pages/deviceManage.js"></script>
	</body>
</html>
