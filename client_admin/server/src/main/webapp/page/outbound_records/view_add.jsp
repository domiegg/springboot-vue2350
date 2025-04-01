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
                                                                                                                                        <div class="layui-form-item" id="suitable_for_people_box">
                                            <label class="layui-form-label">适合人群</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入适合人群"
                                                       class="layui-input" id="suitable_for_people">
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
                                            <label class="layui-form-label">生产日期</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入生产日期"
                                                       class="layui-input" id="date_of_manufacture">
                                            </div>
                                        </div>
                                                                                                                                        <div class="layui-form-item" id="expiration_date_box">
                                            <label class="layui-form-label">失效日期</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入失效日期"
                                                       class="layui-input" id="expiration_date">
                                            </div>
                                        </div>
                                                                                                                    <div class="layui-form-item" id="outbound_quantity_box">
                                        <label class="layui-form-label">出库数量</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="num" class="layui-input num" id="outbound_quantity">
                                        </div>
                                    </div>
                                                                                                                        <div class="layui-form-item" id="warehousing_purpose_box">
                                            <label class="layui-form-label">出库用途</label>
                                            <div class="layui-input-block">
                                                <input type="text" name="title" lay-verify="title" autocomplete="off"
                                                       placeholder="请输入出库用途"
                                                       class="layui-input" id="warehousing_purpose">
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
    let outbound_records_id = location.search.substring(1)
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
        // if (   user_group == "管理员" ||$check_action('/outbound_records/view', 'add') || $check_action('/outbound_records/view', 'set')) {
        //    submit.style.display = "block"
        // }
        // style="display: none"

        
            let field = "outbound_records_id";
            let url_add = "outbound_records";
            let url_set = "outbound_records";
            let url_get_obj = "outbound_records";
            let url_upload = "outbound_records"
            let query = {
                "outbound_records_id": 0,
            }

            let form_data2 = {
                                        "vaccine_no":  '', // 疫苗编号
                            "vaccine_name":  '', // 疫苗名称
                            "vaccine_classification":  '', // 疫苗分类
                            "suitable_for_people":  '', // 适合人群
                            "manufacturer":  '', // 生产厂家
                            "date_of_manufacture":  '', // 生产日期
                            "expiration_date":  '', // 失效日期
                            "outbound_quantity":  0, // 出库数量
                            "warehousing_purpose":  '', // 出库用途
                                    "outbound_records_id": 0, // ID
                                            }

            layui.layedit.set({
      uploadImage: {
        url: BaseUrl + '/api/outbound_records/upload?' //接口url
        , type: 'post' //默认post
      }
    });


            var path1

            function getpath() {
                var list_data = JSON.parse(sessionStorage.list_data)
                for (var i = 0; i < list_data.length; i++) {
                    var o = list_data[i];
                    if (o.path === "/outbound_records/table") {
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
                var o = $get_power("/outbound_records/view");
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
                    $("#outbound_quantity_box").show()
                } else {
                    if ($check_field('add', 'outbound_quantity')){
                        $("#outbound_quantity_box").show()
                    }else {
                        $("#outbound_quantity_box").hide()
                    }
                }
                            if (user_group === '管理员') {
                    $("#warehousing_purpose_box").show()
                } else {
                    if ($check_field('add', 'warehousing_purpose')){
                        $("#warehousing_purpose_box").show()
                    }else {
                        $("#warehousing_purpose_box").hide()
                    }
                }
            
                                                                                                                                                                                                                                                                                                        
            
            
            
            
            
            
            
            
            
    
                                                                                                                                
                            
                            
                            
                            
                            
                            
                            
                            
                    
    
                    
                            
                            
                            
                            
                            
                            
                            
                            
                    
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
                    let suitable_for_people = document.querySelector("#suitable_for_people")
                        suitable_for_people.onkeyup = function (event) {
                        form_data2.suitable_for_people = event.target.value
                    }
                    //文本
                                                                                //文本
                    let manufacturer = document.querySelector("#manufacturer")
                        manufacturer.onkeyup = function (event) {
                        form_data2.manufacturer = event.target.value
                    }
                    //文本
                                                                                //文本
                    let date_of_manufacture = document.querySelector("#date_of_manufacture")
                        date_of_manufacture.onkeyup = function (event) {
                        form_data2.date_of_manufacture = event.target.value
                    }
                    //文本
                                                                                //文本
                    let expiration_date = document.querySelector("#expiration_date")
                        expiration_date.onkeyup = function (event) {
                        form_data2.expiration_date = event.target.value
                    }
                    //文本
                                                                                                //数字
                    let outbound_quantity = document.querySelector("#outbound_quantity")
                        outbound_quantity.onkeyup = function (event) {
                        form_data2.outbound_quantity = Number(event.target.value)
                    }
                    //数字
                                                                //文本
                    let warehousing_purpose = document.querySelector("#warehousing_purpose")
                        warehousing_purpose.onkeyup = function (event) {
                        form_data2.warehousing_purpose = event.target.value
                    }
                    //文本
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
                                        
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                                        }
                        }
                    })
                })
                sessionStorage.removeItem("data");
            }
                                                                                                                            

            if (outbound_records_id !== '') {
                async function axios_get_3() {
                    const {data: rese} = await axios.get(BaseUrl + '/api/outbound_records/get_obj', {
                        params: {
                                outbound_records_id: outbound_records_id
                        }, headers: {
                            'x-auth-token': token
                        }
                    })

                    let data = rese.result.obj
                    Object.keys(form_data2).forEach((key) => {
                        form_data2[key] = data[key];
                        $("#"+key).val(form_data2[key])
                    });

                    

            
            
            
            
            
            
            
            
            
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
                            $("#outbound_quantity_box").show()
                        } else {
                            if ($check_field('set', 'outbound_quantity') || $check_field('get', 'outbound_quantity')){
                                $("#outbound_quantity_box").show()
                            }else {
                                $("#outbound_quantity_box").hide()
                            }
                        }
                                            if (user_group === '管理员') {
                            $("#warehousing_purpose_box").show()
                        } else {
                            if ($check_field('set', 'warehousing_purpose') || $check_field('get', 'warehousing_purpose')){
                                $("#warehousing_purpose_box").show()
                            }else {
                                $("#warehousing_purpose_box").hide()
                            }
                        }
                    
                    // Array.prototype.slice.call(document.getElementsByTagName('input')).map(i => i.disabled = true)
                    // Array.prototype.slice.call(document.getElementsByTagName('select')).map(i => i.disabled = true)
                    // Array.prototype.slice.call(document.getElementsByTagName('textarea')).map(i => i.disabled = true)
                                                    //文本
                                vaccine_no.value = form_data2.vaccine_no
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'vaccine_no')) || (!form_data2['outbound_records_id'] && $check_field('add', 'vaccine_no'))) {
                            }else {
                                $("#vaccine_no").attr("disabled", true);
                                $("#vaccine_no > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                vaccine_name.value = form_data2.vaccine_name
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'vaccine_name')) || (!form_data2['outbound_records_id'] && $check_field('add', 'vaccine_name'))) {
                            }else {
                                $("#vaccine_name").attr("disabled", true);
                                $("#vaccine_name > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                vaccine_classification.value = form_data2.vaccine_classification
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'vaccine_classification')) || (!form_data2['outbound_records_id'] && $check_field('add', 'vaccine_classification'))) {
                            }else {
                                $("#vaccine_classification").attr("disabled", true);
                                $("#vaccine_classification > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                suitable_for_people.value = form_data2.suitable_for_people
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'suitable_for_people')) || (!form_data2['outbound_records_id'] && $check_field('add', 'suitable_for_people'))) {
                            }else {
                                $("#suitable_for_people").attr("disabled", true);
                                $("#suitable_for_people > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                manufacturer.value = form_data2.manufacturer
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'manufacturer')) || (!form_data2['outbound_records_id'] && $check_field('add', 'manufacturer'))) {
                            }else {
                                $("#manufacturer").attr("disabled", true);
                                $("#manufacturer > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                date_of_manufacture.value = form_data2.date_of_manufacture
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'date_of_manufacture')) || (!form_data2['outbound_records_id'] && $check_field('add', 'date_of_manufacture'))) {
                            }else {
                                $("#date_of_manufacture").attr("disabled", true);
                                $("#date_of_manufacture > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                expiration_date.value = form_data2.expiration_date
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'expiration_date')) || (!form_data2['outbound_records_id'] && $check_field('add', 'expiration_date'))) {
                            }else {
                                $("#expiration_date").attr("disabled", true);
                                $("#expiration_date > input[name='file']").attr('disabled', true);
                            }
                                                            //数字
                                outbound_quantity.value = form_data2.outbound_quantity
                            //数字
                            
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'outbound_quantity')) || (!form_data2['outbound_records_id'] && $check_field('add', 'outbound_quantity'))) {
                            }else {
                                $("#outbound_quantity").attr("disabled", true);
                                $("#outbound_quantity > input[name='file']").attr('disabled', true);
                            }
                                                        //文本
                                warehousing_purpose.value = form_data2.warehousing_purpose
                            //文本
                                
                                if (user_group === '管理员' || (form_data2['outbound_records_id'] && $check_field('set', 'warehousing_purpose')) || (!form_data2['outbound_records_id'] && $check_field('add', 'warehousing_purpose'))) {
                            }else {
                                $("#warehousing_purpose").attr("disabled", true);
                                $("#warehousing_purpose > input[name='file']").attr('disabled', true);
                            }
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
                            form_data2.vaccine_classification = vaccine_classification.value
                            //文本
                                                                    //文本
                            form_data2.suitable_for_people = suitable_for_people.value
                            //文本
                                                                    //文本
                            form_data2.manufacturer = manufacturer.value
                            //文本
                                                                    //文本
                            form_data2.date_of_manufacture = date_of_manufacture.value
                            //文本
                                                                    //文本
                            form_data2.expiration_date = expiration_date.value
                            //文本
                                                                    //数字
                            form_data2.outbound_quantity = Number(outbound_quantity.value)
                            //数字
                                                                        //文本
                            form_data2.warehousing_purpose = warehousing_purpose.value
                            //文本
                                    } catch (err) {
                    console.log(err)
                }
                            
            
                let customize_field = []
                                            customize_field.push({"field_name": "疫苗编号", "field_value": form_data2.vaccine_no});
                                                customize_field.push({"field_name": "疫苗名称", "field_value": form_data2.vaccine_name});
                                                customize_field.push({"field_name": "疫苗分类", "field_value": form_data2.vaccine_classification});
                                                customize_field.push({"field_name": "适合人群", "field_value": form_data2.suitable_for_people});
                                                customize_field.push({"field_name": "生产厂家", "field_value": form_data2.manufacturer});
                                                customize_field.push({"field_name": "生产日期", "field_value": form_data2.date_of_manufacture});
                                                customize_field.push({"field_name": "失效日期", "field_value": form_data2.expiration_date});
                                                customize_field.push({"field_name": "出库数量", "field_value": form_data2.outbound_quantity});
                                                customize_field.push({"field_name": "出库用途", "field_value": form_data2.warehousing_purpose});
                    
    
                if (outbound_records_id == '') {
                                        console.log("新增/Add")
                    const {data: res} = await axios.post(BaseUrl + '/api/outbound_records/add?',
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
                    
                    const {data: res} = await axios.post(BaseUrl + '/api/outbound_records/set?outbound_records_id=' + outbound_records_id,
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
