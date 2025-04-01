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
                
                                        <label class="layui-form-label">预约编号</label>
                                                            <div class="layui-input-block block">
                                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                                           class="layui-input">
                                </div>
                                                                            <label class="layui-form-label">疫苗名称</label>
                                                            <div class="layui-input-block block">
                                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                                           class="layui-input">
                                </div>
                                                                                                                            <label class="layui-form-label">接种异常</label>
                                                            <div class="layui-input-block block">
                                                                        <select name="abnormal_vaccination" lay-filter="abnormal_vaccination" id="abnormal_vaccination">
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
        <table class="layui-hide" id="vaccination_research" lay-filter="vaccination_research"></table>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">

                


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
        let url = BaseUrl + '/api/vaccination_research/get_list?like=0'

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

        if (user_group == "管理员" || $check_action('/vaccination_research/table', 'del') || $check_action('/vaccination_research/view', 'del')) {
            deletes.style.display = "block"
        }
        if (user_group == "管理员" || $check_action('/vaccination_research/table', 'add') || $check_action('/vaccination_research/view', 'add')) {
            add.style.display = "block"
        }
        if (user_group == "管理员" || $check_action('/vaccination_research/view', 'get') || $check_action('/vaccination_research/view', 'set')) {
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
                if (o.path === "/vaccination_research/table") {
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

                    if (user_group != "管理员") {
                                    sqlwhere = "(";
                                                                if (user_group == "普通用户") {
                                sqlwhere += "user_name = " + use_id + " or ";
                            }
                                                            if (user_group == "接种人员") {
                                sqlwhere += "vaccination_staff = " + use_id + " or ";
                            }
                                                    if (sqlwhere.length > 1) {
                        sqlwhere = sqlwhere.substr(0, sqlwhere.length - 4);
                        sqlwhere += ")";
                        data_data = {size: 10, orderby: 'create_time desc', sqlwhere: sqlwhere}
                    }else {
                        sqlwhere = null
                    }
                            }
        
        let token = sessionStorage.token || null
    table.render({
        elem: '#vaccination_research'
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
                field: 'appointment_number', width: 180, title: '预约编号', sort: true
                                                                                
            }
                                , {
                field: 'vaccine_name', width: 180, title: '疫苗名称', sort: true
                                                                                
            }
                                , {
                field: 'vaccine_classification', width: 180, title: '疫苗分类', sort: true
                                                                                
            }
                                , {
                field: 'user_name', width: 180, title: '用户姓名', sort: true
                                                                                                    , templet:

                            function (d) {
                                let nickname = ""
                                let username = ""
                                $.ajax({
                                    url: BaseUrl + "/api/user/get_list",
                                    type: "get",
                                    async: false,
                                    data: {
                                        user_group: "普通用户"
                                    },
                                    success: function (data) {
                                        if (data && typeof data === 'string'){
                                            data = JSON.parse(data);
                                        }
                                        if (data.result) {
                                            for (let index = 0; index < data.result.list.length; index++) {
                                                if (d.user_name === data.result.list[index].user_id) {
                                                    nickname = data.result.list[index].nickname
                                                    username = data.result.list[index].username
                                                }
                                            }
                                        }
                                    }
                                });
                                return '<span>' + username + '-' + nickname + '</span>'
                            }
                
            }
                                , {
                field: 'telephone', width: 180, title: '电话', sort: true
                                                                                
            }
                                , {
                field: 'vaccination_staff', width: 180, title: '接种工作人员', sort: true
                                                                                                    , templet:

                            function (d) {
                                let nickname = ""
                                let username = ""
                                $.ajax({
                                    url: BaseUrl + "/api/user/get_list",
                                    type: "get",
                                    async: false,
                                    data: {
                                        user_group: "接种人员"
                                    },
                                    success: function (data) {
                                        if (data && typeof data === 'string'){
                                            data = JSON.parse(data);
                                        }
                                        if (data.result) {
                                            for (let index = 0; index < data.result.list.length; index++) {
                                                if (d.vaccination_staff === data.result.list[index].user_id) {
                                                    nickname = data.result.list[index].nickname
                                                    username = data.result.list[index].username
                                                }
                                            }
                                        }
                                    }
                                });
                                return '<span>' + username + '-' + nickname + '</span>'
                            }
                
            }
                                , {
                field: 'abnormal_vaccination', width: 180, title: '接种异常', sort: true
                                                                                
            }
                                , {
                field: 'post_vaccination_reaction', width: 180, title: '接种后反应', sort: true
                                                                                
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

                                    if (user_group === '管理员' || $check_field('get', 'appointment_number', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='appointment_number']").css('display', 'none');
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
                                        if (user_group === '管理员' || $check_field('get', 'user_name', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='user_name']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'telephone', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='telephone']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'vaccination_staff', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='vaccination_staff']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'abnormal_vaccination', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='abnormal_vaccination']").css('display', 'none');
                    }
                                        if (user_group === '管理员' || $check_field('get', 'post_vaccination_reaction', path1)) {
                        // console.log("显示")
                    } else {
                        $("[data-field='post_vaccination_reaction']").css('display', 'none');
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

            
            if (user_group == "管理员" || $check_pay('/vaccination_research/table')) {
                for (var i = 0; i < res.result.list.length; i++) {
                    res.result.list[i].check_pay = true
                }
            }
            if (user_group == "管理员" || $check_action('/vaccination_research/view', 'set') || $check_action('/vaccination_research/view', 'get')) {
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


        table.on('tool(vaccination_research)', function (obj) {
            var data = obj.data;
        if (obj.event === 'detail')
        {

                            window.location.href = "./view_add.jsp?" + data.vaccination_research_id;
                    }
            


        });

        //下拉框

        
                                                local("user_name", "普通用户", "user_name")
                let user_name
                layui.form.on('select(user_name)', function (data) {
                    request['user_name'] = Number(data.elem[data.elem.selectedIndex].value);
                });
                                            local("vaccination_staff", "接种人员", "vaccination_staff")
                let vaccination_staff
                layui.form.on('select(vaccination_staff)', function (data) {
                    request['vaccination_staff'] = Number(data.elem[data.elem.selectedIndex].value);
                });
                                                                                                // 接种异常选项列表
                let abnormal_vaccination_data = ['正常','有异常'];
                                async function abnormal_vaccination() {
                    var abnormal_vaccination = document.querySelector("#abnormal_vaccination")
                    var op1 = document.createElement("option");
                        abnormal_vaccination.appendChild(op1)
                    // 收集数据 长度
                    var count
                    // 收集数据 数组
                    var arr = []
                    count = abnormal_vaccination_data.length
                    arr = abnormal_vaccination_data
                    for (var i = 0; i < arr.length; i++) {
                        // 创建节点
                        var op = document.createElement("option");
                        // 给节点赋值
                        op.innerHTML = arr[i]
                        op.value = arr[i]
                        // 新增/Add节点
                            abnormal_vaccination.appendChild(op)
                        layui.form.render("select");
                    }
                }

                layui.form.on('select(abnormal_vaccination)', function (data) {
                    request.abnormal_vaccination = data.elem[data.elem.selectedIndex].text;
                })
                    abnormal_vaccination()
                    
        // 请求参数：
        let request = {
            like: 0, size: 10, page: 1,
                                                                                    'appointment_number': '',
                                                                                                            'vaccine_name': '',
                                                                                                                                                                                                                            'abnormal_vaccination': '',
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
        fun('vaccination_research', BaseUrl + '/api/vaccination_research/del', 'vaccination_research_id', request, resetName, resetSelect        )

    
    })
</script>

</html>
