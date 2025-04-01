package com.project.demo.controller;

import com.project.demo.entity.WarehousingRecords;
import com.project.demo.service.WarehousingRecordsService;
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
 * 入库记录：(WarehousingRecords)表控制层
 *
 */
@RestController
@RequestMapping("/warehousing_records")
public class WarehousingRecordsController extends BaseController<WarehousingRecords, WarehousingRecordsService> {

    /**
     * 入库记录对象
     */
    @Autowired
    public WarehousingRecordsController(WarehousingRecordsService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(warehousing_records_id) AS max FROM "+"warehousing_records";
        Integer max = service.selectBaseCount(sql);
        sql = "UPDATE `vaccine_inventory` INNER JOIN `warehousing_records` ON vaccine_inventory.vaccine_no=warehousing_records.vaccine_no SET vaccine_inventory.inventory_quantity= vaccine_inventory.inventory_quantity + warehousing_records.receipt_quantity WHERE warehousing_records.warehousing_records_id="+max;
        service.updateBaseSql(sql);
        return success(1);
    }

}
