package com.project.demo.controller;

import com.project.demo.entity.VaccineClassification;
import com.project.demo.service.VaccineClassificationService;
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
 * 疫苗分类：(VaccineClassification)表控制层
 *
 */
@RestController
@RequestMapping("/vaccine_classification")
public class VaccineClassificationController extends BaseController<VaccineClassification, VaccineClassificationService> {

    /**
     * 疫苗分类对象
     */
    @Autowired
    public VaccineClassificationController(VaccineClassificationService service) {
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
