<%@ page import="cn.tedu.shopping.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.tedu.shopping.entity.Address" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: 15472
  Date: 2023/4/26
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 阿甲学子商城</title>
    <link href="<%=path%>/css/myOrder.css" rel="Stylesheet"/>
    <link href="<%=path%>/css/header.css" rel="Stylesheet"/>
    <link href="<%=path%>/css/footer.css" rel="Stylesheet"/>
    <link href="<%=path%>/css/personage.css" rel="stylesheet" />
</head>
<body>
<!-- 页面顶部-->
<header id="top">
    <div id="logo" class="lf">
        <img class="animated jello" src="<%=path%>/images/header/logo.png" alt="logo"/>
    </div>
    <div id="top_input" class="lf">
        <input id="input" type="text" placeholder="请输入您要搜索的内容"/>
        <div class="seek" tabindex="-1">
            <div class="actived" ><span>分类搜索</span> <img src="<%=path%>/images/header/header_normal.png" alt=""/></div>
            <div class="seek_content" >
                <div id="shcy" >生活餐饮</div>
                <div id="xxyp" >学习用品</div>
                <div id="srdz" >私人订制</div>
            </div>
        </div>
        <a href="" class="rt"><img id="search" src="<%=path%>/images/header/search.png" alt="搜索"/></a>
    </div>
    <div class="rt">
        <ul class="lf">
            <li><a href="myCollect.html" title="我的收藏"><img class="care" src="<%=path%>/images/header/care.png" alt=""/></a><b>|</b></li>
            <li><a href="myOrder.html" title="我的订单"><img class="order" src="<%=path%>/images/header/order.png" alt=""/></a><b>|</b></li>
            <li><a href="cart.html" title="我的购物车"><img class="shopcar" src="<%=path%>/images/header/shop_car.png" alt=""/></a><b>|</b></li>
            <li><a href="lookforward.html">帮助</a><b>|</b></li>
            <li><a href="login.html">登录</a></li>
        </ul>
    </div>
</header>
<!-- 主导航-->
<nav id="nav">
    <ul>
        <li><a href="index.html">首页</a></li>
        <li><a href="item_food.html">生活餐饮</a></li>
        <li><a href="itemCat.html">学习用品</a></li>
        <li><a href="lookforward.html">私人定制</a></li>
    </ul>
</nav>
<!-- 我的订单导航栏-->
<div id="nav_order">
    <ul>
        <li><a href="">首页<span>&gt;</span>个人中心</a></li>
    </ul>
