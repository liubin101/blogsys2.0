<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
         isELIgnored="false" %>
<meta charset="utf-8">
<script type="text/javascript">
    $(function(){
        if("${sessionScope.users.id}"=="${user.id}"){
            $(".btn_focus").css("display","none");
        }
        $(".btn_focus").click(function() {
            if($(this).html()=="关注"){
                $(this).css("background","#cacaca");
                $(this).html("取消关注");
            }else{
                $(this).css("background","#e88c5d");
                $(this).html("关注");
            }
        });
    })
</script>
<div class="headimg">
    <div class="mypic">
        <img src="/img/headphoto/${user.headphoto}" width="220px" height="220px">
    </div>
    <div class="nickname">
        ${user.nickname} <div class="btn_focus">关注</div>
    </div>
    <div class="myword">${user.signature}
    </div>
    <div class="picsource">
        <a href="https://www.pexels.com" target="_blank">背景图片来源：Pexels</a>
    </div>
</div>

