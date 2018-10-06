<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员界面</title>
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
    <link href="/css/common.css" rel="stylesheet" type="text/css">
    <link href="/css/index.css" rel="stylesheet" type="text/css">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <link href="/css/adminPage.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        if("${sessionScope.users.id}"==""){
            $(".userhead").css("display","none");
            $(".headnavi").css("display","inline-block");
        }else{
            $(".userhead").css("display","inline-block");
            $(".headnavi").css("display","none");
        };
        $(".navi a").click(function(event) {
            $(".navi .current").removeClass('current');
            $(this).addClass('current');
        });
    </script>
</head>
<body>
<div class="headimg">
    <div class="head">
        <div class="headicon">
            <a href="/"><img src="/img/lb.png"></a>
            <a href="/"><span>刘斌博客</span></a>
        </div>
        <div class="userhead">
            <div class="userphoto">
                <img src="/img/headphoto/${sessionScope.users.headphoto}">
            </div>
            <div class="usernavi">
                <ul>
                    <a href="/user/go/personalPage/${sessionScope.users.id}/1"><li>个人中心</li></a>
                    <a href="/user/go/personalPage/${sessionScope.users.id}/1"><li>我的文章</li></a>
                    <a href="/user/outLogin"><li>退出登录</li></a>
                </ul>
            </div>
        </div>
        <div class="headnavi">
            <ul>
                <li><a href="/go/userLogin">登录</a></li>
                <li><a href="/go/userReg">注册</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="navi">
    <ul>
        <a href="" class="current"><li>审核</li></a>
        <a href=""><li>删除</li></a>
    </ul>
</div>
<div class="midbody">

    <div class="articles">
        <div class="class">
            <span class="font1">文章</span>
        </div>
        <c:forEach items="${pageBean.list}" var="article">
            <div class="article">
                <div class="author">
                    <a href="/user/go/personalPage/${article.userid}/1"><img src="/img/headphoto/${article.headphoto}" width="100px" height="100px"></a>
                    <a href="/user/go/personalPage/${article.userid}/1">${article.nickname}</a>
                </div>
                <div class="articleinfo">
                    <a href="/article/articleDetail/${article.id}/1"><span class="art_title">${article.title}</span></a>
                    <a href="/admin/checkArticleNo/${article.id}" onclick="return confirm('确认不通过')"><div class="btn_checkNo">审核不通过</div></a>
                    <a href="/admin/checkArticleOk/${article.id}" onclick="return confirm('确认通过')"><div class="btn_checkOk">审核通过</div></a>
                    <div class="articlefoot">
                        <span class="icon-price-tag"></span> ${article.artclass}
                        <span class="icon-clock"></span> <fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd HH:mm:ss" />
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="pagenum">
            共 ${pageBean.total} 篇
            <c:if test="${pageBean.pageNow!=1}">
                <a href="/admin/showCheckArticles/${pageBean.pageNow-1}">上一页</a>
            </c:if>
            <c:forEach varStatus="i" begin="1" end="${pageBean.pages}">
                <c:choose>
                    <c:when test="${pageBean.pageNow==i.count}">
                        ${pageBean.pageNow}
                    </c:when>
                    <c:otherwise>
                        <a href="/admin/showCheckArticles/${i.count}">${i.count}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${pageBean.pageNow!=pageBean.pages&&pageBean.pages!=0}">
                <a href="/admin/showCheckArticles/${pageBean.pageNow+1}">下一页</a>
            </c:if>
        </div>

    </div>

</div>

<div class="bottom">
    <ul>
        <li><a href="https://liubin101.github.io/aboutme/aboutme.html" target="_blank">关于我</a>　｜　</li>
        <li><a href="https://liubin101.github.io/aboutme/aboutme.html" target="_blank">意见反馈</a>　｜　</li>
        <li><a href="https://liubin101.github.io/aboutme/aboutme.html" target="_blank">联系我</a>　｜　</li>
        <li><a href="">管理员入口</a></li>
    </ul>
</div>
</body>
</html>
