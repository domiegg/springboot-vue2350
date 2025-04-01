package com.project.demo.controller;

import com.project.demo.entity.VaccinationPersonnel;
import com.project.demo.service.VaccinationPersonnelService;
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
 * 接种人员：(VaccinationPersonnel)表控制层
 *
 */
@RestController
@RequestMapping("/vaccination_personnel")
public class VaccinationPersonnelController extends BaseController<VaccinationPersonnel, VaccinationPersonnelService> {

    /**
     * 接种人员对象
     */
    @Autowired
    public VaccinationPersonnelController(VaccinationPersonnelService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        Map<String, String> mapvaccination_staff = new HashMap<>();
        mapvaccination_staff.put("vaccination_staff",String.valueOf(paramMap.get("vaccination_staff")));
        List listvaccination_staff = service.selectBaseList(service.select(mapvaccination_staff, new HashMap<>()));
        if (listvaccination_staff.size()>0){
            return error(30000, "字段接种工作人员内容不能重复");
        }
        this.addMap(paramMap);
        return success(1);
    }

}
