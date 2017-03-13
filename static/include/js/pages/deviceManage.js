/**
 *设备管理
 * @author wangyang
 * @since 2017-02-27
 */
$(function() {
	//删除后刷新的url
	var refreshUrl=$('#dispatcher').attr('refreshUrl');
	//删除的url
	var delUrl=$('#dispatcher').attr('delUrl');
	var Main = {
		//构建表格相关
		initEvent : function() {
			//点击展开按钮
			$(document).delegate('.expandBtn', 'click', function() {
				var me = $(this), dataId = '', $tr, expand = false;
				$tr = me.parents('tr'), dataId = $tr.attr('data-id'), expand = me.hasClass('expand');
				if (!dataId) {
					return false;
				}
				if (expand) {//展开显示子集
					$('tr[data-pid=' + dataId + ']').removeClass('hide');
					me.find('.glyphicon').attr('class', 'glyphicon glyphicon-triangle-bottom');
					me.removeClass('expand');
					me.attr('title', '收起');
				} else {
					//隐藏子集
					$('tr[data-pid=' + dataId + ']').addClass('hide');
					me.find('.glyphicon').attr('class', 'glyphicon glyphicon-triangle-top');
					me.addClass('expand');
					me.attr('title', '收起');
				}
			});
			//删除
			$(document).delegate('.delItem', 'click', function() {
				var me=$(this),dataId='',$tr;
				$tr=me.parents('tr'),dataId=$tr.attr('data-id');
				$.ajax({
					type : 'post',
					data:{
						dataId:dataId,
						r : Math.random()
					},
					url : delUrl,
					success : function(re, textStatus, xhr) {
						if (re.status == 0) {
							window.location.href=refreshUrl;
						} else {
							alert('操作失败');
						}
					},
					error : function(xhr, status, handler) {
						alert('操作失败');
					}
					
				});
			});
			//编辑页面 取消按钮
			$(document).delegate('.cancelBtn', 'click', function() {
				var me = $(this), returl = '';
				returl = me.attr('returl');
				window.location.href = returl;
			});
		},
		initPage : function() {
			Main.initEvent();
		}
	};
	Main.initPage();
});
