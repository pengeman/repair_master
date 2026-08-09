package com.ruoyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.jdbc.autoconfigure.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(scanBasePackages = {"com.ruoyi", "com.peng","org.peng"}, exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("  ____                          _                  \n" +
" |  _ \\    __ _   _ __    ___  | |_    __ _   _ __ \n" +
" | |_) |  / _` | | '_ \\  / __| | __|  / _` | | '__|\n" +
" |  __/  | (_| | | | | | \\__ \\ | |_  | (_| | | |   \n" +
" |_|      \\__,_| |_| |_| |___/  \\__|  \\__,_| |_|   "
        );
    }
}