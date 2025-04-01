package com.project.demo.controller;

import com.project.demo.entity.AppointmentRecord;
import com.project.demo.service.AppointmentRecordService;
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
 * 预约记录：(AppointmentRecord)表控制层
 *
 */
@RestController
@RequestMapping("/appointment_record")
public class AppointmentRecordController extends BaseController<AppointmentRecord, AppointmentRecordService> {

    /**
     * 预约记录对象
     */
    @Autowired
    public AppointmentRecordController(AppointmentRecordService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(appointment_record_id) AS max FROM "+"appointment_record";
        Integer max = service.selectBaseCount(sql);
        sql = ("SELECT count(*) count FROM `vaccine_appointment` INNER JOIN `appointment_record` ON vaccine_appointment.vaccine_no=appointment_record.vaccine_no WHERE vaccine_appointment.bookable_quantity < appointment_record.number_of_appointments AND appointment_record.appointment_record_id="+max).replaceAll("&#60;","<");
        Integer count = service.selectBaseCount(sql);
        if(count>0){
            sql = "delete from "+"appointment_record"+" WHERE "+"appointment_record_id"+" ="+max;
            service.deleteBaseSql(sql);
            return error(30000,"预约已满！");
        }
        sql = "UPDATE `vaccine_appointment` INNER JOIN `appointment_record` ON vaccine_appointment.vaccine_no=appointment_record.vaccine_no SET vaccine_appointment.bookable_quantity= vaccine_appointment.bookable_quantity - appointment_record.number_of_appointments WHERE appointment_record.appointment_record_id="+max;
        service.updateBaseSql(sql);
        return success(1);
    }

}
