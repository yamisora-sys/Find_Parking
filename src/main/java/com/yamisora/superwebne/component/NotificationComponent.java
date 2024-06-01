package com.yamisora.superwebne.component;

import org.springframework.web.servlet.ModelAndView;


public class NotificationComponent {
    private ModelAndView modelAndView;

    public String TYPE_SUCCESS = "success";
    public String TYPE_ERROR = "error";
    public String TYPE_WARNING = "warning";
    public String TYPE_INFO = "info";

    public NotificationComponent(){
        modelAndView = new ModelAndView();
    }


    public void addNotification(String type, String message){
        modelAndView.addObject("notification", message);
        modelAndView.addObject("notificationType", type);
    }

    public void addObject(String key, Object object){
        modelAndView.addObject(key, object);
    }
    
    public void setViewName(String viewName){
        modelAndView.setViewName(viewName);
    }

    public ModelAndView getModelAndView(){
        return modelAndView;
    }
}


