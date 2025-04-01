package com.project.demo.controller;

import com.project.demo.entity.VaccinationRecords;
import com.project.demo.service.VaccinationRecordsService;
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
 * 接种记录：(VaccinationRecords)表控制层
 *
 */
@RestController
@RequestMapping("/vaccination_records")
public class VaccinationRecordsController extends BaseController<VaccinationRecords, VaccinationRecordsService> {

    /**
     * 接种记录对象
     */
    @Autowired
    public VaccinationRecordsController(VaccinationRecordsService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
