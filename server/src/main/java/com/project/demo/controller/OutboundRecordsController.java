package com.project.demo.controller;

import com.project.demo.entity.OutboundRecords;
import com.project.demo.service.OutboundRecordsService;
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
 * 出库记录：(OutboundRecords)表控制层
 *
 */
@RestController
@RequestMapping("/outbound_records")
public class OutboundRecordsController extends BaseController<OutboundRecords, OutboundRecordsService> {

    /**
     * 出库记录对象
     */
    @Autowired
    public OutboundRecordsController(OutboundRecordsService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(outbound_records_id) AS max FROM "+"outbound_records";
        Integer max = service.selectBaseCount(sql);
        sql = "UPDATE `vaccine_inventory` INNER JOIN `outbound_records` ON vaccine_inventory.vaccine_no=outbound_records.vaccine_no SET vaccine_inventory.inventory_quantity= vaccine_inventory.inventory_quantity - outbound_records.outbound_quantity WHERE outbound_records.outbound_records_id="+max;
        service.updateBaseSql(sql);
        return success(1);
    }

}
