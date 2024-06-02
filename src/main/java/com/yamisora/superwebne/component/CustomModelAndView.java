package com.yamisora.superwebne.component;

import org.springframework.web.servlet.ModelAndView;


public class CustomModelAndView extends ModelAndView {

    public static String TYPE_SUCCESS = "success";
    public static String TYPE_ERROR = "error";
    public static String TYPE_WARNING = "warning";
    public static String TYPE_INFO = "info";

    public void addNotification(String type, String message){
        this.addObject("notification", type);
        this.addObject("notificationMessage", message);
    }
}


