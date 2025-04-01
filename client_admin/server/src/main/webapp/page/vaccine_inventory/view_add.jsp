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
                                                                                    <div class="layui-upload" id="picture_box">
                                        <button type="button" class="layui-btn" id="picture">上传图片</button>
                                        <div class="layui-upload-list">
                                            <img class="layui-upload-img" id="picture_img">
                                            <p id="demoText"></p>
                                        </div>
                                        <div style="width: 95px;">
                                            <div class="layui-progress layui-progress-big" lay-showpercent="yes"
                                                 lay-filter="picture">
                                                <div class="layui-progress-bar" lay-percent=""></div>
                                            </div>
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
                                            <select name="interest" lay-filter="vaccine_classification" id="vaccine_classification">
                                                <option value=""></option>
                                            </select>
                                        </div>
                                    </div>
                                                                                                                        <div class="layui-form-item" id="suitable_for_people_box">
                                            <label class="layui-form-label">适合人群</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入适合人群"
                                                       class="layui-input" id="suitable_for_people">
                                            </div>
                                        </div>
                                                                                                                    <div class="layui-form-item" id="inventory_quantity_box">
                                        <label class="layui-form-label">库存数量</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="num" class="layui-input num" id="inventory_quantity">
                                        </div>
                                    </div>
                                                                                                                        <div class="layui-form-item" id="manufacturer_box">
                                            <label class="layui-form-label">生产厂家</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入生产厂家"
                                                       class="layui-input" id="manufacturer">
                                            </div>
                                        </div>
                                                                                                                    <div class="layui-form-item" id="date_of_manufacture_box">
                                        <div class="layui-inline">
                                            <label class="layui-form-label">生产日期</label>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" id="date_of_manufacture"
                                                       placeholder="yyyy-MM-dd">
                                            </div>
                                        </div>
                                    </div>
                                                                                                    <div class="layui-form-item" id="expiration_date_box">
                                        <div class="layui-inline">
                                            <label class="layui-form-label">失效日期</label>
                                            <div class="layui-input-inline">
                                                <input type="text" class="layui-input" id="expiration_date"
                                                       placeholder="yyyy-MM-dd">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                        <div class="layui-form-item" id="storage_location_box">
                                            <label class="layui-form-label">存放位置</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入存放位置"
                                                       class="layui-input" id="storage_location">
                                            </div>
                                        </div>
                                                                                                                    <div class="layui-form-item layui-form-text" id="storage_requirements_box">
                                        <label class="layui-form-label">存放要求</label>
                                        <div class="layui-input-block">
                                            <textarea placeholder="请输入存放要求" class="layui-textarea"
                                                      id="storage_requirements"></textarea>
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
    let vaccine_inventory_id = location.search.substring(1)
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
        // if (   user_group == "管理员" ||$check_action('/vaccine_inventory/view', 'add') || $check_action('/vaccine_inventory/view', 'set')) {
        //    submit.style.display = "block"
        // }
        // style="display: none"

        
            let field = "vaccine_inventory_id";
            let url_add = "vaccine_inventory";
            let url_set = "vaccine_inventory";
            let url_get_obj = "vaccine_inventory";
            let url_upload = "vaccine_inventory"
            let query = {
                "vaccine_inventory_id": 0,
            }

            let form_data2 = {
                                        "picture":  '', // 图片
                            "vaccine_no":  '', // 疫苗编号
                            "vaccine_name":  '', // 疫苗名称
                            "vaccine_classification":  '', // 疫苗分类
                            "suitable_for_people":  '', // 适合人群
                            "inventory_quantity":  0, // 库存数量
                            "manufacturer":  '', // 生产厂家
                            "date_of_manufacture":  '', // 生产日期
                            "expiration_date":  '', // 失效日期
                            "storage_location":  '', // 存放位置
                            "storage_requirements":  '', // 存放要求
                                    "vaccine_inventory_id": 0, // ID
                                            }

            layui.layedit.set({
      uploadImage: {
        url: BaseUrl + '/api/vaccine_inventory/upload?' //接口url
        , type: 'post' //默认post
      }
    });


            var path1

            function getpath() {
                var list_data = JSON.parse(sessionStorage.list_data)
                for (var i = 0; i < list_data.length; i++) {
                    var o = list_data[i];
                    if (o.path === "/vaccine_inventory/table") {
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
                var o = $get_power("/vaccine_inventory/view");
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
                    $("#picture_box").show()
                } else {
                    if ($check_field('add', 'picture')){
                        $("#picture_box").show()
                    }else {
                        $("#picture_box").hide()
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
                    $("#suitable_for_people_box").show()
                } else {
                    if ($check_field('add', 'suitable_for_people')){
                        $("#suitable_for_people_box").show()
                    }else {
                        $("#suitable_for_people_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#inventory_quantity_box").show()
                } else {
                    if ($check_field('add', 'inventory_quantity')){
                        $("#inventory_quantity_box").show()
                    }else {
                        $("#inventory_quantity_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#manufacturer_box").show()
                } else {
                    if ($check_field('add', 'manufacturer')){
                        $("#manufacturer_box").show()
                    }else {
                        $("#manufacturer_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#date_of_manufacture_box").show()
                } else {
                    if ($check_field('add', 'date_of_manufacture')){
                        $("#date_of_manufacture_box").show()
                    }else {
                        $("#date_of_manufacture_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#expiration_date_box").show()
                } else {
                    if ($check_field('add', 'expiration_date')){
                        $("#expiration_date_box").show()
                    }else {
                        $("#expiration_date_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#storage_location_box").show()
                } else {
                    if ($check_field('add', 'storage_location')){
                        $("#storage_location_box").show()
                    }else {
                        $("#storage_location_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#storage_requirements_box").show()
                } else {
                    if ($check_field('add', 'storage_requirements')){
                        $("#storage_requirements_box").show()
                    }else {
                        $("#storage_requirements_box").hide()
                    }
                }
            
                                                //常规使用 - 普通图片上传
                        var uploadInst = upload.render({
                            elem: '#picture'
                            , url: BaseUrl + '/api/vaccine_inventory/upload?' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
                            , headers: {
                                'x-auth-token': token
                            }, before: function (obj) {
                                //预读本地文件示例，不支持ie8
                                obj.preview(function (index, file, result) {
                                    $('#picture_img').attr('src', fullUrl(BaseUrl,result)); //图片链接（base64）
                                });

                                element.progress('picture', '0%'); //进度条复位
                                layer.msg('上传中', {icon: 16, time: 0});
                            }
                            , done: function (res) {
                                //如果上传失败
                                if (res.code > 0) {
                                    return layer.msg('上传失败');
                                }
                                //上传成功的一些操作
                                //……
                                form_data2.picture = res.result.url
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
                                element.progress('picture', n + '%'); //可配合 layui 进度条元素使用
                                if (n == 100) {
                                    layer.msg('上传完毕', {icon: 1});
                                }
                            }
                        });
                                                                                                                                                                                                                                                                                                                                                                    
            
            
            
                                // 疫苗分类选项列表
                    let vaccine_classification_data = [""];
                
            
            
            
            
            
            
            
    
                                                                                                                                                        
                            
                            
                            
                            
                            
                            
                                                // 日期选择
                    laydate.render({
                        elem: '#date_of_manufacture'
                        , format: 'yyyy-MM-dd'
                        , done: function (value) {
                            form_data2.date_of_manufacture = value + ' 00:00:00'
                        }
                    });
                
                                                // 日期选择
                    laydate.render({
                        elem: '#expiration_date'
                        , format: 'yyyy-MM-dd'
                        , done: function (value) {
                            form_data2.expiration_date = value + ' 00:00:00'
                        }
                    });
                
                            
                            
                    
    
                    
                            
                            
                                        async function vaccine_classification() {
                        var vaccine_classification = document.querySelector("#vaccine_classification")
                        var op1 = document.createElement("option");
                        op1.value = '0'
                            vaccine_classification.appendChild(op1)
                        // 收集数据 长度
                        var count
                        // 收集数据 数组
                        var arr = []
                        let {data: res} = await axios.get(BaseUrl + '/api/vaccine_classification/get_list')
                        count = res.result.count
                        arr = res.result.list
                        for (var i = 0; i < arr.length; i++) {
                            var op = document.createElement("option");

                            // 给节点赋值
                            op.innerHTML = arr[i].vaccine_classification
                            op.value = i + 1
                            // 新增/Add节点
                            vaccine_classification.appendChild(op)
                            if (form_data2.vaccine_classification==arr[i].vaccine_classification){
                                op.selected = true
                            }
                            layui.form.render("select");
                        }
                    }

                    layui.form.on('select(vaccine_classification)', function (data) {
                        form_data2.vaccine_classification = data.elem[data.elem.selectedIndex].text;
                    })
                        vaccine_classification()
                        
                            
                            
                            
                            
                            
                            
                            
                    
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
                    let suitable_for_people = document.querySelector("#suitable_for_people")
                        suitable_for_people.onkeyup = function (event) {
                        form_data2.suitable_for_people = event.target.value
                    }
                    //文本
                                                                                                //数字
                    let inventory_quantity = document.querySelector("#inventory_quantity")
                        inventory_quantity.onkeyup = function (event) {
                        form_data2.inventory_quantity = Number(event.target.value)
                    }
                    //数字
                                                                //文本
                    let manufacturer = document.querySelector("#manufacturer")
                        manufacturer.onkeyup = function (event) {
                        form_data2.manufacturer = event.target.value
                    }
                    //文本
                                                                                                                                                                        //文本
                    let storage_location = document.querySelector("#storage_location")
                        storage_location.onkeyup = function (event) {
                        form_data2.storage_location = event.target.value
                    }
                    //文本
                                                                                                        //多文本
                    let storage_requirements = document.querySelector("#storage_requirements")
                    //多文本
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
                                            if (key == 'vaccine_classification') {
                                                let alls = document.querySelector('#vaccine_classification').querySelectorAll('option')
                                                let test = form_data2[key]
                                                for (let i = 0; i < alls.length; i++) {
                                                    if (alls[i].innerHTML == test) {
                                                        alls[i].selected = true
                                                        form_data2.vaccine_classification = alls[i].text
                                                        console.log(222)
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
                                                                                                                                                    

            if (vaccine_inventory_id !== '') {
                async function axios_get_3() {
                    const {data: rese} = await axios.get(BaseUrl + '/api/vaccine_inventory/get_obj', {
                        params: {
                                vaccine_inventory_id: vaccine_inventory_id
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
                                if (key == 'vaccine_classification') {
                                    let alls = document.querySelector('#vaccine_classification').querySelectorAll('option')
                                    let test = data[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        if (alls[i].innerHTML == test) {
                                            alls[i].selected = true
                                            form_data2.vaccine_classification = alls[i].text
                                            console.log(222)
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }
                        
            
            
            
            
            
            
            
                                    if (user_group === '管理员') {
                            $("#picture_box").show()
                        } else {
                            if ($check_field('set', 'picture') || $check_field('get', 'picture')){
                                $("#picture_box").show()
                            }else {
                                $("#picture_box").hide()
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
                            $("#suitable_for_people_box").show()
                        } else {
                            if ($check_field('set', 'suitable_for_people') || $check_field('get', 'suitable_for_people')){
                                $("#suitable_for_people_box").show()
                            }else {
                                $("#suitable_for_people_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#inventory_quantity_box").show()
                        } else {
                            if ($check_field('set', 'inventory_quantity') || $check_field('get', 'inventory_quantity')){
                                $("#inventory_quantity_box").show()
                            }else {
                                $("#inventory_quantity_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#manufacturer_box").show()
                        } else {
                            if ($check_field('set', 'manufacturer') || $check_field('get', 'manufacturer')){
                                $("#manufacturer_box").show()
                            }else {
                                $("#manufacturer_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#date_of_manufacture_box").show()
                        } else {
                            if ($check_field('set', 'date_of_manufacture') || $check_field('get', 'date_of_manufacture')){
                                $("#date_of_manufacture_box").show()
                            }else {
                                $("#date_of_manufacture_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#expiration_date_box").show()
                        } else {
                            if ($check_field('set', 'expiration_date') || $check_field('get', 'expiration_date')){
                                $("#expiration_date_box").show()
                            }else {
                                $("#expiration_date_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#storage_location_box").show()
                        } else {
                            if ($check_field('set', 'storage_location') || $check_field('get', 'storage_location')){
                                $("#storage_location_box").show()
                            }else {
                                $("#storage_location_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#storage_requirements_box").show()
                        } else {
                            if ($check_field('set', 'storage_requirements') || $check_field('get', 'storage_requirements')){
                                $("#storage_requirements_box").show()
                            }else {
                                $("#storage_requirements_box").hide()
                            }
                        }
                    
                    // Array.prototype.slice.call(document.getElementsByTagName('input')).map(i => i.disabled = true)
                    // Array.prototype.slice.call(document.getElementsByTagName('select')).map(i => i.disabled = true)
                    // Array.prototype.slice.call(document.getElementsByTagName('textarea')).map(i => i.disabled = true)
                                
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'picture')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'picture'))) {
                            }else {
                                $("#picture").attr("disabled", true);
                                $("#picture > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                vaccine_no.value = form_data2.vaccine_no
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'vaccine_no')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'vaccine_no'))) {
                            }else {
                                $("#vaccine_no").attr("disabled", true);
                                $("#vaccine_no > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                vaccine_name.value = form_data2.vaccine_name
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'vaccine_name')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'vaccine_name'))) {
                            }else {
                                $("#vaccine_name").attr("disabled", true);
                                $("#vaccine_name > input[name='file']").attr('disabled', true);
                            }
                                    
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'vaccine_classification')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'vaccine_classification'))) {
                            }else {
                                $("#vaccine_classification").attr("disabled", true);
                                $("#vaccine_classification > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                suitable_for_people.value = form_data2.suitable_for_people
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'suitable_for_people')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'suitable_for_people'))) {
                            }else {
                                $("#suitable_for_people").attr("disabled", true);
                                $("#suitable_for_people > input[name='file']").attr('disabled', true);
                            }
                                                            //数字
                                inventory_quantity.value = form_data2.inventory_quantity
                            //数字
                            
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'inventory_quantity')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'inventory_quantity'))) {
                            }else {
                                $("#inventory_quantity").attr("disabled", true);
                                $("#inventory_quantity > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                manufacturer.value = form_data2.manufacturer
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'manufacturer')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'manufacturer'))) {
                            }else {
                                $("#manufacturer").attr("disabled", true);
                                $("#manufacturer > input[name='file']").attr('disabled', true);
                            }
                                    
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'date_of_manufacture')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'date_of_manufacture'))) {
                            }else {
                                $("#date_of_manufacture").attr("disabled", true);
                                $("#date_of_manufacture > input[name='file']").attr('disabled', true);
                            }
                                    
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'expiration_date')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'expiration_date'))) {
                            }else {
                                $("#expiration_date").attr("disabled", true);
                                $("#expiration_date > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                storage_location.value = form_data2.storage_location
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'storage_location')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'storage_location'))) {
                            }else {
                                $("#storage_location").attr("disabled", true);
                                $("#storage_location > input[name='file']").attr('disabled', true);
                            }
                                                                //多文本
                                storage_requirements.value = form_data2.storage_requirements
                            //多文本
                        
                                if (user_group === '管理员' || (form_data2['vaccine_inventory_id'] && $check_field('set', 'storage_requirements')) || (!form_data2['vaccine_inventory_id'] && $check_field('add', 'storage_requirements'))) {
                            }else {
                                $("#storage_requirements").attr("disabled", true);
                                $("#storage_requirements > input[name='file']").attr('disabled', true);
                            }
                                                                                            let picture_img = document.querySelector("#picture_img")
                                    picture_img.src = fullUrl(BaseUrl,form_data2.picture)
                                                                                                                                                                                                                                                                            date_of_manufacture.value = layui.util.toDateString(form_data2.date_of_manufacture, "yyyy-MM-dd")
                                                                            expiration_date.value = layui.util.toDateString(form_data2.expiration_date, "yyyy-MM-dd")
                                                                                                                            layui.form.render("select");
                }
                axios_get_3()
            }


            

            submit.onclick = async function () {
                try {
                                                                                                //文本
                            form_data2.vaccine_no = vaccine_no.value
                            //文本
                                                                    //文本
                            form_data2.vaccine_name = vaccine_name.value
                            //文本
                                                                                        //文本
                            form_data2.suitable_for_people = suitable_for_people.value
                            //文本
                                                                    //数字
                            form_data2.inventory_quantity = Number(inventory_quantity.value)
                            //数字
                                                                        //文本
                            form_data2.manufacturer = manufacturer.value
                            //文本
                                                                form_data2.date_of_manufacture = layui.util.toDateString(form_data2.date_of_manufacture, "yyyy-MM-dd")
                                                                                form_data2.expiration_date = layui.util.toDateString(form_data2.expiration_date, "yyyy-MM-dd")
                                                                                    //文本
                            form_data2.storage_location = storage_location.value
                            //文本
                                                                    //多文本
                            form_data2.storage_requirements = storage_requirements.value
                            //多文本
                                            } catch (err) {
                    console.log(err)
                }
                            
            
                let customize_field = []
                                            customize_field.push({
                            "field_name": "图片",
                            "field_value": form_data2.picture,
                            "type": "image"
                        });
                                                customize_field.push({"field_name": "疫苗编号", "field_value": form_data2.vaccine_no});
                                                customize_field.push({"field_name": "疫苗名称", "field_value": form_data2.vaccine_name});
                                                customize_field.push({"field_name": "疫苗分类", "field_value": form_data2.vaccine_classification});
                                                customize_field.push({"field_name": "适合人群", "field_value": form_data2.suitable_for_people});
                                                customize_field.push({"field_name": "库存数量", "field_value": form_data2.inventory_quantity});
                                                customize_field.push({"field_name": "生产厂家", "field_value": form_data2.manufacturer});
                                                customize_field.push({
                            "field_name": "生产日期",
                            "field_value": form_data2.date_of_manufacture,
                            "type": "date"
                        });
                                                customize_field.push({
                            "field_name": "失效日期",
                            "field_value": form_data2.expiration_date,
                            "type": "date"
                        });
                                                customize_field.push({"field_name": "存放位置", "field_value": form_data2.storage_location});
                                                customize_field.push({"field_name": "存放要求", "field_value": form_data2.storage_requirements});
                    
    
                if (vaccine_inventory_id == '') {
                                        console.log("新增/Add")
                    const {data: res} = await axios.post(BaseUrl + '/api/vaccine_inventory/add?',
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
                    
                    const {data: res} = await axios.post(BaseUrl + '/api/vaccine_inventory/set?vaccine_inventory_id=' + vaccine_inventory_id,
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
