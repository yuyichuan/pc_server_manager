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
			<form class="form-inline mtb10">
				<a href="/newserver/0" class="btn btn-primary">新增</a>
			</form>
			<div class="">
				<table id="deviceTable" class="table table-condensed table-bordered table-striped table-hover">
					<thead >
						<tr>
							<th class="w60">操作</th>
							<th class="w20"></th>
							<th class="w20"></th>
							<th class="w120">IP地址</th>
							<th class="w40">cpu核</th>
							<th class="w40">硬盘</th>
							<th class="w40">内存</th>
							<th class="w120">操作系统</th>
							<th class="w80">业务</th>
							<th class="w300">配置说明</th>
							<th class="w200">备注</th>
							<th class="w40">机柜</th>
							<th class="w80">位置</th>
							<th class="w40">机房</th>
							<th class="w150">mac</th>
							<th class="w100">质保</th>
							<th class="w100">型号</th>
							<th class="w80">服务编码</th>
							<th class="w80">iDRAC</th>
							<th class="w80">网线标签</th>
						</tr>
					</thead>
					<tbody >
					%for itemw in viewmodel['servers']:
					%	item=itemw.server
						<tr data-id="{{item.ind}}">
							<td><a href="/server/{{item.ind}}"><span class="glyphicon glyphicon-cog mr10 " title="详情"></span></a>
								% if viewmodel['user'] > 0:
								<a href="/newserver/{{item.ind}}"><span class="glyphicon glyphicon-plus" title="新增子类"></span></a>
								% end
							</td>

							<td>
							% if len(itemw.sub_servers) > 0:
							<a class="expandBtn expand" href="javascript:;" title="展开"><span class="glyphicon glyphicon-triangle-top"></span></a>
							% end
							</td>
							<td></td>
							<td class="text-hidden w120" title="{{item.ip}}"
							    % if item.in_using == 0:
							 style="background-color:#00FF00"
							    % end
							 >{{item.ip}}</td>
							<td>{{item.cpu}}</td>
							<td>{{item.hd}}</td>
							<td>{{item.memory}}</td>
							<td>
							<div class="text-hidden w120" title="{{item.op_sys}}">{{item.op_sys}}</div></td>
							<td>
							<div class="text-hidden w80" title="{{item.bz_name}}">{{item.bz_name}}</div></td>
							<td>
							<div class="text-hidden w300" title="{{item.config}}">{{item.config}}</div></td>
							<td>
							<div class="text-hidden w200" title="{{item.remark}}">{{item.remark}}</div></td>
							<td>{{item.cabinet}}</td>
							<td class="text-hidden w80" title="{{item.location}}">{{item.location}}</td>
							<td>{{item.m_r}}</td>
							<td>
							<div class="text-hidden w150" title="{{item.mac}}">{{item.mac}}</div></td>
							<td>{{item.e_time}}</td>
							<td>
							<div class="text-hidden w100">{{item.pc_type}}</div></td>
							<td>{{item.pc_code}}</td>
							<td>{{item.idrac}}</td>
							<td>{{item.cable_label}}</td>
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
								<td>
								% if len(str(subitemw.sub_servers)) > 2:
								<a class="expandBtn expand" href="javascript:;" title="展开"><span class="glyphicon glyphicon-triangle-top"></span></a>
								% end
								</td>
                                <td
                                % if subitem.in_using == 0:
							 style="background-color:#00FF00"
							    % end
							    >{{subitem.ip}}</td>
                                <td>{{subitem.cpu}}</td>
                                <td>{{subitem.hd}}</td>
                                <td>{{subitem.memory}}</td>
                                <td>
                                <div class="text-hidden w120" title="{{subitem.op_sys}}">{{subitem.op_sys}}</div></td>
                                <td>
                                <div class="text-hidden w80" title="{{subitem.bz_name}}">{{subitem.bz_name}}</div></td>
                                <td></td>
                                <td>
                                <div class="text-hidden w200" title="{{subitem.remark}}">{{subitem.remark}}</div></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
							</tr>
							%for ssitem in subitemw.sub_servers:
								<tr data-id="{{item.ind}}-{{subitem.ind}}-{{ssitem.ind}}" data-pid="{{item.ind}}-{{subitem.ind}}" class="hide">
									<td><a href="/server/{{ssitem.ind}}"><span class="glyphicon glyphicon-cog mr10 " title="详情"></span></a></td>
									<td></td>
									<td></td>
									<td></td>
                                    <td>{{ssitem.cpu}}</td>
                                    <td>{{ssitem.hd}}</td>
                                    <td>{{ssitem.memory}}</td>
                                    <td></td>
                                    <td>
                                    <div class="text-hidden w80" title="{{ssitem.bz_name}}">{{ssitem.bz_name}}</div></td>
                                    <td></td>
                                    <td>
                                    <div class="text-hidden w200" title="{{ssitem.remark}}">{{ssitem.remark}}</div></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
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
