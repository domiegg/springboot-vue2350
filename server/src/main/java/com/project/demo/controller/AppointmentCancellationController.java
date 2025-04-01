package com.project.demo.controller;

import com.project.demo.entity.AppointmentCancellation;
import com.project.demo.service.AppointmentCancellationService;
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
 * 预约取消：(AppointmentCancellation)表控制层
 *
 */
@RestController
@RequestMapping("/appointment_cancellation")
public class AppointmentCancellationController extends BaseController<AppointmentCancellation, AppointmentCancellationService> {

    /**
     * 预约取消对象
     */
    @Autowired
    public AppointmentCancellationController(AppointmentCancellationService service) {
        setService(service);
    }


    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        String sql = "SELECT MAX(appointment_cancellation_id) AS max FROM "+"appointment_cancellation";
        Integer max = service.selectBaseCount(sql);
        sql = "UPDATE `vaccine_appointment` INNER JOIN `appointment_cancellation` ON vaccine_appointment.vaccine_no=appointment_cancellation.vaccine_no SET vaccine_appointment.bookable_quantity= vaccine_appointment.bookable_quantity + appointment_cancellation.cancel_quantity WHERE appointment_cancellation.appointment_cancellation_id="+max;
        service.updateBaseSql(sql);
        return success(1);
    }

}
