<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- table 页面 -->
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
<div class="section1">
    <!-- 内容主体区域 -->
    <div class="manu" style="padding: 15px;">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                
                                                    <label class="layui-form-label">疫苗编号</label>
                                                            <div class="layui-input-block block">
                                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                                           class="layui-input">
                                </div>
                                                                            <label class="layui-form-label">疫苗名称</label>
                                                            <div class="layui-input-block block">
                                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                                           class="layui-input">
                                </div>
                                                                            <label class="layui-form-label">疫苗分类</label>
                                                            <div class="layui-input-block block">
                                                                        <select name="interest" lay-filter="vaccine_classification" id="vaccine_classification">
                                        <option value=""></option>
                                    </select>
                                                                    </div>

                                                                                                                                        </div>
        </form>
    </div>
    <div class="buts">
                    <button type="button" class="layui-btn layui-btn-normal" id="inquire">查询/Query</button>
            <button type="button" class="layui-btn layui-btn-normal" id="reset">重置/Reset</button>
                <button type="button" class="layui-btn layui-btn-normal" id="delete" style="display: none">删除/Del</button>
        <a href="./view_add.jsp" type="button" class="layui-btn layui-btn-normal" target="main_self_frame" id="add"
           style="display: none">新增/Add</a>

            </div>


    <div class="table">
        <table class="layui-hide" id="vaccine_inventory" lay-filter="vaccine_inventory"></table>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">

                                            <!--跨表按钮-->
                                                    {{# if(d.add_warehousing_records>0){ }}
                            <button class="layui-btn layui-btn-sm" lay-event="warehousing_records">入库</button>
                            {{# } }}
                                                    {{# if(d.add_outbound_records>0){ }}
                            <button class="layui-btn layui-btn-sm" lay-event="outbound_records">出库</button>
                            {{# } }}
                            


                {{# if(d.detail_flag){ }}
                <button class="layui-btn layui-btn-sm" lay-event="detail">详情/Details</button>
                {{# } }}
            </div>
        </script>
    </div>
</div>
</body>
<script src="../../layui/layui.js"></script>
<script src="../../js/index.js"></script>
<script src="../../js/base.js"></script>
<script src="../../js/axios.min.js"></script>
    <script>

    var BaseUrl = baseUrl()
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
                , layer = layui.layer
                , util = layui.util
                , table = layui.table
                , $ = layui.$;

        let personInfo = JSON.parse(sessionStorage.personInfo)
        let user_group = personInfo.user_group
        let use_id = personInfo.user_id
        let url = BaseUrl + '/api/vaccine_inventory/get_list?like=0'

        let deletes = document.querySelector('#delete')
        let add = document.querySelector('#add')
        let sqlwhere
        let data_data = {size: 10, orderby: 'create_time desc'}
        let detail_flag = false;

        // 获取路径权限
        async function get_list() {
            let {data: ren} = await axios.get(BaseUrl + '/api/auth/get_list', {
                params: {
                    user_group: personInfo.user_group
                }
            })
        }

        get_list()


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

        if (user_group == "管理员" || $check_action('/vaccine_inventory/table', 'del') || $check_action('/vaccine_inventory/view', 'del')) {
            deletes.style.display = "block"
        }
        if (user_group == "管理员" || $check_action('/vaccine_inventory/table', 'add') || $check_action('/vaccine_inventory/view', 'add')) {
            add.style.display = "block"
        }
        if (user_group == "管理员" || $check_action('/vaccine_inventory/view', 'get') || $check_action('/vaccine_inventory/view', 'set')) {
            detail_flag = true;
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

        var path1

        function getpath() {
            var list_data = JSON.parse(sessionStorage.list_data)
            for (var i = 0; i < list_data.length; i++) {
                var o = list_data[i];
                if (o.path === "/vaccine_inventory/table") {
                    console.log(o.path);
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
         * 是否有显示或操作支付的权限
         * @param {String} path 路径
         */
        function $check_pay(path) {
            let o = $get_power(path);
            if (o){
                let option = JSON.parse(o.option);
                if (option.pay)
                    return true
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

        function $check_option(path,op) {
            var o = $get_power(path);
            if (o){
                var option = JSON.parse(o.option);
                if (option[op])
                    return true
            }
            return false;
        }

        
        let token = sessionStorage.token || null
    table.render({
        elem: '#vaccine_inventory'
        , toolbar: true
        , url: url
        , headers: {
            'x-auth-token': token,
            'Content-Type': 'application/json'
        }
        , page: {
            layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']
            //,curr: 5
            , groups: 1
            , first: false
            , last: false
        }
        , cols: [[
                    {type: 'checkbox', fixed: 'left'}
        
                    , {
                field: 'picture', width: 180, title: '图片', sort: true
                                    , templet: function (d) {
                        return "<div><img src=" + fullUrl(BaseUrl,d.picture) + "></div>"
                    }
                                                                                
            }
                                , {
                field: 'vaccine_no', width: 180, title: '疫苗编号', sort: true
                                                                                
            }
                                , {
                field: 'vaccine_name', width: 180, title: '疫苗名称', sort: true
                                                                                
            }
                                , {
                field: 'vaccine_classification', width: 180, title: '疫苗分类', sort: true
                                                                                
            }
                                , {
                field: 'suitable_for_people', width: 180, title: '适合人群', sort: true
                                                                                
            }
                                , {
                field: 'inventory_quantity', width: 180, title: '库存数量', sort: true
                                                                                
            }
                                , {
                field: 'manufacturer', width: 180, title: '生产厂家', sort: true
                                                                                
            }
                                , {
                field: 'date_of_manufacture', width: 180, title: '生产日期', sort: true
                                                    , templet: "<div>{{layui.util.toDateString(d.date_of_manufacture, 'yyyy-MM-dd')}}</div>"
                                                                
            }
                                , {
                field: 'expiration_date', width: 180, title: '失效日期', sort: true
                                                    , templet: "<div>{{layui.util.toDateString(d.expiration_date, 'yyyy-MM-dd')}}</div>"
                                                                
            }
                                , {
                field: 'storage_location', width: 180, title: '存放位置', sort: true
                                                                                
            }
                                , {
                field: 'storage_requirements', width: 180, title: '存放要求', sort: true
                                                                                
            }
            


    ,
        {
            field: 'create_time',
                    width
        :
            '20%',
                    title
        :
            '新增时间',
                    sort
        :
            true,
                    templet
        :
            "<div>{{layui.util.toDateString(d.create_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"
        }
    ,
        {
            field: 'update_time',
                    width
        :
            '20%',
                    title
        :
            '更新时间',
                    sort
        :
            true,
                    templet
        :
            "<div>{{layui.util.toDateString(d.update_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"
        }
        



        ,
            {
                field: 'operate',
                        title
            :
                '操作',
                        sort
            :
                true,
                        width
            :
                '20%',
                        fixed
            :
                'right',
                        toolbar
            :
                "#toolbarDemo"
            }
            ]]

    ,
        done: function (res, curr, count) { // 表格渲染完成之后的回调
            if (res.count == null) { // 无数据时直接返回了
                return;
            }

                                    if (user_group === '管理员' || $check_field('get', 'picture', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='picture']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'vaccine_no', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='vaccine_no']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'vaccine_name', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='vaccine_name']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'vaccine_classification', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='vaccine_classification']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'suitable_for_people', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='suitable_for_people']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'inventory_quantity', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='inventory_quantity']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'manufacturer', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='manufacturer']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'date_of_manufacture', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='date_of_manufacture']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'expiration_date', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='expiration_date']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'storage_location', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='storage_location']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'storage_requirements', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='storage_requirements']").css('display', 'none');
                    }
                



            // 重新渲染
        }
    ,
        page: true,
                request
    :
        {
            limitName: 'size'
        }
    ,
        response: {
            statusName: 'code', //规定返回/Back的状态码字段为code
                    statusCode
        :
            200 //规定成功的状态码为200
        }
    ,
        parseData: function (res) {

                                    <!--跨表按钮-->
                                            if (user_group == "管理员" || $check_action('/warehousing_records/table', 'add') || $check_action('/warehousing_records/view', 'add')) {
                            for (var i = 0; i < res.result.list.length; i++) {
                                res.result.list[i].add_warehousing_records = 1
                            }
                        }
                                            if (user_group == "管理员" || $check_action('/outbound_records/table', 'add') || $check_action('/outbound_records/view', 'add')) {
                            for (var i = 0; i < res.result.list.length; i++) {
                                res.result.list[i].add_outbound_records = 1
                            }
                        }
                        
            if (user_group == "管理员" || $check_pay('/vaccine_inventory/table')) {
                for (var i = 0; i < res.result.list.length; i++) {
                    res.result.list[i].check_pay = true
                }
            }
            if (user_group == "管理员" || $check_action('/vaccine_inventory/view', 'set') || $check_action('/vaccine_inventory/view', 'get')) {
                for (var i = 0; i < res.result.list.length; i++) {
                    res.result.list[i].detail_flag = detail_flag
                }
            }
            return {
                "code": 200,
                "msg": "",
                "count": res.result.count,
                "data": res.result.list
            }
        }
    ,
        where: data_data
    })
        ;


        table.on('tool(vaccine_inventory)', function (obj) {
            var data = obj.data;
        if (obj.event === 'detail')
        {

                            window.location.href = "./view_add.jsp?" + data.vaccine_inventory_id;
                    }
            
                                else if (obj.event === 'warehousing_records'){
                        sessionStorage.setItem('data', JSON.stringify(data))
                        window.location.href = "../warehousing_records/view_add.jsp?"
                    }
                                        else if (obj.event === 'outbound_records'){
                        sessionStorage.setItem('data', JSON.stringify(data))
                        window.location.href = "../outbound_records/view_add.jsp?"
                    }
                        

        });

        //下拉框

        
                                            async function initss(url, id, ff) {
                    // 拿到单选框的父级节点
                    var select = document.querySelector("#"+id)
                    var op1 = document.createElement('option')
                    select.appendChild(op1)
                    // 收集数据 长度
                    var count
                    // 收集数据 数组
                    var arr = []
                    let {data: res} = await axios.get(url)
                    count = res.result.count
                    arr = res.result.list
                    for (var i = 0; i < arr.length; i++) {
                        // 创建节点
                        var op = document.createElement('option')
                        // 给节点赋值
                        op.innerHTML = arr[i][ff]
                        op.value = arr[i][ff]
                        // 新增/Add节点
                        select.appendChild(op)
                        layui.form.render('select')
                    }
                }

                initss(BaseUrl + '/api/vaccine_classification/get_list?', "vaccine_classification", "vaccine_classification")

                let vaccine_classification
                layui.form.on('select(vaccine_classification)', function (data) {
                    request['vaccine_classification'] = data.elem[data.elem.selectedIndex].text
                });
                                                                                                                    // 疫苗分类选项列表
                let vaccine_classification_data = [""];
                                                                        
        // 请求参数：
        let request = {
            like: 0, size: 10, page: 1,
                                                                                                                'vaccine_no': '',
                                                                                                            'vaccine_name': '',
                                                                                                            'vaccine_classification': '',
                                                                                                                                                                                                                                                            }

        if (user_group != "管理员") {
            request['orderby'] = 'create_time desc'
            if (sqlwhere){
                request['sqlwhere'] = sqlwhere
            }
        }

        // 重置/Reset参数
        let resetName = data_data

        // 下拉框的重置/Reset参数
        let resetSelect = []
        //下拉框重置/Reset参数
        fun('vaccine_inventory', BaseUrl + '/api/vaccine_inventory/del', 'vaccine_inventory_id', request, resetName, resetSelect        )

    
    })
</script>

</html>
