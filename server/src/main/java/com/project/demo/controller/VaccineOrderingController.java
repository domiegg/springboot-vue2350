package com.project.demo.controller;

import com.project.demo.entity.VaccineOrdering;
import com.project.demo.service.VaccineOrderingService;
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
 * 疫苗订购：(VaccineOrdering)表控制层
 *
 */
@RestController
@RequestMapping("/vaccine_ordering")
public class VaccineOrderingController extends BaseController<VaccineOrdering, VaccineOrderingService> {

    /**
     * 疫苗订购对象
     */
    @Autowired
    public VaccineOrderingController(VaccineOrderingService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapvaccine_no = new HashMap<>();
        mapvaccine_no.put("vaccine_no",String.valueOf(paramMap.get("vaccine_no")));
        List listvaccine_no = service.selectBaseList(service.select(mapvaccine_no, new HashMap<>()));
        if (listvaccine_no.size()>0){
            return error(30000, "字段疫苗编号内容不能重复");
        }
        this.addMap(paramMap);
        return success(1);
    }

}
