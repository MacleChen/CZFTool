//
//  tools.h
//  250
//
//  Created by 周强 on 15/12/24.
//  Copyright © 2015年 com.jointsky.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


// 获取屏幕的尺寸
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width        // 宽
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height      // 高

#define App_RootCtr  [UIApplication sharedApplication].keyWindow.rootViewController

// 导航栏的高度    建议：导航栏中的按钮图片的大小一般为26  26@2x   26@3x
#define NAVIGATION_AND_STATUS_HEIGHT (44+20)                        // 导航栏和状态栏的高度
#define TOOL_BAR_HEIGHT 49                                          // 工具栏的高度
#define ITEM_IMAGE_CGSZE CGSizeMake(26, 26)                         // tabBar和navBar上的图标的标准大小

#define STATUS_BAR_HEIGHT 20                                        // 状态栏的高度
#define NAVIGATION_BAR_HEIGHT 44                                    // 导航栏的高度


/**
 *  使用（0-255）方式的RGB设置设置颜色
 *
 *  @param r 0-255
 *  @param g 0-255
 *  @param b 0-255
 *  @param a 0.0-1.0
 *
 *  @return UIColor
 */
#define UIColorRGBA_Selft(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


/**
 *  16进制的方式设置颜色（eg. 0xff1122）
 *
 *  @param rgbValue 16进制色值
 *
 *  @return UIColor
 */

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


// 日期的标准格式
#define DATE_STANDARD_FORMATTER   @"yyyy-MM-dd HH:mm:ss"  //yyyy-MM-dd HH:mm:ss

// 获取本地沙盒的documents路径
#define DOCUMENTS_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


/**
 *  定义打印信息
 */
#ifdef DEBUG            // 调试阶段

//#define MYLOG(...) NSLog(__VA_ARGS__)
#define MYLOG(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#define MYLog(...) NSLog(__VA_ARGS__)

#else

#define MYLOG(...) // 非调试阶段不打印log
#endif


@interface tools : NSObject

/**
 *  mapCode
 */
@property (nonatomic, strong) NSMutableDictionary *cityDic; //mapCode


/**
 *  给图片中写入文字
 *
 *  @param image    写入文字前的图片
 *  @param str      字符串
 *  @param fontSize 字体大小
 *
 *  @return 写入文字后的图片
 */

+ (UIImage *)createShareImage:(UIImage *)image :(NSString *)str :(CGFloat )fontSize;


/**
 *  向图片中写文字之后转成image
 *
 *  @param image    没有加入文字的图片
 *  @param strA      拍照时间/地址第一段
 *  @param strB      地址第二段
 *  @param strC      PM2.5数值
 *  @param strD      (PM2.5)
 *  @param fontSize 字体大小
 *
 *  @return 加入文字后的图片
 */
+ (UIImage *)createShareImaga:(UIImage *)image :(NSString *)strA :(NSString *)strB :(NSString *)strC :(NSString *)strD :(CGFloat )fontSize;


/**
 *  图片上下拼接
 *
 *  @param topImage    上面图片
 *  @param bottomImage 下面图片
 *
 *  @return 合并后图片
 */

+ (UIImage *) combineSX:(UIImage*)topImage :(UIImage*)bottomImage;


/**
 *  图片左右拼接
 *
 *  @param leftImage  左边图片
 *  @param rightImage 右边图片
 *
 *  @return 合并图片
 */

+ (UIImage *) combineZY:(UIImage*)leftImage :(UIImage*)rightImage;


/**
 *  获取本地时间
 *
 *  @return 本地时间字符串  yyyy-MM-dd HH:mm:ss
 */

+ (NSString *)getLocalTime;


/**
 *  获取城市
 *
 *  @return 当前城市
 */

+ (NSString *)getLocalCity;


/**
 *  获取详细地址
 *
 *  @return 地址字符串
 */

+ (NSString *)getThoroughfare;


/**
 *  参数 经纬度
 */

+ (NSString *)getLatitude;


/**
 *  参数 经纬度
 */

+ (NSString *)getLongitude;


/**
 *  获取PhotoID
 *
 *  @return PhotoID
 */

+ (NSString *)getPhotoID;


/**
 *  获取SuggestID
 *
 *  @return SuggestID
 */

+ (NSString *)getSuggestID;


/**
 *  获取时间戳 - 转字符串
 */