</div>
<!--我的订单内容区域 #container-->
<div id="container" class="clearfix">
    <!-- 左边栏-->
    <div id="leftsidebar_box" class="lf">
        <div class="line"></div>
        <dl class="my_order">
            <dt onClick="changeImage()">我的订单
                <img src="<%=path%>/images/myOrder/myOrder2.png">
            </dt>
            <dd class="first_dd"><a href="myOrder.html">全部订单</a></dd>
            <dd>
                <a href="#">
                    待付款
                    <span><!--待付款数量--></span>
                </a>
            </dd>
            <dd>
                <a href="#">
                    待收货
                    <span><!--待收货数量-->1</span>
                </a>
            </dd>
            <dd>
                <a href="#">
                    待评价<span><!--待评价数量--></span>
                </a>
            </dd>
            <dd>
                <a href="#">退货退款</a>
            </dd>
        </dl>

        <dl class="footMark">
            <dt onClick="changeImage()">我的优惠卷<img src="<%=path%>/images/myOrder/myOrder1.png"></dt>
        </dl>
        <dl class="address">
            <dt>收货地址<img src="<%=path%>/images/myOrder/myOrder1.png"></dt>
            <dd><a href="addressAdmin.html">地址管理</a></dd>
        </dl>
        <dl class="count_managment">
            <dt onClick="changeImage()">帐号管理<img src="<%=path%>/images/myOrder/myOrder1.png"></dt>
            <dd class="first_dd"><a href="personage.jsp">我的信息</a></dd>
            <dd><a href="personal_icon.html">个人头像</a></dd>
            <dd><a href="personal_password.jsp">安全管理</a></dd>
        </dl>
    </div>
    <!-- 右边栏-->
    <div class="rightsidebar_box rt">
        <!--标题栏-->
        <div class="rs_header">
            <span class="address_title">收获地址管理</span>
        </div>
        <!--收货人信息填写栏-->
        <div class="rs_content">
            <form method="post" action="/shopping/address.do" accept-charset="UTF-8">
                <!--收货人姓名-->
                <input type="hidden" name="uid" value="<%=user.getUserName()%>">
                <div class="recipients">
                    <span class="red">*</span><span class="kuan">收货人：</span><input type="text" name="username" id="receiverName"/>
                </div>
                <!--收货人所在城市等信息-->
                <div data-toggle="distpicker" class="address_content">
                    <span class="red">*</span><span class="kuan">省&nbsp;&nbsp;份：</span><select data-province="---- 选择省 ----" id="receiverState"></select>
                    城市：<select data-city="---- 选择市 ----" id="receiverCity"></select>
                    区/县：<select data-district="---- 选择区 ----" id="receiverDistrict"></select>
                </div>


                <!--收货人详细地址-->
                <div class="address_particular">
                    <span class="red">*</span><span class="kuan">详细地址：</span><textarea name="address" id="receiverAddress" cols="60" rows="3" placeholder="建议您如实填写详细收货地址"></textarea>
                </div>
                <!--收货人地址-->
                <div class="address_tel">
                    <span class="red">*</span><span class="kuan">手机号码：</span><input type="text" name="phone" id="receiverPhone"/>固定电话：<input type="text" name="tel"/>
                </div>
                <!--邮政编码-->
                <div class="address_postcode">
                    <span class="red">&nbsp;</span class="kuan"><span>邮政编码：</span>&nbsp;<input type="text" name="receiverZip"/>
                </div>
                <!--地址名称-->
                <div class="address_name">
                    <span class="red">&nbsp;</span class="kuan"><span>地址名称：</span>&nbsp;<input type="text" id="addressName" name="addressName"/>如：<span class="sp">家</span><span class="sp">公司</span><span class="sp">宿舍</span>
                </div>
                <!--保存收货人信息-->
                <div>
                    <input class="save_recipient" type="submit" value="保存收货人信息">
                </div>

            </form>
            <!--已有地址栏-->
            <div class="address_information_manage">
                <div class="aim_title">
                    <span class="dzmc dzmc_title">地址名称</span><span class="dzxm dzxm_title">姓名</span><span class="dzxq dzxq_title">地址详情</span><span class="lxdh lxdh_title">联系电话</span><span class="operation operation_title">操作</span>
                </div>
                <%
                    List<Address> list = (List<Address>) session.getAttribute("list");
                    if (list == null) {
                        list = Collections.emptyList();  // 默认为空列表
                    }
                    for(Address address : list){
                %>
                <div class="aim_content_two">
                    <span class="dzmc dzmc_normal">家里</span>
                    <span class="dzxm dzxm_normal"><input type="text" name="username" value="<%=address.getusername()%>"></span>
                    <span class="dzxq dzxq_normal"><input type="text" name="address" value="<%=address.getaddress()%>"></span>
                    <span class="lxdh lxdh_normal"><input type="text" name="phone" value="<%=address.getPhone()%>"></span>
                    <span class="operation operation_normal">
                    	<span class="aco_change"><a href="/shopping/updateAddress.do?usernaem=<%=address.getusername()%>&address=<%=address.getaddress()%>&phone=<%=address.getPhone()%>">修改</a></span>|<span class="aco_delete"><a href="/shopping/deleteAddress.do?id=<%=address.getId()%>&uid=<%=address.getUid()%>">删除</a> </span>
                    </span>>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<!-- 品质保障，私人定制等-->
<div id="foot_box">
    <div class="icon1 lf">
        <img src="<%=path%>/images/footer/icon1.png" alt=""/>

        <h3>品质保障</h3>
    </div>
    <div class="icon2 lf">
        <img src="<%=path%>/images/footer/icon2.png" alt=""/>

        <h3>私人定制</h3>
    </div>
    <div class="icon3 lf">
        <img src="<%=path%>/images/footer/icon3.png" alt=""/>

        <h3>学员特供</h3>
    </div>
    <div class="icon4 lf">
        <img src="<%=path%>/images/footer/icon4.png" alt=""/>

        <h3>专属特权</h3>
    </div>
</div>
<!-- 页面底部-->
<div class="foot_bj">
    <div id="foot">
        <div class="lf">
            <p class="footer1"><img src="<%=path%>/images/footer/logo.png" alt="" class=" footLogo"/></p>
            <p class="footer2"><img src="<%=path%>/images/footer/footerFont.png"alt=""/></p>
        </div>
        <div class="foot_left lf" >
            <ul>
                <li><a href="#"><h3>买家帮助</h3></a></li>
                <li><a href="#">新手指南</a></li>
                <li><a href="#">服务保障</a></li>
                <li><a href="#">常见问题</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>商家帮助</h3></a></li>
                <li><a href="#">商家入驻</a></li>
                <li><a href="#">商家后台</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>关于我们</h3></a></li>
                <li><a href="#">关于阿甲</a></li>
                <li><a href="#">联系我们</a></li>
                <li>
                    <img src="<%=path%>/images/footer/wechat.png" alt=""/>
                    <img src="<%=path%>/images/footer/sinablog.png" alt=""/>
                </li>
            </ul>
        </div>
        <div class="service">
            <p>阿甲商城客户端</p>
            <img src="<%=path%>/images/footer/ios.png" class="lf">
            <img src="<%=path%>/images/footer/android.png" alt="" class="lf"/>
        </div>
        <div class="download">
            <img src="<%=path%>/images/footer/erweima.png">
        </div>
        <!-- 页面底部-备案号 #footer -->
        <div class="record">
            &copy;2017 阿甲集团有限公司 版权所有 京ICP证xxxxxxxxxxx
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/js/jquery-3.1.1.min.js"></script>
<script src="<%=path%>/js/jquery.page.js"></script>
<script type="text/javascript" src="<%=path%>/js/order.js"></script>
<script type="text/javascript" src="<%=path%>/js/distpicker.data.js"></script>
<script type="text/javascript" src="<%=path%>/js/distpicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/personal.js"></script>
<script type="text/javascript">
    $(".lxdh_normal").each(function(i,e) {
        var phone = $(e).html();
        $(e).html(changePhone(phone));
    });
</script>
</html>
