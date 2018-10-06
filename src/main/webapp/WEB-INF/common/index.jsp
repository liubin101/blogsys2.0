<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<%@ taglib uri="/WEB-INF/myTag.dtd" prefix="fl"%>--%>
<html>
<head>

    <meta charset="utf-8">
    <title>博客首页</title>
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
    <link href="/css/common.css" rel="stylesheet" type="text/css">
    <link href="/css/index.css" rel="stylesheet" type="text/css">
    <link href="/css/style.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        $(function(){
            if("${sessionScope.users.id}"==""){
                $(".userhead").css("display","none");
                $(".headnavi").css("display","inline-block");
                $(".logined").css("display","none");
                $(".nologin").css("display","block");
            }else{
                $(".userhead").css("display","inline-block");
                $(".headnavi").css("display","none");
                $(".logined").css("display","block");
                $(".nologin").css("display","none");
            };
            $(".icon-search").click(function () {
                var title=$(".searchtext").val();
                if(title==""){
                    alert("搜索条件不能为空");
                    return false;
                };
                window.location.href="/searchArticle/"+title+"/1";
            });
            $(".btn_login").click(function () {
                if($(".username").val()==""){
                    alert("用户名不能为空");
                    return false;
                };
                if($(".userpw").val()==""){
                    alert("密码不能为空");
                    return false;
                };
                $(".logForm").submit();
            });
            $(".enterAdmin").click(function (e) {
                if("${sessionScope.users.power}"!=9){
                    e.preventDefault();
                    alert("对不起，您没有权限");
                }
            });
            $(".a_changePage").click(function (e) {
                e.preventDefault();
                var url=this.href;
                $(".articles").remove();
                $(".art_container").load(url+" .articles");
            })
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
        <a href="/classes/0/1"><li>娱乐</li></a>
        <a href="/classes/1/1"><li>文史</li></a>
        <a href="/classes/2/1"><li>教育</li></a>
        <a href="/classes/3/1"><li>体育</li></a>
        <a href="/classes/4/1"><li>美食</li></a>
        <a href="/classes/5/1"><li>旅游</li></a>
        <a href="/classes/6/1"><li>新闻</li></a>
        <a href="/classes/7/1"><li>其他</li></a>
    </ul>
    <div class="search">
        <input class="searchtext" type="text" name="" placeholder="输入搜索文章">
        <span class="icon-search"></span>
    </div>
</div>
<div class="midbody">
    <div class="rollpic">
        <a href=""><img src="/img/indexroll.jpg" width="600px" height="400px"></a>
    </div>
    <div class="nologin">
        <p>欢迎登录</p>
        <form class="logForm" action="/user/userLogin" method="post">
            <input type="text" name="username" class="username" placeholder="用户名">
            <input type="password" name="userpw" class="userpw" placeholder="密码">
            <button class="btn_login">登录</button><br>
        </form>
        <a href="/go/userReg">立即注册</a>
    </div>
    <div class="logined">

        <div class="logined_userinfo">
            <img src="/img/headphoto/${sessionScope.users.headphoto}" width="100px" height="100px">
            <span class="font1">${sessionScope.users.nickname}</span>
            <a href="/user/outLogin" class="font3">退出</a>
        </div>
        <ul>
            <li>文章<span class="font2">${sessionScope.users.articlenum}</span></li>
            <li>关注<span class="font2">${sessionScope.users.focusnum}</span></li>
            <li>粉丝<span class="font2">${sessionScope.users.fansnum}</span></li>
        </ul>
        <div class="logined_button">
            <a href="/user/writeArticle/${sessionScope.users.id}">写文章</a>
            <a href="/user/go/personalPage/${sessionScope.users.id}/1">个人中心</a>
        </div>

    </div>
    <div class="art_container">
    <div class="articles">
        <div class="class">
            <span class="font1">全部文章</span>
        </div>
        <c:forEach items="${pageBean.list}" var="article">
            <div class="article">
                <div class="author">
                    <a href="/user/go/personalPage/${article.userid}/1"><img src="/img/headphoto/${article.headphoto}" width="100px" height="100px"></a>
                    <a href="/user/go/personalPage/${article.userid}/1">${article.nickname}</a>
                </div>
                <div class="articleinfo">
                    <a href="/article/articleDetail/${article.id}/1"><span class="art_title">${article.title}</span></a>
                    <%--<p class="artinfo_p">${article.acontent}"></p>--%>
                    <div class="articlefoot">
                        <span class="icon-price-tag"></span> ${article.artclass}
                        <span class="icon-clock"></span> <fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd HH:mm:ss" />
                        <span class="icon-eye"></span> 浏览(${article.looknum})
                        <span class="icon-bubble2"></span> 评论(${article.commentsnum})
                        <span class="icon-heart"></span> 喜欢(${article.likenum})
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="pagenum">
            共 ${pageBean.total} 篇
            <c:if test="${pageBean.pageNow!=1}">
                <a href="/${pageBean.pageNow-1}" class="a_changePage">上一页</a>
            </c:if>
            <c:forEach varStatus="i" begin="1" end="${pageBean.pages}">
                <c:choose>
                    <c:when test="${pageBean.pageNow==i.count}">
                        ${pageBean.pageNow}
                    </c:when>
                    <c:otherwise>
                        <a href="/${i.count}" class="a_changePage">${i.count}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${pageBean.pageNow!=pageBean.pages&&pageBean.pages!=0}">
                <a href="/${pageBean.pageNow+1}" class="a_changePage">下一页</a>
            </c:if>
        </div>

    </div>
    </div>
    <div class="rank">
        <h1>文章热度排行</h1>
        <ul>
            <c:forEach items="${rankArts}" var="rankArts" varStatus="i" begin="0" end="9">
                <li><i>${i.count}</i><a href="/article/articleDetail/${rankArts.id}/1">${rankArts.title}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="bottom">
    <ul>
        <li><a href="https://liubin101.github.io/aboutme/aboutme.html" target="_blank">关于我</a>　｜　</li>
        <li><a href="https://liubin101.github.io/aboutme/aboutme.html" target="_blank">意见反馈</a>　｜　</li>
        <li><a href="https://liubin101.github.io/aboutme/aboutme.html" target="_blank">联系我</a>　｜　</li>
        <li><a href="/admin/showCheckArticles/1" class="enterAdmin">管理员入口</a></li>
    </ul>
</div>
</body>
</html>
