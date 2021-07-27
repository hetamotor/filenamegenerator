<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>综合管理系统 —— 零件号或产品号对应表</title>
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
</head>
<body>
<!-- 导航 -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td height="10"></td>
    </tr>
    <tr>
        <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
        <td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：规则管理 &gt; 零件清单</td>
        <td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
    </tr>
</table>

<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
    <!-- 数据展示区 -->
    <tr valign="top">
        <td height="20">
            <table id="productlist" width="100%" border="1" cellpadding="5" cellspacing="0"
                   style="border:#c2c6cc 1px solid; border-collapse:collapse;">
                <tr class="main_trbg_tit" align="center">
                    <td width="15%">零件名称</td>
                    <td width="10%">编号</td>
                    <td width="25%">说明</td>
                    <td width="15%">产品名称</td>
                    <td width="10%">编号</td>
                    <td width="25%">说明</td>
                </tr>
                <tr align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                    <td>分流器</td>
                    <td>0001</td>
                    <td>原材料</td>
                    <td>11D.915.743</td>
                    <td>1801</td>
                    <td>成品</td>
                </tr>
                <tr align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                    <td>NTC</td>
                    <td>0002</td>
                    <td>原材料</td>
                    <td>11G.915.743</td>
                    <td>1802</td>
                    <td>成品</td>
                </tr>
                <tr align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                    <td>塑料件</td>
                    <td>0003</td>
                    <td>原材料，包含外壳、PIN Base、外支架、内支架</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                    <td>锡球</td>
                    <td>0004</td>
                    <td>锡球</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                    <td>Tray盘和纸壳</td>
                    <td>0005</td>
                    <td>包装材料</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                    <td>周转箱</td>
                    <td>0006</td>
                    <td>周转箱、周转箱盖等</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                    <td>塑料袋</td>
                    <td>0007</td>
                    <td>包装用塑料袋</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<div style="height:10px;"></div>
</body>
</html>