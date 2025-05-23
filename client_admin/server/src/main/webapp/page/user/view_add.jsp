<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 管理员新增/Add -->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../../layui/css/layui.css">
  <link rel="stylesheet" href="../../css/diy.css">
</head>

<body>
  <article class="sign_in">
    <div class="warp user">
      <div class="layui-container">
        <div class="layui-row">
          <form class="layui-form" action="">
            <div class="layui-upload">
              <button type="button" class="layui-btn" id="test1">上传图片</button>
              <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p>
              </div>
              <div style="width: 95px;">
                <div class="layui-progress layui-progress-big" lay-showpercent="yes" lay-filter="demo">
                  <div class="layui-progress-bar" lay-percent=""></div>
                </div>
              </div>
            </div>

            <div class="layui-form-item">
              <label class="layui-form-label">手机号码：</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入手机号码"
                  class="layui-input" id="phone">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">手机认证：</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="phone_state" id="phone_state">
                  <option value="0">未认证</option>
                  <option value="1">审核中</option>
                  <option value="2">已认证</option>
                </select>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">用户名：</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="用户名 / 手机 / 邮箱"
                  class="layui-input" id="username">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">昵称：</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入昵称"
                  class="layui-input" id="nickname">
              </div>
            </div>

            <div class="layui-form-item">
              <label class="layui-form-label">密码框</label>
              <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input"
                  id="password">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">邮箱：</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="用户名 / 手机 / 邮箱"
                  class="layui-input" id="email">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">邮箱认证</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="email_state" id="email_state">
                  <option value="0">未认证</option>
                  <option value="1">审核中</option>
                  <option value="2">已认证</option>
                </select>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">状态</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="state" id="state">
                  <option value="0">可用</option>
                  <option value="1">异常</option>
                  <option value="2">已冻结</option>
                  <option value="3">已注销</option>
                </select>
              </div>
            </div>
          </form>
          <div class="layui-btn-container">
            <button type="button" class="layui-btn layui-btn-normal login" id="submit">确认/Confirm</button>
            <a href="./table.jsp" target="main_self_frame" type="button"
              class="layui-btn layui-btn-normal login">取消/Cancel</a>
          </div>
        </div>
      </div>
    </div>
  </article>
</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script src="../../js/axios.min.js" charset="utf-8"></script>
<script src="../../js/base.js" charset="utf-8"></script>


<script>
  var BaseUrl = baseUrl()
  layui.use(['upload', 'element', 'layer'], function () {
    var $ = layui.jquery
      , upload = layui.upload
      , element = layui.element
      , layer = layui.layer
      , form = layui.form;

    // 拿到本地存储的token
    let token = sessionStorage.token || null
    var from = {
      avatar: "",
      email: "",
      nickname: "",
      phone: "",
      user_group: "管理员",
      user_id: 0,
      phone_state: 0,
      email_state: 0,
      state: 0,
      username: "",
      /*  avatar: "",
       email: "",
       email_state: 0,
       nickname: "love9998",
       password: "5779380e142032619c4c6cb2e98eec37",
       phone: "",
       phone_state: 0,
       state: 1,
       user_group: "管理员",
       user_id: 22,
       username: "love999", */
    }

    var uploadInst = upload.render({
      elem: '#test1'
      , url: BaseUrl + '/api/user/upload'
      , headers: {
        'x-auth-token': token
      } //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
      , before: function (obj) {
        //预读本地文件示例，不支持ie8
        obj.preview(function (index, file, result) {
          $('#demo1').attr('src', fullUrl(BaseUrl,result)); //图片链接（base64）
        });

        element.progress('demo', '0%'); //进度条复位
        layer.msg('上传中', { icon: 16, time: 0 });
      }
      , done: function (res) {
        //如果上传失败
        if (res.code > 0) {
          return layer.msg('上传失败');
        }
        //上传成功的一些操作
        //……
        from.avatar = res.result.url
        $('#demoText').html(''); //置空上传失败的状态
      }
      , error: function () {
        //演示失败状态，并实现重传
        var demoText = $('#demoText');
        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
        demoText.find('.demo-reload').on('click', function () {
          uploadInst.upload();
        });
      }
      //进度条
      , progress: function (n, elem, e) {
        element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
        if (n == 100) {
          layer.msg('上传完毕', { icon: 1 });
        }
      }
    });

    var email_regular = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
    var phone_regular = /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
    let phone = document.querySelector('#phone')
    let email = document.querySelector('#email')
    let password = document.querySelector('#password')
    let username = document.querySelector('#username')
    let nickname = document.querySelector('#nickname')
    phone.addEventListener('blur', function () {
      if (!phone_regular.test(phone.value)) {
        layer.msg('请输入正确的手机号码 例：18955552312!');
      } else {
        from.phone = phone.value
      }
    })

    email.addEventListener('blur', function () {
      if (!phone_regular.test(phone.value)) {
        layer.msg('请输入正确的邮箱地址 例：test@test.com!');
      } else {
        from.email = email.value
      }
    })

    password.addEventListener('blur', function () {
      if (password.value.length > 16 || password.value.length < 5) {
        layer.msg('密码长度应为5到16个字符之间！');
      } else if (password.value == '') {
        layer.msg('密码不能为空');
      } else {
        from.password = password.value
      }
    })

    nickname.addEventListener('blur', function () {
      if (nickname.value && nickname.value.length > 12 || nickname.value.length < 2) {
        layer.msg('昵称长度应为2个字符到12个字符之间');
      } else {
        from.nickname = nickname.value
      }
    })

    username.addEventListener('blur', function () {
      if (username.value.length > 25 || username.value.length < 5) {
        layer.msg('昵称长度应为5个字符到25个字符之间');
      } else if (username.value == '') {
        layer.msg('用户名不能为空');
      } else {
        from.username = username.value
      }
    })

    form.on('select(phone_state)', function (data) {
      from.phone_state = data.value
    });
    form.on('select(email_state)', function (data) {
      from.email_state = data.value
    });
    form.on('select(state)', function (data) {
      from.state = data.value
    });

    let submit = document.querySelector('#submit')
    submit.addEventListener('click', async function () {
      const { data: res } = await axios.post(BaseUrl + '/api/user/add',
        from, {
        headers: {
          'x-auth-token': token,
          'Content-Type': 'application/json'
        }
      }
      )
      if (res.result == 1) {
        layer.msg('确认/Confirm成功');
        setTimeout(function () { window.location.replace("./table.jsp"); }, 1000)
      }
    })

  });
</script>

</html>
