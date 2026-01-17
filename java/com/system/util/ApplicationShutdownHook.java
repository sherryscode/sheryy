package com.system.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

@Component
public class ApplicationShutdownHook implements ServletContextListener, ApplicationContextAware {

    private static ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ApplicationShutdownHook.applicationContext = applicationContext;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("[系统启动] 应用程序启动完成");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("[系统关闭] 应用程序正在关闭，开始清理资源...");

        try {
            // 清理Spring的RequestContextHolder
            RequestContextHolder.resetRequestAttributes();

            // 关闭C3P0数据源
            if (applicationContext != null && applicationContext.containsBean("dataSource")) {
                ComboPooledDataSource dataSource = applicationContext.getBean(ComboPooledDataSource.class);
                if (dataSource != null) {
                    dataSource.close();
                    System.out.println("[系统关闭] C3P0数据源已关闭");
                }
            }
        } catch (Exception e) {
            System.err.println("[系统关闭] 清理资源时出错: " + e.getMessage());
        }

        System.out.println("[系统关闭] 应用程序关闭完成");
    }
}