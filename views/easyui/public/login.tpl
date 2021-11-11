{{template "../public/header.tpl"}}
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
                </div>
            </fieldset>
            <button type="submit">提交</button>
            <button type="reset">取消</button>
        </form>
    </div>
</div>
</body>
</html>