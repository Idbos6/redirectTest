<%@ page import="com.node.utils.DateTimeUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bathPath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=bathPath%>"/>
    <meta charset="UTF-8"/>
    <link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <title>我的空间</title>

    <script type="text/javascript">

        $(function () {
            $("#BtnQuit").click(function () {

                $.ajax({

                    url:"user/quit.do",
                    success:function () {

                        alert("即将跳转到登录页面");
                        window.location.href = "login.jsp";

                    }
                })


            })
            $("#BtnSearch").click(function () {

                $.ajax({

                    url:"user/query.do",
                    data:{
                        "specialty":"${user.specialty}"
                    },
                    type:"get",
                    dataType:"json",
                    success:function (data) {

                        var a = "";

                        if (data[0] == null) {

                            a = "没有选修任何一门课程";

                        } else {

                            $.each(data,function (i,n) {

                                a = a + n.cla + "&#10";

                            })

                        }



                        $("#classes").html(a);




                    }




                })

            })

        })

    </script>
</head>
<body>

    <p>欢迎您来到我的空间!</p>
    <p>当前用户名:${user.userName}</p>
    <p>密码:${user.passWord}</p>
    <p id="currentTime">当前系统时间:<%=DateTimeUtil.getSysTime()%></p>
    <br>
    <textarea rows="5" cols="20" name="message" id="classes"></textarea>
    <button class="btn-default" id="BtnSearch">查询</button>
    <br/><br />
    <button class="btn-default" id="BtnQuit">退出</button>
</body>
</html>
