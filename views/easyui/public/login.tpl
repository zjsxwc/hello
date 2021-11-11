<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>hello admin</title>
    <script type="text/javascript" src="/static/jquery/jquery.min.js"></script>
</head>

<script type="text/javascript">
    var URL = "/public"
    $(function () {
        $("#loginForm").submit(function(e) {
            e.preventDefault(); // avoid to execute the actual submit of the form.

            var form = $(this);
            $.ajax({
                type: "POST",
                url: URL + '/login?isajax=1',
                data: form.serialize(), // serializes the form's elements.
                success: function(data)
                {
                    if (data.status) {
                        location.href = URL+"/index"
                    } else {
                        alert(data.info);
                    }
                }
            });
        });
    });
</script>
<body>
<div style="text-align:center;margin:0 auto;width:450px;height:350px;">
    <div style="padding:20px 20px 20px 40px;">
        <form id="loginForm" method="post">
            <fieldset>
                <legend>登录</legend>
                <div style="display: flex;flex-flow: column;">
                    <div style="display: flex;flex-flow: row;">
                        <label for="username" style="flex: 1 1 30%; align-items: center;">用户名：</label>
                        <input id="username" type="text" required name="username"
                               placeholder="请输入用户名"
                               oninvalid="this.setCustomValidity('请输入用户名')"
                               oninput="this.setCustomValidity('')"/>
                    </div>

                    <div style="display: flex;flex-flow: row;">
                        <label for="password" style="flex: 1 1 30%; align-items: center;">密码：</label>
                        <input id="password" name="password" type="password" required minlength="5"
                               placeholder="请输入密码"
                               oninvalid="this.setCustomValidity('请输入5位密码')"
                               oninput="this.setCustomValidity('')"/>
                    </div>
                    <div style="display: flex;flex-flow: row;margin-top: 20px;">
                        <button type="submit" style="flex: 2 1 30%">提交</button>
                        <div style="flex: 2 1"></div>
                        <button type="reset" style="flex: 2 1 30%">取消</button>
                    </div>
                </div>
            </fieldset>

        </form>
    </div>
</div>
</body>
</html>