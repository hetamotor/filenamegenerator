<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>人事管理系统 —— 规则管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>
    <link href="${ctx}/css/css.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
    <link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
    <script src="${ctx}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.jss" type="text/javascript"></script>
    <link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        $(function () {

            /** 获取上一次选中的部门数据 */
            var boxs = $("input[type='checkbox'][id^='box_']");

            /** 给全选按钮绑定点击事件  */
            $("#checkAll").click(function () {
                // this是checkAll  this.checked是true
                // 所有数据行的选中状态与全选的状态一致
                boxs.attr("checked", this.checked);
            })

            /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
            $("tr[id^='data_']").hover(function () {
                $(this).css("backgroundColor", "#eeccff");
            }, function () {
                $(this).css("backgroundColor", "#ffffff");
            })


            /** 删除规则绑定点击事件 */
            $("#delete").click(function () {
                /** 获取到规则选中的复选框  */
                var checkedBoxs = boxs.filter(":checked");
                if (checkedBoxs.length < 1) {
                    $.ligerDialog.error("请选择一个需要删除的规则！");
                } else {
                    /** 得到规则选中的所有的需要删除的ids */
                    var ids = checkedBoxs.map(function () {
                        return this.value;
                    })

                    $.ligerDialog.confirm("确认要删除吗?", "删除规则", function (r) {
                        if (r) {
                            // alert("删除："+ids.get());
                            // 发送请求
                            window.location = "${ctx }/notice/removeNotice?ids=" + ids.get();
                        }
                    });
                }
            })

            /** 给预览绑定点击事件 */
            $("a[id^='prev_'").click(function () {
                var noticeId = this.id.replace('prev_', '');
                $.ligerDialog.open({
                    title: '预览规则',
                    height: 500,
                    url: '${ctx}/notice/previewNotice?id=' + noticeId,
                    width: 750,
                    showMax: true,
                    showToggle: true,
                    showMin: true,
                    isResize: true,
                    slide: false
                });
            })
        })
    </script>
</head>
<body>
<!-- 导航 -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="10"></td>
    </tr>
    <tr>
        <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
        <td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：规则管理 &gt; 规则查询</td>
        <td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
    </tr>
</table>

<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
    <!-- 查询区  -->
    <tr valign="top">
        <td height="30">
            <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
                <tr>
                    <td class="fftd">
                        <form name="noticeform" method="post" id="noticeform" action="${ctx}/notice/selectNotice">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="font3">
                                        模板名称：<input type="text" name="title">&nbsp;&nbsp;
                                        文件命名规则：<input type="text" name="content">&nbsp;&nbsp;
                                        <input type="submit" value="搜索" style="width:80px"/>
                                        <input id="delete" type="button" value="删除" style="width:80px"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <!-- 数据展示区 -->
    <tr valign="top">
        <td height="20">
            <table width="100%" border="1" cellpadding="5" cellspacing="0"
                   style="border:#c2c6cc 1px solid; border-collapse:collapse;">
                <tr class="main_trbg_tit" align="center">
                    <td><input type="checkbox" name="checkAll" id="checkAll"></td>
                    <td>模板名称</td>
                    <td>文件命名规则</td>
                    <td>最近修改时间</td>
                    <td>修改人</td>
                    <td>操作</td>
                    <td>新文档编号</td>
                </tr>
                <c:forEach items="${requestScope.notices}" var="notice" varStatus="stat">
                    <tr id="data_${stat.index}" align="center" class="main_trbg" onMouseOver="move(this);"
                        onMouseOut="out(this);">
                        <td><input type="checkbox" id="box_${stat.index}" value="${notice.id}"></td>
                        <td>${notice.title }</td>
                        <td>${notice.content }</td>
                        <td>
                            <f:formatDate value="${notice.createDate}"
                                          type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>${notice.user.username }</td>
                        <td align="center" width="40px;"><a href="${ctx }/notice/updateNotice?flag=1&id=${notice.id}">
                            <img title="修改" src="${ctx }/images/update.gif"/></a>
                        </td>
                        <td align="center" width="100px;"><a href="${ctx }/document/addDocument?flag=1&id=${notice.id}">
                            <img title="添加" src="${ctx }/images/pointer.gif"/></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    <!-- 分页标签 -->
    <tr valign="top">
        <td align="center" class="font3">
            <fkjava:pager
                    pageIndex="${requestScope.pageModel.pageIndex}"
                    pageSize="${requestScope.pageModel.pageSize}"
                    recordCount="${requestScope.pageModel.recordCount}"
                    style="digg"
                    submitUrl="${ctx}/notice/selectNotice?pageIndex={0}"/>
        </td>
    </tr>
</table>
<div style="height:10px;"></div>
</body>
</html>