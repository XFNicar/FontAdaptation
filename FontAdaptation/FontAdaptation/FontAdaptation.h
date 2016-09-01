//
//  FontAdaptation.h
//  FontAdaptation
//
//  Created by 谢飞 on 16/9/1.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef  enum IPHONE_DeviceType{
    
    DeviceType_IPHONE_4_OR_LESS = 0,
    DeviceType_IPHONE_5         = 1 << 0,
    DeviceType_IPHONE_6         = 1 << 1,
    DeviceType_IPHONE_6P        = 1 << 2
}IPHPNE_DeviceType;

#define FONT_INCREMENT_IPH6P  ( 2)
#define FONT_INCREMENT_IPH5   (-2)
#define FONT_INCREMENT_IPH4   (-2)

#define SCREEN_SIZE             [UIScreen mainScreen].bounds.size
#define SCREEN_SCALE            [UIScreen mainScreen].scale
#define SCREEN_WIDTH            SCREEN_SIZE.width
#define SCREEN_HEIGHT           SCREEN_SIZE.height
#define SCREEN_MAX_LENGTH       MAX(SCREEN_WIDTH, SCREEN_HEIGHT)
#define SCREEN_MIN_LENGTH       MAX(SCREEN_WIDTH, SCREEN_HEIGHT)

#define SCREEN_HEIGHT_SCALE     SCREEN_HEIGHT / 736
#define SCREEN_WIDTH_SCALE      SCREEN_WIDTH  / 414

#define Font(fontsize)  [UIFont systemFontOfSize:FontSize(fontsize)]
#define FontSize(size)  getFontSizeForScreenByScal(size)



IPHPNE_DeviceType iPhone_deviceType();

UIFont * getFontForScreenSizeByScal(CGFloat iph6Font);

CGFloat getFontSizeForScreenByScal(CGFloat iph6Font);

CGFloat getFontForScreenSize(CGFloat iph6p,CGFloat iph6,CGFloat iph5, CGFloat iph4);