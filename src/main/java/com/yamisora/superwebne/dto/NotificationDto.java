package com.yamisora.superwebne.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NotificationDto {

    public static final String TYPE_INFO = "info";
    public static final String TYPE_ERROR = "error";
    public static final String TYPE_SUCCESS = "success";
    public static final String TYPE_WARNING = "warning";

    private String type;
    private String message;
    
    public NotificationDto() {}
}
