package com.yamisora.superwebne.controller.parking;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import com.yamisora.superwebne.component.CustomModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import com.yamisora.superwebne.repository.ParkingOrderRepository;
import com.yamisora.superwebne.model.ParkingOrder;
import java.util.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.ResponseEntity;
@Controller
@RequestMapping("/parking/order")
public class ParkingOrderController {

}
