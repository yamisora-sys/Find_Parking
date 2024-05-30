package com.yamisora.superwebne.config;
import jakarta.validation.MessageInterpolator;

public class MessageInterpolatorImp implements MessageInterpolator {
    private final MessageInterpolator defaultMessageInterpolator;

    public MessageInterpolatorImp(MessageInterpolator defaultMessageInterpolator) {
        this.defaultMessageInterpolator = defaultMessageInterpolator;
    }

    @Override
    public String interpolate(String messageTemplate, Context context) {
        messageTemplate = messageTemplate.toUpperCase();
        return defaultMessageInterpolator.interpolate(messageTemplate, context);
    }

    @Override
    public String interpolate(String messageTemplate, Context context, java.util.Locale locale) {
        messageTemplate = messageTemplate.toUpperCase();
        return defaultMessageInterpolator.interpolate(messageTemplate, context, locale);
    }
}
