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
				% end
			</div>
		</nav>
		<input type="hidden" id="dispatcher" name="dispatcher" value="deviceManage" />
		<div class="main-container">
			<div class="">
                % server=viewmodel['server']
				<form class="form-horizontal" id="deviceForm" name="deviceForm" action="/save" method="post">
                    <input type="hidden" name="ind" value="{{server.ind}}"/>
					<input type="hidden" name="ind_prent" value="{{server.ind_prent}}"/>
					<input type="hidden" name="i_level" value="{{server.i_level}}"/>
					<div class="form-group">
						<label class="col-sm-2 control-label">ID</label>
						<div class="col-sm-4">{{server.ind}}</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">质保</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="e_time" value="{{server.e_time}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">使用投入</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="s_time" value="{{server.s_time}}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">机房名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="m_r" value="{{server.m_r}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">机柜</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="cabinet" value="{{server.cabinet}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">位置</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="location" value="{{server.location}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">iDRAC</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="idrac" value="{{server.idrac}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">网线标签</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="cable_label" value="{{server.cable_label}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">mac</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="mac" value="{{server.mac}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">ip地址</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="ip" value="{{server.ip}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">cpu核</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="cpu" value="{{server.cpu}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">硬盘(GB)</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="hd" value="{{server.hd}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">内存(GB)</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="memory" value="{{server.memory}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">操作系统</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="op_sys" value="{{server.op_sys}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">业务</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" name="bz_name" value="{{server.bz_name}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">使用状态</label>
						<div class="col-sm-4">
							<label class="radio-inline">
								<input type="radio" name="in_using" value="1"
                                % if server.in_using == 1:
                                checked="checked"
                                %end
                                >忙碌</label>
							<label class="radio-inline">
								<input type="radio" name="in_using" value="0"
                                % if server.in_using == 0:
                                checked="checked"
                                %end
                            >空闲</label>
                            <label class="radio-inline">
								<input type="radio" name="in_using" value="2"
                                % if server.in_using == 2:
                                checked="checked"
                                %end
                            >半闲</label>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">配置说明</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" name="config" value="{{server.config}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">型号</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="pc_type" value="{{server.pc_type}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">服务编码</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="pc_code" value="{{server.pc_code}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-6">
							<input type="text" class="form-control input-sm" name="remark" value="{{server.remark}}">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">用户名/密码</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="user_pw" value="{{server.user_pw}}">
						</div>
					</div>
                    <div class="form-group">
						<label for="" class="col-sm-2 control-label">监控地址</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" name="monitor_url" value="{{server.monitor_url}}">
						</div>
					</div>
					<div class="form-group">
						<div  class="col-sm-offset-2 col-sm-10" style="color:red">{{viewmodel['msg']}}</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary mr10" id="saveBtn">
								保存
							</button>
							<button type="button" class="btn btn-default cancelBtn" returl="/index">
								取消
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script src="/include/js/lib/jquery/jquery.min-1.12.4.js"></script>
		<script src="/include/js/lib/bootstrap/bootstrap.min.js"></script>
		<script src="/include/js/pages/deviceManage.js"></script>
	</body>
</html>
