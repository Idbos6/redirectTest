<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bathPath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <base href="<%=bathPath%>"/>
    <meta charset="UTF-8"/>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <title>登录页</title>

    <script type="text/javascript">

        $(function () {

            //页面加载完毕后，将用户文本框中的内容清空
            $("#userName").val("");
            $("#passWord").val("");

            //页面加载完毕后，让用户的文本框自动获得焦点
            $("#userName").focus();

            //为登录按钮绑定事件，执行登录操作
            $("#submitBtn").click(function () {

                login();

            })

            //为当前登录也窗口绑定敲键盘事件
            //event:这个参数可以取得我们敲的是哪个键
            $(window).keydown(function (event) {

                //如果取得的键位的码值为13，表示敲的是回车键
                if (event.keyCode == 13) {

                    login();

                }

            })

            $("#resetBtn").click(function () {


                $("#userName").val("");
                $("#passWord").val("");
                $("#userName").focus();

            })


        })

        function login() {

            var userName = $.trim($("#userName").val());
            var passWord = $.trim($("#passWord").val());

            if(userName=="" || passWord==""){

                $("#msg").html("账号密码不能为空");

                //如果账号密码为空，则需要及时强制终止该方法
                return false;


            }

            //去后台验证登录相关操作
            $.ajax({
                url : "user/login.do",
                data : {

                    "userName" : userName,
                    "passWord" : passWord

                },
                type : "post",
                dataType : "json",
                success : function (data) {
                    /*

                        data
                            {"success":true/false,"msg":"哪错了"}

                     */
                    //如果登录成功
                    if(data.success){

                        //跳转到工作台的初始也（欢迎页）
                        window.location.href = "index.jsp";

                        //如果登录失败
                    }else{


                        $("#msg").html(data.msg);


                    }

                }
            })

        }

    </script>

</head>

<body>

    <div style="position: absolute; top: 0px; left: 0px; width: 100%;">
        <img src="image/bg1.jpg" style="width: 100%; height: 100%;">
    </div>

    <div class="col-lg-4 col-lg-offset-4  col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2 container col-center-block">
        <div style="position: absolute; top: 0px; right: 70px;">
            <div class="page-header">
                <h2 style="color: #43a5fd">登录</h2>
            </div>
            <form action="workbench/index.jsp" class="form-horizontal" role="form">
                <div class="form-group form-group-lg">
                    <div style="width: 350px;">
                        <input class="form-control" type="text" placeholder="用户名" id="userName">
                    </div>
                    <div style="width: 350px; position: relative;top: 20px;">
                        <input class="form-control" type="password" placeholder="密码" id="passWord">
                    </div>
                    <div class="checkbox"  style="position: relative;top: 30px; left: 10px;">

                        <span id="msg" style="color: red"></span>

                    </div>

                    <button type="button" id="submitBtn" class="btn btn-info"  style="width: 150px; position: relative;top: 45px;">登录</button>
                    <button type="button" id="resetBtn" class="btn btn-danger"  style="width: 150px; position: relative;top: 45px;left: 45px
">重置</button>
                </div>
            </form>
        </div>
    </div>


</body>
</html>
