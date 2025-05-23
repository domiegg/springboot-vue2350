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
                                                                                                        <div class="layui-form-item" id="appointment_number_box">
                                            <label class="layui-form-label">预约编号</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入预约编号"
                                                       class="layui-input" id="appointment_number">
                                            </div>
                                        </div>
                                                                                                                                        <div class="layui-form-item" id="vaccine_no_box">
                                            <label class="layui-form-label">疫苗编号</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入疫苗编号"
                                                       class="layui-input" id="vaccine_no">
                                            </div>
                                        </div>
                                                                                                                                        <div class="layui-form-item" id="vaccine_name_box">
                                            <label class="layui-form-label">疫苗名称</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入疫苗名称"
                                                       class="layui-input" id="vaccine_name">
                                            </div>
                                        </div>
                                                                                                                                        <div class="layui-form-item" id="vaccine_classification_box">
                                            <label class="layui-form-label">疫苗分类</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入疫苗分类"
                                                       class="layui-input" id="vaccine_classification">
                                            </div>
                                        </div>
                                                                                                                                        <div class="layui-form-item" id="user_name_box">
                                            <label class="layui-form-label">用户姓名</label>
                                            <div class="layui-input-block">
                                                <select name="interest" lay-filter="user_name" id="user_name">
                                                    <option value=""></option>
                                                </select>
                                            </div>
                                        </div>
                                                                                                                                        <div class="layui-form-item" id="time_of_appointment_box">
                                            <label class="layui-form-label">预约时间</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入预约时间"
                                                       class="layui-input" id="time_of_appointment">
                                            </div>
                                        </div>
                                                                                                                    <div class="layui-form-item" id="cancel_quantity_box">
                                        <label class="layui-form-label">取消数量</label>
                                        <div class="layui-input-block">
                                            <select name="interest" lay-filter="cancel_quantity" id="cancel_quantity">
                                                <option value=""></option>
                                            </select>
                                        </div>
                                    </div>
                                                                                                                        <div class="layui-form-item" id="telephone_box">
                                            <label class="layui-form-label">电话</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入电话"
                                                       class="layui-input" id="telephone">
                                            </div>
                                        </div>
                                                                                                                    <div class="layui-form-item layui-form-text" id="reason_for_cancellation_box">
                                        <label class="layui-form-label">取消原因</label>
                                        <div class="layui-input-block">
                                            <textarea placeholder="请输入取消原因" class="layui-textarea"
                                                      id="reason_for_cancellation"></textarea>
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
    let appointment_cancellation_id = location.search.substring(1)
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
        // if (   user_group == "管理员" ||$check_action('/appointment_cancellation/view', 'add') || $check_action('/appointment_cancellation/view', 'set')) {
        //    submit.style.display = "block"
        // }
        // style="display: none"

        
            let field = "appointment_cancellation_id";
            let url_add = "appointment_cancellation";
            let url_set = "appointment_cancellation";
            let url_get_obj = "appointment_cancellation";
            let url_upload = "appointment_cancellation"
            let query = {
                "appointment_cancellation_id": 0,
            }

            let form_data2 = {
                                        "appointment_number": $get_stamp(), // 预约编号
                            "vaccine_no":  '', // 疫苗编号
                            "vaccine_name":  '', // 疫苗名称
                            "vaccine_classification":  '', // 疫苗分类
                                "user_name": 0, // 用户姓名
                            "time_of_appointment":  '', // 预约时间
                            "cancel_quantity":  '', // 取消数量
                            "telephone":  '', // 电话
                            "reason_for_cancellation":  '', // 取消原因
                                    "appointment_cancellation_id": 0, // ID
                                            }

            layui.layedit.set({
      uploadImage: {
        url: BaseUrl + '/api/appointment_cancellation/upload?' //接口url
        , type: 'post' //默认post
      }
    });


            var path1

            function getpath() {
                var list_data = JSON.parse(sessionStorage.list_data)
                for (var i = 0; i < list_data.length; i++) {
                    var o = list_data[i];
                    if (o.path === "/appointment_cancellation/table") {
                        path1 = o.path
                            $get_power(o.path)
                    }
                }
            }

            getpath()

            /**
             * 注册时是否有显示或操作字段的权限
             * @param {String} action 操作名
             * @param {String} field 查询的字段
             * @param {String} path 路径
             */
            function $check_register_field(action, field, path1) {
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
             * 是否有显示或操作字段的权限
             * @param {String} action 操作名
             * @param {String} field 查询的字段
             */
            function $check_field(action, field) {
                var o = $get_power("/appointment_cancellation/view");
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
             * 获取路径对应操作权限 鉴权
             * @param {String} action 操作名
             */
            function $check_exam(path1, action = "get") {
                var o = $get_power(path1);
                if (o) {
                    var option = JSON.parse(o.option);
                    if (option[action])
                        return true
                }
                return false;
            }

            /**
             * 是否有审核字段的权限
             */
            function $check_examine() {
                var url = window.location.href;
                var url_ = url.split("/")
                var pg_url = url_[url_.length - 2]
                let path = "/"+ pg_url + "/table"
                var o = $get_power(path);
                if (o){
                    var option = JSON.parse(o.option);
                    if (option.examine)
                        return true
                }
                return false;
            }

                            if (user_group === '管理员') {
                    $("#appointment_number_box").show()
                } else {
                    if ($check_field('add', 'appointment_number')){
                        $("#appointment_number_box").show()
                    }else {
                        $("#appointment_number_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#vaccine_no_box").show()
                } else {
                    if ($check_field('add', 'vaccine_no')){
                        $("#vaccine_no_box").show()
                    }else {
                        $("#vaccine_no_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#vaccine_name_box").show()
                } else {
                    if ($check_field('add', 'vaccine_name')){
                        $("#vaccine_name_box").show()
                    }else {
                        $("#vaccine_name_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#vaccine_classification_box").show()
                } else {
                    if ($check_field('add', 'vaccine_classification')){
                        $("#vaccine_classification_box").show()
                    }else {
                        $("#vaccine_classification_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#user_name_box").show()
                } else {
                    if ($check_field('add', 'user_name')){
                        $("#user_name_box").show()
                    }else {
                        $("#user_name_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#time_of_appointment_box").show()
                } else {
                    if ($check_field('add', 'time_of_appointment')){
                        $("#time_of_appointment_box").show()
                    }else {
                        $("#time_of_appointment_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#cancel_quantity_box").show()
                } else {
                    if ($check_field('add', 'cancel_quantity')){
                        $("#cancel_quantity_box").show()
                    }else {
                        $("#cancel_quantity_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#telephone_box").show()
                } else {
                    if ($check_field('add', 'telephone')){
                        $("#telephone_box").show()
                    }else {
                        $("#telephone_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#reason_for_cancellation_box").show()
                } else {
                    if ($check_field('add', 'reason_for_cancellation')){
                        $("#reason_for_cancellation_box").show()
                    }else {
                        $("#reason_for_cancellation_box").hide()
                    }
                }
            
                                                                                                                                                                                                                                                                                                                    
            
            
            
            
            
            
                                // 取消数量选项列表
                    let cancel_quantity_data = ['1'];
                
            
            
    
                                                                                                                                
                            
                            
                            
                            
                            
                            
                            
                            
                    
    
                    
                            
                            
                            
                            
                            async function list_user_name() {
                        var user_name = document.querySelector("#user_name")
                        var op1 = document.createElement("option");
                        op1.value = '0'
                            user_name.appendChild(op1)
                        // 收集数据 长度
                        var count
                        // 收集数据 数组
                        var arr = []
                        $.ajax({
                            url: BaseUrl + '/api/user/get_list?user_group=普通用户',
                            type: 'GET',
                            contentType: 'application/json; charset=UTF-8',
                            async: false,
                            dataType: 'json',
                            success: function (response) {
                                count = response.result.count
                                arr = response.result.list
                            }
                        })
                        for (var i = 0; i < arr.length; i++) {
                            var op = document.createElement("option");
                            // 给节点赋值
                            op.innerHTML = arr[i].username + "--" + arr[i].nickname
                            op.value = arr[i].user_id
                            // 新增/Add节点
                            user_name.appendChild(op)
                            if (form_data2.user_name==arr[i].user_name){
                                op.selected = true
                            }
                            layui.form.render("select");
                        }
                    }

                    layui.form.on('select(user_name)', function (data) {
                        form_data2.user_name = Number(data.elem[data.elem.selectedIndex].value);
                    })
                    list_user_name()
                                    
                                                async function cancel_quantity() {
                        var cancel_quantity = document.querySelector("#cancel_quantity")
                        var op1 = document.createElement("option");
                        op1.value = '0'
                            cancel_quantity.appendChild(op1)
                        // 收集数据 长度
                        var count
                        // 收集数据 数组
                        var arr = []
                        count = cancel_quantity_data.length
                        arr = cancel_quantity_data
                        for (var i = 0; i < arr.length; i++) {
                            var op = document.createElement("option");
                            // 给节点赋值
                            op.innerHTML = arr[i]
                            op.value = arr[i]
                            // 新增/Add节点
                            cancel_quantity.appendChild(op)
                            if (form_data2.cancel_quantity==arr[i].cancel_quantity){
                                op.selected = true
                            }
                            layui.form.render("select");
                        }
                    }

                    layui.form.on('select(cancel_quantity)', function (data) {
                        form_data2.cancel_quantity = data.elem[data.elem.selectedIndex].text;
                    })
                        cancel_quantity()
                
                            
                            
                    
                                //文本
                    let appointment_number = document.querySelector("#appointment_number")
                        appointment_number.onkeyup = function (event) {
                        form_data2.appointment_number = event.target.value
                    }
                    //文本
                                                                                //文本
                    let vaccine_no = document.querySelector("#vaccine_no")
                        vaccine_no.onkeyup = function (event) {
                        form_data2.vaccine_no = event.target.value
                    }
                    //文本
                                                                                //文本
                    let vaccine_name = document.querySelector("#vaccine_name")
                        vaccine_name.onkeyup = function (event) {
                        form_data2.vaccine_name = event.target.value
                    }
                    //文本
                                                                                //文本
                    let vaccine_classification = document.querySelector("#vaccine_classification")
                        vaccine_classification.onkeyup = function (event) {
                        form_data2.vaccine_classification = event.target.value
                    }
                    //文本
                                                                                                                            //文本
                    let time_of_appointment = document.querySelector("#time_of_appointment")
                        time_of_appointment.onkeyup = function (event) {
                        form_data2.time_of_appointment = event.target.value
                    }
                    //文本
                                                                                                                            //文本
                    let telephone = document.querySelector("#telephone")
                        telephone.onkeyup = function (event) {
                        form_data2.telephone = event.target.value
                    }
                    //文本
                                                                                                        //多文本
                    let reason_for_cancellation = document.querySelector("#reason_for_cancellation")
                    //多文本
                                                                    appointment_number.value = form_data2.appointment_number
                        $("#appointment_number").attr("disabled", "disabled");
                                                                                                                                                                                                                                                                                                var data = sessionStorage.data || ''
            if (data !== '') {
                var data2 = JSON.parse(data)
                Object.keys(form_data2).forEach(key => {
                    Object.keys(data2).forEach(dbKey => {
                        if (key === dbKey) {
                            if (key!=='examine_state' && key!=='examine_reply'){
                                $('#' + key).val(data2[key])
                                form_data2[key] = data2[key]
                                $('#' + key).attr('disabled', 'disabled')
                                        
                                    
                                    
                                    
                                                                            for (let key in form_data2) {
                                            if (key == 'user_name') {
                                                let alls = document.querySelector('#user_name').querySelectorAll('option')
                                                let test = form_data2[key]
                                                for (let i = 0; i < alls.length; i++) {
                                                    layui.form.render("select");
                                                    if (alls[i].value == test) {
                                                        alls[i].selected = true
                                                        form_data2.user_name = alls[i].value
                                                        layui.form.render("select");
                                                    }
                                                }
                                            }
                                        }
                                    
                                    
                                                                            for (let key in form_data2) {
                                            if (key == 'cancel_quantity') {
                                                let alls = document.querySelector('#cancel_quantity').querySelectorAll('option')
                                                let test = form_data2[key]
                                                for (let i = 0; i < alls.length; i++) {
                                                    if (alls[i].innerHTML == test) {
                                                        alls[i].selected = true
                                                        form_data2.cancel_quantity = alls[i].text
                                                        layui.form.render("select");
                                                    }
                                                }
                                            }
                                        }
                                    
                                    
                                    
                                                        }
                        }
                    })
                })
                sessionStorage.removeItem("data");
            }
                                                                                                                                                

            if (appointment_cancellation_id !== '') {
                async function axios_get_3() {
                    const {data: rese} = await axios.get(BaseUrl + '/api/appointment_cancellation/get_obj', {
                        params: {
                                appointment_cancellation_id: appointment_cancellation_id
                        }, headers: {
                            'x-auth-token': token
                        }
                    })

                    let data = rese.result.obj
                    Object.keys(form_data2).forEach((key) => {
                        form_data2[key] = data[key];
                        $("#"+key).val(form_data2[key])
                    });

                    

            
            
            
            
                                        for (let key in data) {
                                if (key == 'user_name') {
                                    let alls = document.querySelector('#user_name').querySelectorAll('option')
                                    let test = data[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        layui.form.render("select");
                                        if (alls[i].value == test) {
                                            alls[i].selected = true
                                            form_data2.user_name = alls[i].value
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }
                        
            
                                        for (let key in data) {
                                if (key == 'cancel_quantity') {
                                    let alls = document.querySelector('#cancel_quantity').querySelectorAll('option')
                                    let test = data[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        if (alls[i].innerHTML == test) {
                                            alls[i].selected = true
                                            form_data2.cancel_quantity = alls[i].text
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }
                        
            
            
                                    if (user_group === '管理员') {
                            $("#appointment_number_box").show()
                        } else {
                            if ($check_field('set', 'appointment_number') || $check_field('get', 'appointment_number')){
                                $("#appointment_number_box").show()
                            }else {
                                $("#appointment_number_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#vaccine_no_box").show()
                        } else {
                            if ($check_field('set', 'vaccine_no') || $check_field('get', 'vaccine_no')){
                                $("#vaccine_no_box").show()
                            }else {
                                $("#vaccine_no_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#vaccine_name_box").show()
                        } else {
                            if ($check_field('set', 'vaccine_name') || $check_field('get', 'vaccine_name')){
                                $("#vaccine_name_box").show()
                            }else {
                                $("#vaccine_name_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#vaccine_classification_box").show()
                        } else {
                            if ($check_field('set', 'vaccine_classification') || $check_field('get', 'vaccine_classification')){
                                $("#vaccine_classification_box").show()
                            }else {
                                $("#vaccine_classification_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#user_name_box").show()
                        } else {
                            if ($check_field('set', 'user_name') || $check_field('get', 'user_name')){
                                $("#user_name_box").show()
                            }else {
                                $("#user_name_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#time_of_appointment_box").show()
                        } else {
                            if ($check_field('set', 'time_of_appointment') || $check_field('get', 'time_of_appointment')){
                                $("#time_of_appointment_box").show()
                            }else {
                                $("#time_of_appointment_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#cancel_quantity_box").show()
                        } else {
                            if ($check_field('set', 'cancel_quantity') || $check_field('get', 'cancel_quantity')){
                                $("#cancel_quantity_box").show()
                            }else {
                                $("#cancel_quantity_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#telephone_box").show()
                        } else {
                            if ($check_field('set', 'telephone') || $check_field('get', 'telephone')){
                                $("#telephone_box").show()
                            }else {
                                $("#telephone_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#reason_for_cancellation_box").show()
                        } else {
                            if ($check_field('set', 'reason_for_cancellation') || $check_field('get', 'reason_for_cancellation')){
                                $("#reason_for_cancellation_box").show()
                            }else {
                                $("#reason_for_cancellation_box").hide()
                            }
                        }
                    
                    // Array.prototype.slice.call(document.getElementsByTagName('input')).map(i => i.disabled = true)
                    // Array.prototype.slice.call(document.getElementsByTagName('select')).map(i => i.disabled = true)
                    // Array.prototype.slice.call(document.getElementsByTagName('textarea')).map(i => i.disabled = true)
                                                    //文本
                                appointment_number.value = form_data2.appointment_number
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'appointment_number')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'appointment_number'))) {
                            }else {
                                $("#appointment_number").attr("disabled", true);
                                $("#appointment_number > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                vaccine_no.value = form_data2.vaccine_no
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'vaccine_no')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'vaccine_no'))) {
                            }else {
                                $("#vaccine_no").attr("disabled", true);
                                $("#vaccine_no > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                vaccine_name.value = form_data2.vaccine_name
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'vaccine_name')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'vaccine_name'))) {
                            }else {
                                $("#vaccine_name").attr("disabled", true);
                                $("#vaccine_name > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                vaccine_classification.value = form_data2.vaccine_classification
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'vaccine_classification')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'vaccine_classification'))) {
                            }else {
                                $("#vaccine_classification").attr("disabled", true);
                                $("#vaccine_classification > input[name='file']").attr('disabled', true);
                            }
                                    
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'user_name')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'user_name'))) {
                            }else {
                                $("#user_name").attr("disabled", true);
                                $("#user_name > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                time_of_appointment.value = form_data2.time_of_appointment
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'time_of_appointment')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'time_of_appointment'))) {
                            }else {
                                $("#time_of_appointment").attr("disabled", true);
                                $("#time_of_appointment > input[name='file']").attr('disabled', true);
                            }
                                    
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'cancel_quantity')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'cancel_quantity'))) {
                            }else {
                                $("#cancel_quantity").attr("disabled", true);
                                $("#cancel_quantity > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                telephone.value = form_data2.telephone
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'telephone')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'telephone'))) {
                            }else {
                                $("#telephone").attr("disabled", true);
                                $("#telephone > input[name='file']").attr('disabled', true);
                            }
                                                                //多文本
                                reason_for_cancellation.value = form_data2.reason_for_cancellation
                            //多文本
                        
                                if (user_group === '管理员' || (form_data2['appointment_cancellation_id'] && $check_field('set', 'reason_for_cancellation')) || (!form_data2['appointment_cancellation_id'] && $check_field('add', 'reason_for_cancellation'))) {
                            }else {
                                $("#reason_for_cancellation").attr("disabled", true);
                                $("#reason_for_cancellation > input[name='file']").attr('disabled', true);
                            }
                                                                                                                                                                                                                                                                                                                                                                        layui.form.render("select");
                }
                axios_get_3()
            }


            

            submit.onclick = async function () {
                try {
                                                                    //文本
                            form_data2.appointment_number = appointment_number.value
                            //文本
                                                                    //文本
                            form_data2.vaccine_no = vaccine_no.value
                            //文本
                                                                    //文本
                            form_data2.vaccine_name = vaccine_name.value
                            //文本
                                                                    //文本
                            form_data2.vaccine_classification = vaccine_classification.value
                            //文本
                                                                                                //文本
                            form_data2.time_of_appointment = time_of_appointment.value
                            //文本
                                                                                        //文本
                            form_data2.telephone = telephone.value
                            //文本
                                                                    //多文本
                            form_data2.reason_for_cancellation = reason_for_cancellation.value
                            //多文本
                                            } catch (err) {
                    console.log(err)
                }
                            
            
                let customize_field = []
                                            customize_field.push({"field_name": "预约编号", "field_value": form_data2.appointment_number});
                                                customize_field.push({"field_name": "疫苗编号", "field_value": form_data2.vaccine_no});
                                                customize_field.push({"field_name": "疫苗名称", "field_value": form_data2.vaccine_name});
                                                customize_field.push({"field_name": "疫苗分类", "field_value": form_data2.vaccine_classification});
                                                customize_field.push({"field_name": "用户姓名", "field_value": form_data2.user_name});
                                                customize_field.push({"field_name": "预约时间", "field_value": form_data2.time_of_appointment});
                                                customize_field.push({"field_name": "取消数量", "field_value": form_data2.cancel_quantity});
                                                customize_field.push({"field_name": "电话", "field_value": form_data2.telephone});
                                                customize_field.push({"field_name": "取消原因", "field_value": form_data2.reason_for_cancellation});
                    
    
                if (appointment_cancellation_id == '') {
                                        console.log("新增/Add")
                    const {data: res} = await axios.post(BaseUrl + '/api/appointment_cancellation/add?',
                            form_data2, {
                                headers: {
                                    'x-auth-token': token,
                                    'Content-Type': 'application/json'
                                }
                            })
                                        if (res.result == 1) {
                        layer.msg('确认/Confirm完毕');
                        setTimeout(function () {
                            window.location.replace("./table.jsp");
                        }, 1000)
                    }else {
              layer.msg(res.error.message);
            }
                                    } else {
                                        console.log("详情/Details")
                    
                    const {data: res} = await axios.post(BaseUrl + '/api/appointment_cancellation/set?appointment_cancellation_id=' + appointment_cancellation_id,
                            form_data2, {
                                headers: {
                                    'x-auth-token': token,
                                    'Content-Type': 'application/json'
                                }
                            })
                    if (res.result == 1) {
                        layer.msg('确认/Confirm完毕');
                        setTimeout(function () {
                            window.location.replace("./table.jsp");
                        }, 1000)
                    }else {
              layer.msg(res.error.message);
            }
                }
            }
        
    })
    ;
</script>

</html>
