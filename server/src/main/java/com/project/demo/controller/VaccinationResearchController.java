package com.project.demo.controller;

import com.project.demo.entity.VaccinationResearch;
import com.project.demo.service.VaccinationResearchService;
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
 * 接种调研：(VaccinationResearch)表控制层
 *
 */
@RestController
@RequestMapping("/vaccination_research")
public class VaccinationResearchController extends BaseController<VaccinationResearch, VaccinationResearchService> {

    /**
     * 接种调研对象
     */
    @Autowired
    public VaccinationResearchController(VaccinationResearchService service) {
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
