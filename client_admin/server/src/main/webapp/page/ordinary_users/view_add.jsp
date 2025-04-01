<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 新增/Add -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/diy.css">
    <script src="../../js/axios.min.js"></script>

    <style>
        img {
            width: 200px;
        }



    </style>
</head>

<body>
<article class="sign_in">
    <div class="warp">
        <div class="layui-container">
            <div class="layui-row">
                <form class="layui-form" action="">
                                            <div class="layui-upload">
                            <button type="button" class="layui-btn" id="ordinary_users">上传头像</button>
                            <div class="layui-upload-list">
                                <img class="layui-upload-img" id="ordinary_users_img">
                                <p id="demoText"></p>
                            </div>
                            <div style="width: 95px;">
                                <div class="layui-progress layui-progress-big" lay-showpercent="yes"
                                     lay-filter="ordinary_users">
                                    <div class="layui-progress-bar" lay-percent=""></div>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">账号</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                       placeholder="请输入账号"
                                       class="layui-input" id="username">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" placeholder="请输入密码" autocomplete="off"
                                       class="layui-input"
                                       id="password">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                       placeholder="请输入昵称"
                                       class="layui-input" id="nickname">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号码</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                       placeholder="请输入手机号码"
                                       class="layui-input" id="phone">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                       placeholder="请输入邮箱"
                                       class="layui-input" id="email">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">手机认证</label>
                            <div class="layui-input-block">
                                <select name="interest" lay-filter="phone_state" id="phone_state">
                                    <option value=""></option>
                                    <option value="2">已认证</option>
                                    <option value="0">未认证</option>
                                    <option value="1">认证中</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱认证</label>
                            <div class="layui-input-block">
                                <select name="interest" lay-filter="email_state" id="email_state">
                                    <option value=""></option>
                                    <option value="2">已认证</option>
                                    <option value="0">未认证</option>
                                    <option value="1">认证中</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">状态</label>
                            <div class="layui-input-block">
                                <select name="interest" lay-filter="state" id="state">
                                    <option value=""></option>
                                    <option value="1">可用</option>
                                    <option value="2">异常</option>
                                    <option value="3">已冻结</option>
                                    <option value="4">已注销</option>
                                </select>
                            </div>
                        </div>

                                                                                        <div class="layui-form-item" id="user_name_box">
                                            <label class="layui-form-label">用户姓名</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入用户姓名"
                                                       class="layui-input" id="user_name">
                                            </div>
                                        </div>
                                                                                                <div class="layui-form-item" id="gender_box">
                                        <label class="layui-form-label">性别</label>
                                        <div class="layui-input-block">
                                            <select name="interest" lay-filter="gender" id="gender">
                                                <option value=""></option>
                                            </select>
                                        </div>
                                    </div>
                                                                                    <div class="layui-form-item" id="age_box">
                                        <label class="layui-form-label">年龄</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="num" class="layui-input num" id="age">
                                        </div>
                                    </div>
                                        
    
    
                </form>
                <div class="layui-btn-container">
                    <a href="#" type="button" class="layui-btn layui-btn-normal login" id="submit" >确认/Confirm</a>
                    <a href="./table.jsp" target="main_self_frame" type="button"
                       class="layui-btn layui-btn-normal login">取消/Cancel</a>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
