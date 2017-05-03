/**
 *设备管理
 * @author wangyang
 * @since 2017-02-27
 */
$(function () {
    //删除后刷新的url
    var refreshUrl = $('#dispatcher').attr('refreshUrl');
    //删除的url
    var delUrl = $('#dispatcher').attr('delUrl');
    var Main = {
        floatThead: function () {
            var Ithis = $(".tableContainer");
            var scrolls = 0;
            var offOn = true;
            var box_top = Ithis.offset().top;
            $(window).scroll(function () {
                scrolls = $(this).scrollTop();
                if (scrolls > 0 && offOn == true) {
                    //debugger;
                    var top_th = $("#deviceTable thead").clone();
                    Ithis.append($('<div style="display:none" id="float_Top"><table class="table-condensed table-bordered table-striped table-hover"></table></div>'));
                    $("#float_Top table").append(top_th);
                    //设置宽度
                    $('#float_Top table').width($('#deviceTable').width());
                    //设置滚动时位置
                    var sl=-Math.max(document.body.scrollLeft,document.documentElement.scrollLeft);
                    $('#float_Top table').scrollLeft=sl+'px';
                    offOn = false;
                    $("#float_Top").fadeIn();
                } else if (scrolls <= box_top && offOn == false) {
                    offOn = true;
                    $("#float_Top").remove();
                }
                if (scrolls > box_top) {
                    $("#float_Top").fadeIn();
                }
            });
        },
    //构建表格相关
    initEvent : function () {
        //点击展开按钮
        $(document).delegate('.expandBtn', 'click', function () {
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
                me.attr('title', '展开');
            }
        });
        //点击展开所有子集
        $(document).delegate('#expandAllBtn', 'click', function () {
            var me = $(this), expand = false;
            expand = me.hasClass('expand');
            if (expand) {//展开显示所有子集
                $('tr[data-pid]').removeClass('hide');
                me.find('.glyphicon').attr('class', 'glyphicon glyphicon-triangle-bottom');
                $('tr[data-id]').find('.expandBtn').find('.glyphicon').attr('class', 'glyphicon glyphicon-triangle-bottom');
                me.removeClass('expand');
                $('tr[data-id]').find('.expandBtn').removeClass('expand');
                ;
                me.attr('title', '收起');
            } else {
                //隐藏子集
                $('tr[data-pid').addClass('hide');
                me.find('.glyphicon').attr('class', 'glyphicon glyphicon-triangle-top');
                $('tr[data-id]').find('.expandBtn ').find('.glyphicon').attr('class', 'glyphicon glyphicon-triangle-top');
                me.addClass('expand');
                $('tr[data-id]').find('.expandBtn').addClass('expand');
                ;
                me.attr('title', '展开');
            }
        });
        //删除
        $(document).delegate('.delItem', 'click', function () {
            var me = $(this), dataId = '', $tr;
            $tr = me.parents('tr'), dataId = $tr.attr('data-id');
            $.ajax({
                type: 'post',
                data: {
                    dataId: dataId,
                    r: Math.random()
                },
                url: delUrl,
                success: function (re, textStatus, xhr) {
                    if (re.status == 0) {
                        window.location.href = refreshUrl;
                    } else {
                        alert('操作失败');
                    }
                },
                error: function (xhr, status, handler) {
                    alert('操作失败');
                }

            });
        });
        //编辑页面 取消按钮
        $(document).delegate('.cancelBtn', 'click', function () {
            var me = $(this), returl = '';
            returl = me.attr('returl');
            window.location.href = returl;
        });
        //固定表头
        Main.floatThead();
        /**
         * 列表字段排序
         * @return {void}
         */
        $('.sortItem').on('mousedown', function(event) {
            var sortName=$(this).attr("data-sortname"),sortType=$(this).attr('sortType');
            $("#listSortName").val(sortName);
            $("#listSortType").val(sortType);
            $('#searchForm').submit();
            return false;
        });
    },
    initPage : function () {
        Main.initEvent();
    }
};
    Main.initPage();
});
