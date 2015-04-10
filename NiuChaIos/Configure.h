//
//  Configure.h
//  NiuChaIos
//
//  Created by SharkCome on 15/3/26.
//  Copyright (c) 2015年 gujianjun. All rights reserved.
//

#ifndef NiuChaIos_Configure_h
#define NiuChaIos_Configure_h

typedef enum {
    RiCheng_New,
    RiCheng_Look
}RiChengType;

typedef enum {
    Partner_Customer,
    Partner_Connection
}PartnerType;

#define DEBUG  1

#define Screen_Equal(width,height)   CGSizeEqualToSize(CGSizeMake(width,height), [[UIScreen mainScreen] currentMode].size)

#define Iphone4         Screen_Equal(640,960)
#define Iphone5         Screen_Equal(640,1136)
#define Iphone6         Screen_Equal(750,1334)
#define Iphone6p        Screen_Equal(1242,2208)

#define isIphone        [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone ? YES:NO
#define isIpd           [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ? YES:NO

#define  Screen_Width  [UIScreen mainScreen].bounds.size.width
#define  Screen_Height [UIScreen mainScreen].bounds.size.height

#define  App_View_Height  self.view.frame.size.height
#define  App_View_Width   self.view.frame.size.width

#define UIColorFromHex(s)   [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0  blue:((s & 0xFF))/255.0  alpha:1.0]
#define UIColor_System_Silver  UIColorFromHex(0xf2f2f2)
#define UIColor_Fenge_Line     UIColorFromHex(0xc8c7cc)

#define Lock(s)   @synchronized(s)


#define Font_Size_12  12
#define Font_Size_14  14
#define Font_Size_16  16
#define Font_Size_10  10
#define Font(s)       [UIFont systemFontOfSize:(s)]

#define SKString(parm,...)  [NSString stringWithFormat:@"%d,%@,%@,\n%@",__LINE__,[[NSString stringWithUTF8String:__FILE__]lastPathComponent],NSStringFromSelector(_cmd),[NSString stringWithFormat:for,##__VA_ARGS__]]

#if DEBUG
#define SKLog(parm,...)     NSLog((@"[%s]\n %s\n [line:%d]\n" parm), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define SKLog(parm,...)     {}
#endif

#endif