<script src="../../layui/layui.js"></script>
<script src="../../js/base.js"></script>
<script src="../../js/index.js"></script>
<script>
    var BaseUrl = baseUrl()
    let ordinary_users_id = location.search.substring(1)
    layui.use(['upload', 'element', 'layer', 'laydate', 'layedit'], function () {
        var $ = layui.jquery
                , upload = layui.upload
                , element = layui.element
                , layer = layui.layer
                , laydate = layui.laydate
                , layedit = layui.layedit
                , form = layui.form;

        let url

        let token = sessionStorage.token || null
        let personInfo = JSON.parse(sessionStorage.personInfo)
        let user_group = personInfo.user_group
        let use_id = personInfo.user_id


        function  $get_stamp() {
            return new Date().getTime();
        }

        function  $get_rand(len) {
            var rand = Math.random();
            return Math.ceil(rand * 10 ** len);
        }

        
            // 权限判断
            /**
             * 获取路径对应操作权限 鉴权
             * @param {String} action 操作名
             */
            function $check_action(path1, action = "get") {
                var o = $get_power(path1);
                if (o && o[action] != 0 && o[action] != false) {
                    return true;
                }
                return false;
            }

            /**
             * 是否有显示或操作字段的权限
             * @param {String} action 操作名
             * @param {String} field 查询的字段
             */
            function $check_field(action, field, path1) {
                var o = $get_power(path1);
                var auth;
                if (o && o[action] != 0 && o[action] != false) {
                    auth = o["field_" + action];
                }
                if (auth) {
                    return auth.indexOf(field) !== -1;
                }
                return false;
            }

            /**
             * 获取权限
             * @param {String} path 路由路径
             */
            function $get_power(path) {
                var list_data = JSON.parse(sessionStorage.list_data)
                var list = list_data;
                var obj;
                for (var i = 0; i < list.length; i++) {
                    var o = list[i];
                    if (o.path === path) {
                        obj = o;
                        break;
                    }
                }
                return obj;
            }

        let submit = document.querySelector('#submit')
        // 提交按钮校验权限
        // if (   user_group == "管理员" ||$check_action('/ordinary_users/view', 'add') || $check_action('/ordinary_users/view', 'set')) {
        //    submit.style.display = "block"
        // }
        // style="display: none"

        
            //常规使用 - 普通图片上传
            var uploadInst = upload.render({
                elem: '#ordinary_users'
                , url: BaseUrl + '/api/ordinary_users/upload?' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
                , headers: {
                    'x-auth-token': token
                }, before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#ordinary_users_img').attr('src', fullUrl(BaseUrl,result)); //图片链接（base64）
                    });

                    element.progress('ordinary_users', '0%'); //进度条复位
                    layer.msg('上传中', {icon: 16, time: 0});
                }
                , done: function (res) {
                    //如果上传失败
                    if (res.code > 0) {
                        return layer.msg('上传失败');
                    }
                    //上传成功的一些操作
                    //……
                    url = res.result.url
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
                    element.progress('ordinary_users', n + '%'); //可配合 layui 进度条元素使用
                    if (n == 100) {
                        layer.msg('上传完毕', {icon: 1});
                    }
                }
            });
            let username = document.querySelector('#username')
            let password = document.querySelector('#password')
            let nickname = document.querySelector('#nickname')
            let email = document.querySelector('#email')
            let phone = document.querySelector('#phone')
            let email_state = document.querySelector('#email_state')

            let form_data = {
                user_id: 0,
                username: '',
                nickname: '',
                password: '',
                avatar: '',
                phone: '',
                email: '',
                user_group: "普通用户",
                phone_state: 0,
                email_state: 0,
                state: 1
            }
            let form_sub = {
                                        "user_name":  '', // 用户姓名
                            "gender":  '', // 性别
                            "age":  0, // 年龄
    
                            "user_id": 0,
                "ordinary_users_id": 0 // ID
            }

                    
                                                                // 性别选项列表
                    let gender_data = ['男','女']
                
                            async function list_gender() {
                        var gender = document.querySelector("#gender")
                        var op1 = document.createElement("option");
                        op1.value = '0'
                            gender.appendChild(op1)
                        // 收集数据 长度
                        var count
                        // 收集数据 数组
                        var arr = []
                        count = gender_data.length
                        arr = gender_data
                        for (var i = 0; i < arr.length; i++) {
                            var op = document.createElement("option");
                            // 给节点赋值
                            op.innerHTML = arr[i]
                            op.value = arr[i]
                            // 新增/Add节点
                            gender.appendChild(op)
                            if (form_sub.gender==arr[i].gender){
                                op.selected = true
                            }
                            layui.form.render("select");
                        }
                    }

                    layui.form.on('select(gender)', function (data) {
                        form_sub.gender = data.elem[data.elem.selectedIndex].text;
                    })
                    list_gender()
                                                    
                                                // 单选框点击事件
            layui.form.on('select(email_state)', function (data) {
                form_data.email_state = Number(data.elem[data.elem.selectedIndex].value);
            })
            layui.form.on('select(state)', function (data) {
                form_data.state = Number(data.elem[data.elem.selectedIndex].value);
            })
            layui.form.on('select(phone_state)', function (data) {
                form_data.phone_state = Number(data.elem[data.elem.selectedIndex].value);
                console.log()
            })

            
                                                                                                    let user_name = document.querySelector("#user_name")
                                                                                                                                                                                                                                        
            if (ordinary_users_id !== '') {
                username.disabled = "disabled"
                password.disabled = "disabled"
                username.style.border = "none"
                password.style.border = "none"


                async function axios_get_4() {
                    const {data: rese} = await axios.get(BaseUrl + '/api/user/get_obj', {
                        params: {
                            user_id: ordinary_users_id
                        }
                    })

                    let data_2 = rese.result.obj
                    Object.keys(form_data).forEach((key) => {
                        form_data[key] = data_2[key];
                    });
                    console.log(form_data)
                    for (let key in form_data) {
                        if (key == 'avatar') {
                                ordinary_users_img.src = BaseUrl + form_data.avatar
                        }
                    }
                    for (let key in form_data) {
                        if (key == 'email_state') {
                            let alls = document.querySelector('#email_state').querySelectorAll('option')
                            let test = form_data[key]
                            for (let i = 0; i < alls.length; i++) {
                                layui.form.render("select");
                                if (alls[i].value == test) {
                                    alls[i].selected = true
                                    layui.form.render("select");
                                }
                            }
                        }
                    }
                    for (let key in form_data) {
                        if (key == 'phone_state') {
                            let alls = document.querySelector('#phone_state').querySelectorAll('option')
                            let test = form_data[key]
                            for (let i = 0; i < alls.length; i++) {
                                layui.form.render("select");
                                if (alls[i].value == test) {
                                    alls[i].selected = true
                                    layui.form.render("select");
                                }
                            }
                        }
                    }
                    for (let key in form_data) {
                        if (key == 'state') {
                            let alls = document.querySelector('#state').querySelectorAll('option')
                            let test = form_data[key]
                            for (let i = 0; i < alls.length; i++) {
                                layui.form.render("select");
                                if (alls[i].value == test) {
                                    alls[i].selected = true
                                    layui.form.render("select");
                                }
                            }
                        }
                    }
                    username.value = form_data.username
                    password.value = form_data.password
                    nickname.value = form_data.nickname
                    email.value = form_data.email
                    phone.value = form_data.phone
                }

                axios_get_4()

                async function axios_get_5() {
                    const {data: rese} = await axios.get(BaseUrl + '/api/ordinary_users/get_obj', {
                        params: {
                            user_id: ordinary_users_id
                        }
                    })

                    let data_2 = rese.result.obj
                    Object.keys(form_sub).forEach((key) => {
                        form_sub[key] = data_2[key];
                    });
                   for (let key in form_sub) {
                                                                               }
                    
                        user_name.value = form_sub.user_name
                                            age.value = form_sub.age
                                                                                for (let key in data_2) {
                                if (key == 'gender') {
                                    let alls = document.querySelector('#gender').querySelectorAll('option')
                                    let test = data_2[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        if (alls[i].innerHTML == test) {
                                            alls[i].selected = true
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }
                                                                                        }

                axios_get_5()

            }

            submit.onclick = async function () {
                form_data.username = username.value
                form_data.password = password.value
                form_data.nickname = nickname.value
                form_data.email = email.value
                form_data.password = password.value
                form_data.phone = phone.value
                form_data.avatar = url
                                                                                                    //7
                                form_sub.user_name = user_name.value
                                //7
                                                                                                                                                                                                                            var email_regular = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
                var phone_regular = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;

                if (!username.value) {
                    layer.msg('账号不能为空');
                } else if (username.value.length > 16 || username.value.length < 5) {
                    layer.msg('账号长度应为5到16个字符之间');
                } else if (!password.value) {
                    layer.msg('密码不能为空');
                } else if (!ordinary_users_id && (password.value.length > 16 || password.value.length < 5)) {
                    layer.msg('密码长度应为5到16个字符之间');
                } else if (nickname.value.length > 12 || nickname.value.length < 2) {
                    layer.msg('昵称长度应为2到12个字符之间');
                } else if (email.value && !email_regular.test(email.value)) {
                    layer.msg('请输入正确的邮箱地址 例：test@test.com!');
                } else if (phone.value && !phone_regular.test(phone.value)) {
                    layer.msg('请输入正确的手机号码 例：18955552312!');
                } else if (form_data) {
                    if (ordinary_users_id == '') {
                        const {data: res} = await axios.post(BaseUrl + '/api/user/register?', form_data, {
                            headers: {
                                'x-auth-token': token,
                                'Content-Type': 'application/json'
                            }
                        })
                        if (res.error){
                            layer.msg(res.error.message);
                            return;
                        }
                    }
                    Object.keys(form_data).forEach(item => {
                        if (form_data[item] === '') delete form_data[item]
                        if (form_data[item] === null) delete form_data[item]
                    })
                    let data_p = {
                        username: form_data.username,
                        nickname: form_data.nickname,
                        avatar: form_data.avatar,
                        phone: form_data.phone,
                        email: form_data.email,
                        user_group: form_data.user_group,
                        phone_state: form_data.phone_state,
                        email_state: form_data.email_state,
                        state: form_data.state
                    }
                    if (ordinary_users_id !== '') {
                        data_p['user_id'] = ordinary_users_id
                    }
                    let data_p_param = {
                        username:data_p.username,
                        nickname:data_p.nickname
                    }
                    const {data: rese} = await axios.get(BaseUrl + '/api/user/get_obj', {
                        params: data_p_param
                    })
                    let idd
                    if (ordinary_users_id == '') {
                        idd = rese.result.obj.user_id
                    }else {
                        idd = ordinary_users_id
                    }
                    form_sub.user_id = idd

                                                                                        //多文本
                            form_sub.user_name = user_name.value
                            //多文本
                                                            if (user_group === '管理员' || (form_sub['ordinary_users_id'] && $check_field('set', 'user_name')) || (!form_sub['ordinary_users_id'] && $check_field('add', 'user_name'))) {
                            }else {
                                $("#user_name").attr("disabled", true);
                                $("#user_name > input[name='file']").attr('disabled', true);
                            }
                                                                                                        if (user_group === '管理员' || (form_sub['ordinary_users_id'] && $check_field('set', 'gender')) || (!form_sub['ordinary_users_id'] && $check_field('add', 'gender'))) {
                            }else {
                                $("#gender").attr("disabled", true);
                                $("#gender > input[name='file']").attr('disabled', true);
                            }
                                                                                //数字
                            form_sub.age = age.value
                            //数字
                                                                            if (user_group === '管理员' || (form_sub['ordinary_users_id'] && $check_field('set', 'age')) || (!form_sub['ordinary_users_id'] && $check_field('add', 'age'))) {
                            }else {
                                $("#age").attr("disabled", true);
                                $("#age > input[name='file']").attr('disabled', true);
                            }
                                                if (ordinary_users_id == '') {
                        console.log("新增/Add")
                        const {data: ress} = await axios.post(BaseUrl + '/api/ordinary_users/add?', form_sub, {
                            headers: {
                                'x-auth-token': token,
                                'Content-Type': 'application/json'
                            }
                        })
                        if (ress.result == 1) {
                            layer.msg('确认/Confirm完毕');
                            setTimeout(function () {
                                window.location.replace("./table.jsp");
                            }, 1000)
                        }else if(ress.error){
                            let user_id = form_sub.user_id;
                            axios.get(BaseUrl + '/api/user/del', {user_id})
                            layer.msg(ress.error.message);
                        }
                    } else {
                                                                                                //多文本
                                form_sub.user_name = user_name.value
                                //多文本
                                                                    if (user_group === '管理员' || (form_sub['ordinary_users_id'] && $check_field('set', 'user_name')) || (!form_sub['ordinary_users_id'] && $check_field('add', 'user_name'))) {
                                }else {
                                    $("#user_name").attr("disabled", true);
                                    $("#user_name > input[name='file']").attr('disabled', true);
                                }
                                                                                                                if (user_group === '管理员' || (form_sub['ordinary_users_id'] && $check_field('set', 'gender')) || (!form_sub['ordinary_users_id'] && $check_field('add', 'gender'))) {
                                }else {
                                    $("#gender").attr("disabled", true);
                                    $("#gender > input[name='file']").attr('disabled', true);
                                }
                                                                                        //数字
                                form_sub.age = age.value
                                //数字
                                                                                    if (user_group === '管理员' || (form_sub['ordinary_users_id'] && $check_field('set', 'age')) || (!form_sub['ordinary_users_id'] && $check_field('add', 'age'))) {
                                }else {
                                    $("#age").attr("disabled", true);
                                    $("#age > input[name='file']").attr('disabled', true);
                                }
                                                        console.log("详情/Details")
                        const {data: res_data} = await axios.post(BaseUrl + '/api/user/set?user_id=' + form_data.user_id, form_data, {
                            headers: {
                                'x-auth-token': token,
                                'Content-Type': 'application/json'
                            }
                        })
                        console.log(res_data)
                        const {data: res_data2} = await axios.post(BaseUrl + '/api/ordinary_users/set?ordinary_users_id=' + form_sub.ordinary_users_id, form_sub, {
                            headers: {
                                'x-auth-token': token,
                                'Content-Type': 'application/json'
                            }
                        })
                        console.log(res_data2)
                        if (res_data2.result == 1) {
                            layer.msg('确认/Confirm完毕');
                            setTimeout(function () {
                                window.location.replace("./table.jsp");
                            }, 1000)
                        }
                    }

                }

            }
                                                                                                            
    })
    ;
</script>

</html>
