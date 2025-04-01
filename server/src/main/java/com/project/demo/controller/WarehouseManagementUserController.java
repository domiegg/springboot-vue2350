package com.project.demo.controller;

import com.project.demo.entity.WarehouseManagementUser;
import com.project.demo.service.WarehouseManagementUserService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;

/**
 * 仓管用户：(WarehouseManagementUser)表控制层
 *
 */
@RestController
@RequestMapping("/warehouse_management_user")
public class WarehouseManagementUserController extends BaseController<WarehouseManagementUser, WarehouseManagementUserService> {

    /**
     * 仓管用户对象
     */
    @Autowired
    public WarehouseManagementUserController(WarehouseManagementUserService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapwarehouse_management_personnel = new HashMap<>();
        mapwarehouse_management_personnel.put("warehouse_management_personnel",String.valueOf(paramMap.get("warehouse_management_personnel")));
        List listwarehouse_management_personnel = service.selectBaseList(service.select(mapwarehouse_management_personnel, new HashMap<>()));
        if (listwarehouse_management_personnel.size()>0){
            return error(30000, "字段仓管人员内容不能重复");
        }
        this.addMap(paramMap);
        return success(1);
    }

}
