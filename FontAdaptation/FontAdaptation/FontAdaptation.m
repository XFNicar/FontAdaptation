//
//  FontAdaptation.m
//  FontAdaptation
//
//  Created by 谢飞 on 16/9/1.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import "FontAdaptation.h"
#import <sys/utsname.h>

IPHPNE_DeviceType iPhone_deviceType() {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine
                                                encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone5,1"] || SCREEN_MAX_LENGTH == 568.0)
        return DeviceType_IPHONE_5;
    if ([deviceString isEqualToString:@"iPhone5,2"] || SCREEN_MAX_LENGTH == 568.0)
        return DeviceType_IPHONE_5;
    if ([deviceString isEqualToString:@"iPhone5,3"] || SCREEN_MAX_LENGTH == 568.0)
        return DeviceType_IPHONE_5;
    if ([deviceString isEqualToString:@"iPhone5,4"] || SCREEN_MAX_LENGTH == 568.0)
        return DeviceType_IPHONE_5;
    if ([deviceString isEqualToString:@"iPhone6,1"] || SCREEN_MAX_LENGTH == 568.0)
        return DeviceType_IPHONE_5;
    if ([deviceString isEqualToString:@"iPhone6,2"] || SCREEN_MAX_LENGTH == 568.0)
        return DeviceType_IPHONE_5;
    if ([deviceString isEqualToString:@"iPhone7,1"] || SCREEN_MAX_LENGTH == 736.0)
        return DeviceType_IPHONE_6P;
    if ([deviceString isEqualToString:@"iPhone7,2"] || SCREEN_MAX_LENGTH == 667.0)
        return DeviceType_IPHONE_6;
    if ([deviceString isEqualToString:@"iPhone8,1"] || SCREEN_MAX_LENGTH == 667.0)
        return DeviceType_IPHONE_6;
    if ([deviceString isEqualToString:@"iPhone8,2"] || SCREEN_MAX_LENGTH == 736.0)
        return DeviceType_IPHONE_6P;
    
    return DeviceType_IPHONE_4_OR_LESS;
}

/**
 通过确定iphone6(s)上的的字号，来确定其它设备上的字号
 默认iphone6plus的字号比iphone6(s)上的大一号
 iphone5/5s/se/4s/4 上的设备字号相对比iphone(s)上的字号只需要添加相应的增量即可
 */
//定好phone6的文字尺寸，剩下的都是递减量 返回font
UIFont * getFontForScreenSizeByScal(CGFloat iph6Font) {
    return [UIFont systemFontOfSize:getFontSizeForScreenByScal(iph6Font)];
}

//定好phone6的文字尺寸，剩下的都是递减量 返回font size
CGFloat getFontSizeForScreenByScal(CGFloat iph6Font) {
    return getFontForScreenSize(iph6Font + FONT_INCREMENT_IPH6P, iph6Font, iph6Font + FONT_INCREMENT_IPH5, iph6Font + FONT_INCREMENT_IPH4);
}

//依次为：iphone6p,iphone6,iphone5(5s,se),iphone4(s)
CGFloat getFontForScreenSize(CGFloat iph6p,CGFloat iph6,CGFloat iph5, CGFloat iph4) {
    
    CGFloat font = 0;
    switch (iPhone_deviceType()) {
        case DeviceType_IPHONE_4_OR_LESS:
            font = iph4;
            break;
        case DeviceType_IPHONE_5:
            font = iph5;
            break;
        case DeviceType_IPHONE_6:
            font = iph6;
            break;
        case DeviceType_IPHONE_6P:
            font = iph6p;
            break;
    }
    
    return font > 0 ? font : 7;
}