+ (NSString *)getTimestamp;


/**
 *  将数字的字符串转成随机的pm2.5
 *
 *  @param string 源字符串
 *
 *  @return 目标字符串
 */

+ (NSString *)randomStringWithString:(NSString *) string;//随机数


/**
 *  图片去雾的方法
 *
 *  @param image      要处理的图片
 *  @param light      亮度    -1：表示不调节
 *  @param contrast   对比度  -1：表示不调节
 *  @param saturation 饱和度  -1：表示不调节
 *
 *  @return 目标图片
 */

+ (UIImage *)dealHBSImage:(UIImage *)image andLight:(double)light andContrast:(double)contrast andsaturation:(double)saturation;


/**
 *  对目标图片指定大小进行压缩
 *
 *  @param image 目标图片
 *  @param size  指定的大小
 *
 *  @return 返回压缩后的图片
 */

+ (UIImage *)scalToSize:(UIImage *)image size:(CGSize)size;//裁剪图片


/**
 *  等比例缩小图片
 *
 *  @param image 源图片
 *  @param scale 缩放系数
 *
 *  @return 目标图片
 */

+(UIImage*)imageCompressWithSimple:(UIImage*)image scale:(float)scale;


/**
 根据最长的一边，等比例缩小图片
 
 @param maxwidthOrHeight 最长的一边的像素值
 @param image 要处理的图片对象
 @return 处理后的图片
 */
+ (UIImage *)scalToMaxWidthOrHeight:(int)maxwidthOrHeight andImage:(UIImage *)image;




/**
 该函数用来修正 imageOrientation 值

 @param aImage aImage
 @return returnImage
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;//修正图片信息



/**
 *  保存本地城市列表
 *
 *  @param array 城市列表的数组
 */

+ (void)setUserFollowCityWithArray:(NSMutableArray *)array;//存-- 用户关注城市


/**
 *  获取城市列表
 *
 *  @return 返回城市列表数据
 */

+ (NSMutableArray *)userFollowCity;//取--用户关注城市


/**
 *  根据图片的的高度或者宽度，等比例求取与之相对应的宽度或高度
 *
 *  @param sourceImg 源图片
 *  @param width     目标宽度  0:表示根据高度固定，宽度是可变的
 *  @param height    目标高度  0:表示根据宽度固定，高度是可变的
 *
 *  @return 与之相对应的目标宽度或者高度
 */

+ (float)GetImageWithOrHeightWithImage:(UIImage *)sourceImg andWidht:(float)width andHeight:(float)height;


/**
 *  隐藏控件，效果为是否是半透明不可点击
 *
 *  @param hiden 是否隐藏
 *  @param sView 要被设置的view
 */

+ (void)HideViewHalfAlphaNoActionWithYesOrNo:(BOOL)hiden andView:(id)sView;


/**
 *  根据一个过去的时间与现在时间做对比，获取间隔多少分钟
 *
 *  @param oldDate 过去时间
 *
 *  @return 差值多少秒
 */

+ (long)GetMinuteByOldDateBetweenNowDate:(NSDate *)oldDate;


/**
 *  NSString转换成NSDate，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */

+ (NSDate *)dateFromString:(NSString *)dateString andFormatterString:(NSString *)strFormater;


/**
 *  获取时间字符串，从当前时间开始算起，正数表示向后推算几天，负数表示向前推算几天
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherDateFromNowDays:(NSInteger)dayValue andFormatterString:(NSString *)strFormater;

/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"  忽略时区的转换
 */
+ (NSString *)stringIgnoreZoneFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater;

/**
 *  根据日期获取对应的星期几
 *
 *  @param strInputDate 输入日期字符串
 *
 *  @return 星期几
 */
+ (NSString*)weekdayStringFromDate:(NSString *)strInputDate;



/**
 获取日期的年月日时分秒毫秒周
 
 @param date 日期
 @return 年月日时分秒毫秒周数组
 */
+ (NSArray *)getDateYearMonthDayWithDate:(NSDate *)date;


/**
 格式化为可读的时间显示字符串
 
 @param date 时间
 @return 可读时间字符串
 */
+ (NSString *)stringNormalReadWithDate:(NSDate *)date;


/**
 *  图片旋转的方法
 *
 *  @param image 源图片
 *  @param angle 旋转角度  上北方向为 0度起始点
 *
 *  @return 目标图片
 */
+ (UIImage *)imageTurnSpinDirection:(UIImage *)image andTurnAngle:(int)angle;


/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)stringFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater;


/**
 *  获取时间字符串，从某个日期算起，正数表示向后推算几小时，负数表示向前推算几小时
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherHourFromNowHours:(NSInteger)dayValue andFormatterString:(NSString *)strFormater andDate:(NSDate *)date;

/**
 *  可读格式化存储大小
 *
 *  @param size 存储大小   单位：B
 *
 *  @return B, K, M, G 为单位
 */
+ (NSString *)fileSizeWithInterge:(NSInteger)size;


/**
 *  验证是否为手机号
 *
 *  @param phoneNum 要验证的手机号码
 *
 *  @return 是否为手机号
 */

+(BOOL)checkPhoneNumInputWithPhoneNum:(NSString *)phoneNum;


/**
 验证邮箱
 
 @param email email
 @return 是否是邮箱
 */
+ (BOOL)checkEmailInputWithEmail:(NSString *)email;


/**
 * 字母、数字、中文正则判断（不包括空格）
 */
+ (BOOL)isInputRuleNotBlank:(NSString *)str;


/**
 * 字母、数字、中文正则判断（包括空格）【注意3】
 */
+ (BOOL)isInputRuleAndBlank:(NSString *)str;


/**
 *  获得 kMaxLength长度的字符
 */
+ (NSString *)getSubCharString:(NSString*)string andMaxLength:(int)mexLength;

/**
 *  获得 kMaxLength长度的字
 */
+ (NSString *)getSubWordString:(NSString*)string andMaxLength:(int)mexLength;

/**
 *  过滤字符串中的emoji
 */
+ (NSString *)disable_emoji:(NSString *)text;


/*
 *第二种方法，利用Emoji表情最终会被编码成Unicode，因此，
 *只要知道Emoji表情的Unicode编码的范围，
 *就可以判断用户是否输入了Emoji表情。
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 *  校验字符串防止nil字符串操作
 *
 *  @param stringText 字符串
 *
 *  @return 校验后的字符串
 */
+ (NSString *)verifyString:(id)stringText;


/**
 *  删除view中所有的subview
 *
 *  @param view  要删除的子view的view
 */
+ (void)removeSubviews:(UIView *)view;


/**
 *  给UILabel设置行间距和字间距
 */

+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font andLineSpaceing:(float)lineSpace;


/**
 *  计算UILabel的高度(带有行间距的情况)
 */
+ (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width andLineSpaceing:(float)lineSpace;


/*
 *  自定排版view中subview
 */
+ (UIView *)autoComposingSubViewWithView:(UIView *)fatherView andGapX:(float)gapx;



/**
 截取圆形图片的方法
 
 @param image 源图片
 @param inset 边距
 
 @return 目标图片
 */
+(UIImage*)circleImage:(UIImage*) image withParam:(CGFloat) inset;



/**
 由颜色值生成图片的方法
 
 @param color 颜色值
 @return 图片对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 格式化数据发布时间
 
 @param oldDate oldDate
 */
+ (NSString *)formattingTimeCanEasyRead:(NSDate *)oldDate;



/**
 去除自定中空的字符值

 @param obj OBj
 @return deal OBJ
 */
+ (id) processDictionaryIsNSNull:(id)obj;


/**
 将View转成图片
 
 @param view view
 @return 图片
 */
+ (UIImage *)imageWithView:(UIView *)view;


/**
 获取label 的宽度
 
 @param label Label
 @return 宽度
 */
+ (CGFloat)getLabelWidthWithLabel:(UILabel *)label;



/**
 根据字符串中后缀的格式类型返回对应的本地文件类型图标
 
 @param checkString 判断字符串
 @return 本地文件类型的图标地址
 */
+ (NSString *)getLocalImageWithCheckString:(NSString *)checkString;


/**
 过滤字符串中HTML标签的方法
 
 @param html 含HTML标签的字符串
 @return    过滤后的字符串
 */
+ (NSString *)flattenHTML:(NSString *)html;



/**
 判断本地是否存在该文件
 
 @param fileName 文件名称或者路径
 @return 存在的文件路径，不存在则返回nil
 */
+ (NSString *)checkFilePathExistWithFileName:(NSString *)fileName;

@end
