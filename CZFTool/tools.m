//
//  tools.m
//  250
//
//  Created by 周强 on 15/12/24.
//  Copyright © 2015年 com.jointsky.www. All rights reserved.
//

#import "tools.h"


@interface tools ()

@end


@implementation tools


/**
 *  保存本地城市列表
 *
 *  @param array 城市列表的数组
 */

+ (void)setUserFollowCityWithArray:(NSMutableArray *)array{
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"followCity"];
}


/**
 *  获取城市列表
 *
 *  @return 返回城市列表数据
 */

+ (NSArray *)userFollowCity{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"followCity"];
}



/**
 *  给图片中写入文字
 *
 *  @param image    写入文字前的图片
 *  @param str      字符串
 *  @param fontSize 字体大小
 *
 *  @return 写入文字后的图片
 */

+ (UIImage *)createShareImage:(UIImage *)image :(NSString *)str :(CGFloat )fontSize{
    
    CGSize sizes= CGSizeMake (image. size . width , image. size . height ); // 画布大小
    
    UIGraphicsBeginImageContextWithOptions (sizes, NO , 0.0 );
    
    [image drawAtPoint : CGPointMake ( 0 , 0 )];
    
    // 获得一个位图图形上下文
    
    CGContextRef context= UIGraphicsGetCurrentContext ();
    
    CGContextDrawPath (context, kCGPathStroke );
    
    // 画
    
    [str drawAtPoint : CGPointMake ( 0 , image. size . height * 0.65 ) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : fontSize ], NSForegroundColorAttributeName :[ UIColor whiteColor ] } ];
    
    //画自己想画的内容。。。。。
    
    // 返回绘制的新图形
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return newImage;
}


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
+ (UIImage *)createShareImaga:(UIImage *)image :(NSString *)strA :(NSString *)strB :(NSString *)strC :(NSString *)strD :(CGFloat )fontSize{
    
    CGSize sizes= CGSizeMake (image. size . width , image. size . height ); // 画布大小
    
    UIGraphicsBeginImageContextWithOptions (sizes, NO , 0.0 );
    
    [image drawAtPoint : CGPointMake ( 0 , 0 )];
    
    // 获得一个位图图形上下文
    
    CGContextRef context= UIGraphicsGetCurrentContext ();
    
    CGContextDrawPath (context, kCGPathStroke );
    
    // 画
    
    [strA drawAtPoint : CGPointMake ( 2 , image. size . height * 0.83 ) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 14 ], NSForegroundColorAttributeName :[ UIColor whiteColor ] } ];
    
    [strB drawAtPoint : CGPointMake ( 2 , image. size . height * 0.89 ) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 14 ], NSForegroundColorAttributeName :[ UIColor whiteColor ] } ];
    
    
    [strC drawAtPoint : CGPointMake ( 2 , image. size . height * 0.53 ) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : fontSize ], NSForegroundColorAttributeName :[ UIColor whiteColor ] } ];
    [strD drawAtPoint : CGPointMake ( strC.length*37 , image. size . height * 0.695 ) withAttributes : @{ NSFontAttributeName :[ UIFont fontWithName : @"Arial-BoldMT" size : 12 ], NSForegroundColorAttributeName :[ UIColor whiteColor ] } ];
    
    //画自己想画的内容。。。。。
    
    // 返回绘制的新图形
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return newImage;
}


/**
 *  图片上下拼接
 *
 *  @param topImage    上面图片
 *  @param bottomImage 下面图片
 *
 *  @return 合并后图片
 */

+ (UIImage *) combineSX:(UIImage*)topImage :(UIImage*)bottomImage {

    CGSize size = CGSizeMake(SCREEN_WIDTH*2, (SCREEN_HEIGHT - NAVIGATION_AND_STATUS_HEIGHT)*2);
    UIGraphicsBeginImageContext(size);
    
    [topImage drawInRect:CGRectMake(0, 0, size.width, size.height/2)];
    
    [bottomImage drawInRect:CGRectMake(0, size.height/2, size.width, size.height/2)];
    
    UIImage *togetherImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return togetherImage;
}


/**
 *  图片左右拼接
 *
 *  @param leftImage  左边图片
 *  @param rightImage 右边图片
 *
 *  @return 合并图片
 */

+ (UIImage *) combineZY:(UIImage*)leftImage :(UIImage*)rightImage {
    
    CGSize size = CGSizeMake(SCREEN_WIDTH*2, (SCREEN_HEIGHT - NAVIGATION_AND_STATUS_HEIGHT)/2 *2);
    UIGraphicsBeginImageContext(size);
    // 左图片
    if (leftImage.size.width >= leftImage.size.height) {
        float imgNewLeftHeight = [tools GetImageWithOrHeightWithImage:leftImage andWidht:size.width/2 andHeight:0.0];
        
        [leftImage drawInRect:CGRectMake(0, (size.height - imgNewLeftHeight)/2, size.width/2, imgNewLeftHeight)];
    } else {
        float imgNewLeftWidth = [tools GetImageWithOrHeightWithImage:leftImage andWidht:0.0 andHeight:size.height];
        
        [leftImage drawInRect:CGRectMake(0, 0, imgNewLeftWidth, size.height)];
    }
    
    // 右图片
    if (rightImage.size.width >= rightImage.size.height) {
        float imgNewRightHeight = [tools GetImageWithOrHeightWithImage:rightImage andWidht:size.width/2 andHeight:0.0];
        
        [rightImage drawInRect:CGRectMake(size.width/2, (size.height - imgNewRightHeight)/2, size.width/2, imgNewRightHeight)];
    } else {
        float imgNewRightWidth = [tools GetImageWithOrHeightWithImage:rightImage andWidht:0.0 andHeight:size.height];
        
        [rightImage drawInRect:CGRectMake(size.width/2, 0, imgNewRightWidth, size.height)];
    }
    
    
    
    UIImage *togetherImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return togetherImage;
}


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

+ (UIImage *)dealHBSImage:(UIImage *)image andLight:(double)light andContrast:(double)contrast andsaturation:(double)saturation {
    //0.倒入image
    CIImage *ciImage = [[CIImage alloc] initWithImage:image];
    
    //1.创建出filter滤镜
    CIFilter *filterControls = [CIFilter filterWithName:@"CIColorControls"];
    [filterControls setValue:ciImage
                      forKey:kCIInputImageKey];
    [filterControls setDefaults];           // 0.f  1.05f  2.f
    
    if (-1 != light) {
        [filterControls setValue:@(light) forKey:@"inputBrightness"];       //亮度
    }
    if (-1 != contrast) {
        [filterControls setValue:@(contrast) forKey:@"inputContrast"];      //对比度
    }
    if (-1 != saturation) {
        [filterControls setValue:@(saturation) forKey:@"inputSaturation"];  //饱和度
    }
    
    CIImage *outImage = [filterControls valueForKey:kCIOutputImageKey];
    CIFilter *filterTone = [CIFilter filterWithName:@"CISepiaTone"];
    [filterTone setValue:outImage
                  forKey:kCIInputImageKey];
    [filterTone setDefaults];
    [filterTone setValue:@(0.1f)
                  forKey:kCIInputIntensityKey];
    
    CIImage *outputImage = [filterTone valueForKey:kCIOutputImageKey];
    
    //2.用CIContext将滤镜中的图片渲染出来
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outImage extent]];
    
    //3.导出图片
    
    UIImage *showImage = [UIImage imageWithCGImage:cgImage];
        //self.uploadImage_1 = showImage;
    CGImageRelease(cgImage);
    return showImage;

    
    //4.加载
    //[_dealImage setImage:showImage];
    
//    //添加处理后图片对比按钮显示
//    _contrastBtn.hidden = NO;
//    //原图隐藏，展示处理后照片
//    _originalImage.hidden = YES;
}



/**
 *  获取时间戳 - 转字符串
 */

+ (NSString *)getTimestamp{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    NSString *timestamp = [NSString stringWithFormat:@"%.f",timeInterval];
    return timestamp;
}


/**
 *  获取PhotoID
 *
 *  @return PhotoID
 */

+ (NSString *)getPhotoID {
    NSString *identifier = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    NSString *photoID = [identifier stringByAppendingString:[NSString stringWithFormat:@"%.f",timeInterval]];
    return photoID;
}


/**
 *  获取SuggestID
 *
 *  @return SuggestID
 */

+ (NSString *)getSuggestID {
    NSString *identifier = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    NSString *suggestID = @"SUGGEST";
    
    suggestID = [suggestID stringByAppendingString:[identifier stringByAppendingString:[NSString stringWithFormat:@"%.f",timeInterval]]];

    return suggestID;
}


/**
 *  获取本地时间
 *
 *  @return 本地时间字符串  yyyy-MM-dd HH:mm:ss
 */

+ (NSString *)getLocalTime{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *localTime = [formatter stringFromDate:date];
    return localTime;
}

/**
 *  参数 经纬度
 */

+ (NSString *)getLatitude{
    
    NSString *latitude = [NSString stringWithFormat:@"%.1f",[[NSUserDefaults standardUserDefaults]doubleForKey:@"latitude"]];
    
    if (latitude) {
        return latitude;
    }else{
        return @"0";
    }
    
}


/**
 *  参数 经纬度
 */

+ (NSString *)getLongitude{
    NSString *longitude = [NSString stringWithFormat:@"%.1f",[[NSUserDefaults standardUserDefaults]doubleForKey:@"longitude"]];
    if (longitude) {
        return longitude;
    }else{
        return @"0";
    }
}




/**
 *  获取城市
 *
 *  @return 当前城市
 */

+ (NSString *)getLocalCity{
    NSString *resultStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"locality"]; //stringByReplacingOccurrencesOfString:@"市" withString:@""];
    MYLOG(@"_______%@",resultStr);
    return resultStr;
}

/**
 *  获取详细地址
 *
 *  @return 地址字符串
 */

+ (NSString *)getThoroughfare{
    
//    [[NSUserDefaults standardUserDefaults] objectForKey:@"locality"],
    NSString * str = [NSString stringWithFormat:@"%@%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"subLocality"],[[NSUserDefaults standardUserDefaults] objectForKey:@"thoroughfare"]];
    
    MYLOG(@"getThoroughfare ：%@",str);
    if ([str hasPrefix:@"(null)"]) {
        return @"未获得详细地点";
    }else{
        return str;
    }
}



/**
 *  将数字的字符串转成随机的pm2.5
 *
 *  @param string 源字符串
 *
 *  @return 目标字符串
 */

+ (NSString *)randomStringWithString:(NSString *) string{
    
    int pm2_5 = [string intValue];
    
    if (pm2_5 < 20) {
        int i = arc4random() % 4 - 2;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 30){
        int i = arc4random() % 10 - 5;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if (pm2_5< 40){
        int i = arc4random() % 12 - 6;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 60){
        int i = arc4random() % 16 - 8;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 70){
        int i = arc4random() % 16 - 8;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else if(pm2_5 < 80){
        int i = arc4random() % 18 - 9;
        return [self formats:[NSString stringWithFormat:@"%d",pm2_5 + i]];
    }else {
        int i = arc4random() % 20 - 10;
        return [NSString stringWithFormat:@"%d",pm2_5 + i] ;
        
    }
}


+ (NSString *)formats:(NSString *)obj {
    
    NSRange foundObj=[obj rangeOfString:@"-" options:NSCaseInsensitiveSearch];
    
    if (foundObj.length > 0) {
        NSLog(@"%@", [obj substringFromIndex:1]);
        return [obj substringFromIndex:1];
    }else {
        return obj;
    }
}



/**
 *  生成具有位置，pm2.5，时间的view
 *
 *  @return view
 */

- (UIView *)effectView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT /1.5, SCREEN_WIDTH , SCREEN_HEIGHT - ( SCREEN_HEIGHT /1.5))];
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.cornerRadius = 30;
    view.layer.opacity = 0.6;
    view.tag = 9999;
    
    
    UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, view.bounds.size.height - 90, SCREEN_WIDTH, 20)];
    addressLabel.text = [tools getThoroughfare];
    addressLabel.font = [UIFont systemFontOfSize:13];
    
    
    UILabel *PMlabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 25, SCREEN_WIDTH , 40)];
    PMlabel.font = [UIFont systemFontOfSize:50];
    PMlabel.backgroundColor = [UIColor lightGrayColor];
    PMlabel.layer.cornerRadius = 10;
    if ([addressLabel.text isEqualToString:@"未获得详细地点"]) {
        PMlabel.text = [NSString stringWithFormat:@"PM2.5: %@",@"--"];
    }else{
       // PMlabel.text = [NSString stringWithFormat:@"PM2.5:%@",self.model.PM2_5];
    }
    
    UILabel *explainLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 65, SCREEN_WIDTH, 20)];
    explainLabel.text = @"该值由拍照去雾霾计算所得，可能跟实际会有一定误差";
    explainLabel.font = [UIFont systemFontOfSize:11];
    
    
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, view.bounds.size.height - 75, SCREEN_WIDTH, 20)];
    timeLabel.text = [tools getLocalTime];
    timeLabel.font = [UIFont systemFontOfSize:13];

    
    [view addSubview:PMlabel];
    [view addSubview:addressLabel];
    [view addSubview:timeLabel];
    [view addSubview:explainLabel];
    return view;
}


/**
 *  对目标图片指定大小进行压缩
 *
 *  @param image 目标图片
 *  @param size  指定的大小
 *
 *  @return 返回压缩后的图片
 */

+ (UIImage *)scalToSize:(UIImage *)image size:(CGSize)size{
    // 去除锯齿
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}





/**
 *  等比例缩小图片
 *
 *  @param image 源图片
 *  @param scale 缩放系数
 *
 *  @return 目标图片
 */

+(UIImage*)imageCompressWithSimple:(UIImage*)image scale:(float)scale
{
    CGSize size=image.size;
    CGFloat width=size.width;
    CGFloat height=size.height;
    CGFloat scaledWidth=width*scale;
    CGFloat scaledHeight=height*scale;
    
    UIGraphicsBeginImageContext(size);//thiswillcrop
    [image drawInRect:CGRectMake(0,0,scaledWidth,scaledHeight)];
    UIImage*newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}



/**
 根据最长的一边，等比例缩小图片

 @param maxwidthOrHeight 最长的一边的像素值
 @param image 要处理的图片对象
 @return 处理后的图片
 */
+ (UIImage *)scalToMaxWidthOrHeight:(int)maxwidthOrHeight andImage:(UIImage *)image {
    // 缩小image的尺寸
    int maxSizeWH = maxwidthOrHeight/2;
    CGSize imgeSize;
    if (image.size.width >= image.size.height) {
        float imgNewHeight = [tools GetImageWithOrHeightWithImage:image andWidht:maxSizeWH andHeight:0.0];
        imgeSize = CGSizeMake(maxSizeWH, imgNewHeight);
    } else {
        float imgNewWidth = [tools GetImageWithOrHeightWithImage:image andWidht:0.0 andHeight:maxSizeWH];
        imgeSize = CGSizeMake(imgNewWidth, maxSizeWH);
    }
    
    return [tools scalToSize:image size:imgeSize];
}





/**
 该函数用来修正 imageOrientation 值

 @param aImage aImage
 @return Image
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


/**
 *  根据图片的的高度或者宽度，等比例求取与之相对应的宽度或高度
 *
 *  @param sourceImg 源图片
 *  @param width     目标宽度  0:表示根据高度固定，宽度是可变的
 *  @param height    目标高度  0:表示根据宽度固定，高度是可变的
 *
 *  @return 与之相对应的目标宽度或者高度
 */

+ (float)GetImageWithOrHeightWithImage:(UIImage *)sourceImg andWidht:(float)width andHeight:(float)height {
    float imgWith = sourceImg.size.width, imgHeight = sourceImg.size.height, ratioWH = imgWith/imgHeight, goalImgWRH = 0.0;
 
    if (width == 0.0 && height != 0.0) {  // 根据高度求宽度
        goalImgWRH = ratioWH * height;
    } else if (width != 0.0 && height == 0.0) { // 根据宽度求高度
        goalImgWRH = width / ratioWH;
    }
    
    return goalImgWRH;
}


/**
 *  隐藏控件，效果为是否是半透明不可点击
 *
 *  @param hiden 是否隐藏
 *  @param sView 要被设置的view
 */

+ (void)HideViewHalfAlphaNoActionWithYesOrNo:(BOOL)hiden andView:(id)sView {
    if (hiden) {
        if ([sView isKindOfClass:[UIBarButtonItem class]]) {
            UIBarButtonItem *barBtmItem = sView;
            barBtmItem.enabled = NO;
        } else {
            UIView *myTempView = sView;
            myTempView.alpha = 0.5;
            myTempView.userInteractionEnabled = NO;
        }
    } else {
        if ([sView isKindOfClass:[UIBarButtonItem class]]) {
            UIBarButtonItem *barBtmItem = sView;
            barBtmItem.enabled = YES;
        } else {
            UIView *myTempView = sView;
            myTempView.alpha = 1.0;
            myTempView.userInteractionEnabled = YES;
        }
    }
}


/**
 *  根据一个过去的时间与现在时间做对比，获取间隔多少分钟
 *
 *  @param oldDate 过去时间
 *
 *  @return 差值多少秒
 */
+ (long)GetMinuteByOldDateBetweenNowDate:(NSDate *)oldDate {
    long betweenMinutes = 0;
    
    // 获取本地时间
    NSDate *nowdate = [self dateFromString:[self getLocalTime] andFormatterString:@"yyyy-MM-dd HH:mm:ss"];
    betweenMinutes = [nowdate timeIntervalSinceDate:oldDate]/60;
    
    return betweenMinutes;
}


/**
 *  NSString转换成NSDate，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSDate *)dateFromString:(NSString *)dateString andFormatterString:(NSString *)strFormater {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:strFormater];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: destDate];
    NSDate *dateCurrent = [destDate  dateByAddingTimeInterval: interval];
    
    return dateCurrent;
}


/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"  忽略时区的转换
 */
+ (NSString *)stringIgnoreZoneFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater {
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: -interval];
    
    return [tools stringFromDate:localeDate andFormatterString:strFormater];
}


/**
 *  根据日期获取对应的星期几
 *
 *  @param strInputDate 输入日期字符串
 *
 *  @return 星期几
 */
+ (NSString*)weekdayStringFromDate:(NSString *)strInputDate {
    
    NSDate *inputDate = [tools dateFromString:strInputDate andFormatterString:@"yy-MM-dd"];
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];  // 设置时区
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}



/**
 格式化为可读的时间显示字符串
 
 @param date 时间
 @return 可读时间字符串
 */
+ (NSString *)stringNormalReadWithDate:(NSDate *)date {
    NSArray *dateInfoArray = [tools getDateYearMonthDayWithDate:date];
    NSArray *currentDateInfoArray = [tools getDateYearMonthDayWithDate:[NSDate date]];
    
    if ([dateInfoArray[0] integerValue] == [currentDateInfoArray[0] integerValue]) {
        // 年相等
        if ([dateInfoArray[1] integerValue] == [currentDateInfoArray[1] integerValue]) {
            // 月相等
            if ([dateInfoArray[2] integerValue] == [currentDateInfoArray[2] integerValue]) {
                // 日相等
                return [tools stringFromDate:date andFormatterString:@"今天 HH:mm"];
            } else {
                NSInteger gapValue = [currentDateInfoArray[2] integerValue] - [dateInfoArray[2] integerValue] ;
                if (gapValue == 1) {
                    return [tools stringFromDate:date andFormatterString:@"昨天 HH:mm"];
                } else if (gapValue == -1) {
                    return [tools stringFromDate:date andFormatterString:@"明天 HH:mm"];
                }
                return [tools stringFromDate:date andFormatterString:@"M月d日 HH:mm"];
            }
        } else {
            return [tools stringFromDate:date andFormatterString:@"M月d日 HH:mm"];
        }
    }
    
    return [tools stringFromDate:date andFormatterString:@"yyyy年M月d日 HH:mm"];
}



/**
 获取日期的年月日时分秒毫秒周
 
 @param date 日期
 @return 年月日时分秒毫秒周数组
 */
+ (NSArray *)getDateYearMonthDayWithDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    
    NSInteger unitFlags = NSCalendarUnitYear |
    
    NSCalendarUnitMonth |
    
    NSCalendarUnitDay |
    
    NSCalendarUnitWeekday |
    
    NSCalendarUnitHour |
    
    NSCalendarUnitMinute |
    
    NSCalendarUnitSecond |
    
    NSCalendarUnitNanosecond;
    
    comps = [calendar components:unitFlags fromDate:date];
    
    
    return @[@([comps year]),
             @([comps month]),
             @([comps day]),
             @([comps hour]),
             @([comps minute]),
             @([comps second]),
             @([comps nanosecond]),
             @([comps weekday]-1)];
}





static inline double radians (double degrees) {return degrees * M_PI/180;}
/**
 *  图片旋转的方法
 *
 *  @param image 源图片
 *  @param angle 旋转角度  上北方向为 0度起始点
 *
 *  @return 目标图片
 */
+ (UIImage *)imageTurnSpinDirection:(UIImage *)image andTurnAngle:(int)angle {
    CGSize size = image.size;
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 做CTM变换
    CGContextRotateCTM (context, radians(130.));
    CGContextTranslateCTM (context, 0, -size.height);
    
    // 开始绘制图片
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0,0, size.width, size.height), image.CGImage);
    
    UIImage *goalImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return goalImage;
}


/**
 *  NSDate转换成NSString，根据 自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)stringFromDate:(NSDate *)date andFormatterString:(NSString *)strFormater {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:strFormater];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}


/**
 *  获取时间字符串，从当前时间开始算起，正数表示向后推算几天，负数表示向前推算几天
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherDateFromNowDays:(NSInteger)dayValue andFormatterString:(NSString *)strFormater {
    NSDate* date = [[NSDate alloc] init];
    date = [date dateByAddingTimeInterval:dayValue*3600*24];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormater];
    NSString *strDate = [dateFormatter stringFromDate:date];
    
    return strDate;
}


/**
 *  获取时间字符串，从某个日期算起，正数表示向后推算几小时，负数表示向前推算几小时
 *  自定义格式  @"yyyy-MM-dd HH:mm:ss zzz"
 */
+ (NSString *)DateToStringForOtherHourFromNowHours:(NSInteger)dayValue andFormatterString:(NSString *)strFormater andDate:(NSDate *)date {
    NSDate *dateTemp = [date dateByAddingTimeInterval:(dayValue-8)*3600];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:strFormater];
    NSString *strDate = [dateFormatter stringFromDate:dateTemp];
    
    return strDate;
}


/**
 *  可读格式化存储大小
 *
 *  @param size 存储大小   单位：B
 *
 *  @return B, K, M, G 为单位
 */
+ (NSString *)fileSizeWithInterge:(NSInteger)size {
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024.0f;
        return [NSString stringWithFormat:@"%.1fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024.0f * 1024.0f);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024.0f*1024.0f*1024.0f);
        return [NSString stringWithFormat:@"%.2fG",aFloat];
    }
}


/**
 *  验证是否为手机号
 *
 *  @param phoneNum 要验证的手机号码
 *
 *  @return 是否为手机号
 */

+(BOOL)checkPhoneNumInputWithPhoneNum:(NSString *)phoneNum {
    NSString *pattern = @"1[3578]\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:phoneNum];
    return isMatch;
    
}


/**
 验证邮箱

 @param email email
 @return 是否是邮箱
 */
+ (BOOL)checkEmailInputWithEmail:(NSString *)email
{
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


/**
 * 字母、数字、中文正则判断（不包括空格）
 */
+ (BOOL)isInputRuleNotBlank:(NSString *)str {
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}
/**
 * 字母、数字、中文正则判断（包括空格）【注意3】
 */
+ (BOOL)isInputRuleAndBlank:(NSString *)str {
    
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d\\s]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}


/**
 *  获得 kMaxLength长度的字符
 */
+ (NSString *)getSubCharString:(NSString*)string andMaxLength:(int)mexLength
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* data = [string dataUsingEncoding:encoding];
    NSInteger length = [data length];
    if (length > mexLength) {
        NSData *data1 = [data subdataWithRange:NSMakeRange(0, mexLength)];
        NSString *content = [[NSString alloc] initWithData:data1 encoding:encoding];//【注意4】：当截取kMaxLength长度字符时把中文字符截断返回的content会是nil
        if (!content || content.length == 0) {
            data1 = [data subdataWithRange:NSMakeRange(0, mexLength - 1)];
            content =  [[NSString alloc] initWithData:data1 encoding:encoding];
        }
        return content;
    }
    return nil;
}

/**
 *  获得 kMaxLength长度的字
 */
+ (NSString *)getSubWordString:(NSString*)string andMaxLength:(int)mexLength
{
    if (string.length > mexLength) {
        NSString *content = [string substringToIndex:mexLength];
        return content;
    }
    return nil;
}

/**
 *  过滤字符串中的emoji
 */
+ (NSString *)disable_emoji:(NSString *)text{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:text
                                                               options:0
                                                                 range:NSMakeRange(0, [text length])
                                                          withTemplate:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"‍‍" withString:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"‍‍‍" withString:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"‍" withString:@""];
    modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"•" withString:@""];
    //modifiedString = [modifiedString stringByReplacingOccurrencesOfString:@"?" withString:@""];
    return modifiedString;
}


/*
 *第二种方法，利用Emoji表情最终会被编码成Unicode，因此，
 *只要知道Emoji表情的Unicode编码的范围，
 *就可以判断用户是否输入了Emoji表情。
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50 || hs == 0x2022 || hs == 0xd83e) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}


/**
 *  校验字符串防止nil字符串操作
 *
 *  @param stringText 字符串
 *
 *  @return 校验后的字符串
 */
+ (NSString *)verifyString:(id)stringText {
    if ([stringText isKindOfClass:[NSNull class]]) {
        return @"";
    } else if ([stringText isEqual:NULL]) {
        return @"";
    } else if ([stringText isEqual:@"null"]) {
        return @"";
    } else if ([stringText isEqual:@"<null>"]) {
        return @"";
    }

    
    return stringText == nil ? @"" : stringText;
}


/**
 *  删除view中所有的subview
 *
 *  @param view  要删除的子view的view
 */
+ (void)removeSubviews:(UIView *)view {
    for (UIView *subView in view.subviews) {
        [subView removeFromSuperview];
    }
}


/**
 *  给UILabel设置行间距和字间距
 */
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font andLineSpaceing:(float)lineSpace {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f  
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f
                          };
    
    // 排除空
    if ([str isKindOfClass:[NSNull class]] || [str isEqualToString:@""] || str == nil) {
        return;
    }
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}


/**
 *  计算UILabel的高度(带有行间距的情况)
 */
+ (CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width andLineSpaceing:(float)lineSpace {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    // 排除空
    if ([str isKindOfClass:[NSNull class]] || [str isEqualToString:@""] || str == nil) {
        return 15;
    }
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}



/*
 *  自定排版view中subview
 */
+ (UIView *)autoComposingSubViewWithView:(UIView *)fatherView andGapX:(float)gapx {
    NSArray *subViews = fatherView.subviews;
    
    for (int i = 0; i < subViews.count; i++) {
        UIView *subview = subViews[i];
        
        CGRect rectFrame = subview.frame;
        if (i == 0) {
            rectFrame.origin.x = gapx;
            rectFrame.origin.y = (fatherView.bounds.size.height - subview.bounds.size.height)/2;
        } else {
            UIView *previousView = subViews[i-1];
            rectFrame.origin.x = previousView.frame.origin.x + previousView.frame.size.width + gapx;
            rectFrame.origin.y =  (fatherView.bounds.size.height - subview.bounds.size.height)/2;
        }
        subview.frame = rectFrame;
    }
    
    return fatherView;
}



/**
 截取圆形图片的方法

 @param image 源图片
 @param inset 边距

 @return 目标图片
 */
+(UIImage*)circleImage:(UIImage*) image withParam:(CGFloat) inset {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);  // 去除锯齿感
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
    
}



/**
 由颜色值生成图片的方法

 @param color 颜色值
 @return 图片对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}



/**
 格式化数据发布时间

 @param oldDate oldDate
 */
+ (NSString *)formattingTimeCanEasyRead:(NSDate *)oldDate {
    NSString *timeStr = nil;
    long betweenMinutes = [tools GetMinuteByOldDateBetweenNowDate:oldDate];
    if (betweenMinutes < 60) {
        timeStr = [NSString stringWithFormat:@"%li分钟前发布", betweenMinutes];
    } if (betweenMinutes >= 60 && betweenMinutes < 3600) {
        timeStr = [NSString stringWithFormat:@"%li小时前发布", betweenMinutes/60];
    } if (betweenMinutes >=3600) {
        timeStr = [NSString stringWithFormat:@"%li天前发布", betweenMinutes/3600];
    }
    
    return timeStr;
}



/**
 去除自定中空的字符值

 @param obj OBJ
 @return ReturnOBJ
 */
+ (id) processDictionaryIsNSNull:(id)obj {
    const NSString *blank = @"";
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dt = [(NSMutableDictionary*)obj mutableCopy];
        for(NSString *key in [dt allKeys]) {
            id object = [dt objectForKey:key];
            if([object isKindOfClass:[NSNull class]]) {
                [dt setObject:blank
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSString class]]){
                NSString *strobj = (NSString*)object;
                if ([strobj isEqualToString:@"<null>"]) {
                    [dt setObject:blank
                           forKey:key];
                }
            }
            else if ([object isKindOfClass:[NSArray class]]){
                NSArray *da = (NSArray*)object;
                da = [self processDictionaryIsNSNull:da];
                [dt setObject:da
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSDictionary class]]){
                NSDictionary *ddc = (NSDictionary*)object;
                ddc = [self processDictionaryIsNSNull:object];
                [dt setObject:ddc forKey:key];
            }
        }
        return [dt copy];
    }
    else if ([obj isKindOfClass:[NSArray class]]){
        NSMutableArray *da = [(NSMutableArray*)obj mutableCopy];
        for (int i=0; i<[da count]; i++) {
            NSDictionary *dc = [obj objectAtIndex:i];
            dc = [self processDictionaryIsNSNull:dc];
            [da replaceObjectAtIndex:i withObject:dc];
        }
        return [da copy];
    }
    else{
        return obj;
    }
}



/**
 将View转成图片

 @param view view
 @return 图片
 */
+ (UIImage *)imageWithView:(UIView *)view {
    
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
//    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();

    
    //转化成image
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);// 去除锯齿（2倍图）
//    UIGraphicsBeginImageContext(view.bounds.size);   // 一倍图，有锯齿
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}



/**
 获取label 的宽度

 @param label Label
 @return 宽度
 */
+ (CGFloat)getLabelWidthWithLabel:(UILabel *)label {
    //这个frame是初设的，没关系，后面还会重新设置其size。  //lbDetailInformation1
    NSDictionary *attributes1 = @{NSFontAttributeName:label.font,};
    NSString *str1 = label.text;
    CGSize textSize1 = [str1 boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes1 context:nil].size;
    
    return textSize1.width;
}



/**
 根据字符串中后缀的格式类型返回对应的本地文件类型图标

 @param checkString 判断字符串
 @return 本地文件类型的图标地址
 */
+ (NSString *)getLocalImageWithCheckString:(NSString *)checkString {
    if ([checkString hasSuffix:@"doc"] || [checkString hasSuffix:@"DOC"]) {
        return @"findcase_file_icon.jpg";     // word 格式
    } else if ([checkString hasSuffix:@"docx"] || [checkString hasSuffix:@"DOCX"]) {
        return @"findcase_file_icon.jpg";     // word 格式
    } else if ([checkString hasSuffix:@"pdf"] || [checkString hasSuffix:@"PDF"]) {
        return @"findcase_file2_icon.jpg";
    } else if ([checkString hasSuffix:@"ppt"] || [checkString hasSuffix:@"PPT"]) {
        return @"case_filetype001.jpg";
    }else if ([checkString hasSuffix:@"xls"] || [checkString hasSuffix:@"XLS"]) {
        return @"findcase_file3_icon.jpg";
    }else if ([checkString hasSuffix:@"txt"] || [checkString hasSuffix:@"TXT"]) {
        return @"findcase_file4_icon.jpg";
    }else {
        return @"findcase_file5_icon.jpg";  // 位置格式
    }
}




/**
 过滤字符串中HTML标签的方法

 @param html 含HTML标签的字符串
 @return    过滤后的字符串
 */
+ (NSString *)flattenHTML:(NSString *)html {
    NSScanner *theScanner;
    NSString *text = nil;

    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                            [NSString stringWithFormat:@"%@>", text]
                            withString:@""];
    } // while //
    
    return html;
}


/**
 判断本地是否存在该文件
 
 @param fileName 文件名称或者路径
 @return 存在的文件路径，不存在则返回nil
 */
+ (NSString *)checkFilePathExistWithFileName:(NSString *)fileName {
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSArray *fileNameArray = [fileName componentsSeparatedByString:@"/"];
    NSString *exitFilePath = [cachesPath stringByAppendingPathComponent:fileNameArray[fileNameArray.count-1]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:exitFilePath]) {
        return exitFilePath;
    }
    return nil;
}


/**
 统计目录文件下文件的总大小
 
 @param folderPath 目录地址
 @return 总大小
 */
+ (long long)folderSizeWithPath:(NSString *)folderPath {
    // 获取默认的文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 判断文件是否存在
    if (![fileManager fileExistsAtPath:folderPath]) return 0;
    
    //文件的枚举器
    NSEnumerator *fileEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName = nil;
    long long filesAllSize = 0;
    while ((fileName = [fileEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        if ([fileAbsolutePath hasSuffix:@"doc"] || [fileAbsolutePath hasSuffix:@"DOC"]  || [fileAbsolutePath hasSuffix:@"docx"] || [fileAbsolutePath hasSuffix:@"DOCX"] || [fileAbsolutePath hasSuffix:@"pdf"] || [fileAbsolutePath hasSuffix:@"PDF"] || [fileAbsolutePath hasSuffix:@"ppt"] || [fileAbsolutePath hasSuffix:@"PPT"] || [fileAbsolutePath hasSuffix:@"xls"] || [fileAbsolutePath hasSuffix:@"XLS"] || [fileAbsolutePath hasSuffix:@"txt"] || [fileAbsolutePath hasSuffix:@"TXT"] || [fileAbsolutePath hasSuffix:@"wav"] || [fileAbsolutePath hasSuffix:@"WAV"] || [fileAbsolutePath hasSuffix:@"amr"] || [fileAbsolutePath hasSuffix:@"AMR"]) {
            // 计算某个文件的大小
            filesAllSize += [self fileSizeWithPath:fileAbsolutePath];
        }
    }
    
    return filesAllSize;
}



/**
 计算指定文件的大小
 
 @param filePath 文件地址
 @return 大小
 */
+ (long long)fileSizeWithPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]) {
        return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    
    return 0;
}



/**
 删除指定目录下的所有文件
 
 @param folderPath 目录地址
 */
+ (void)removeFolderPathAndFileWithPath:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 目录是否存在
    if (![fileManager fileExistsAtPath:folderPath]) return;
    
    // 文件枚举器
    NSEnumerator *fileEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName = nil;
    while ((fileName = [fileEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        if ([fileAbsolutePath hasSuffix:@"doc"] || [fileAbsolutePath hasSuffix:@"DOC"]  || [fileAbsolutePath hasSuffix:@"docx"] || [fileAbsolutePath hasSuffix:@"DOCX"] || [fileAbsolutePath hasSuffix:@"pdf"] || [fileAbsolutePath hasSuffix:@"PDF"] || [fileAbsolutePath hasSuffix:@"ppt"] || [fileAbsolutePath hasSuffix:@"PPT"] || [fileAbsolutePath hasSuffix:@"xls"] || [fileAbsolutePath hasSuffix:@"XLS"] || [fileAbsolutePath hasSuffix:@"txt"] || [fileAbsolutePath hasSuffix:@"TXT"] || [fileAbsolutePath hasSuffix:@"wav"] || [fileAbsolutePath hasSuffix:@"WAV"] || [fileAbsolutePath hasSuffix:@"amr"] || [fileAbsolutePath hasSuffix:@"AMR"]) {
            // 删除指定的文件
            NSError *error = nil;
            [fileManager removeItemAtPath:fileAbsolutePath error:&error];
            if (error != nil) {
                MYLOG(@"error: %@", error);
            }
        }
    }
}



/**
 url参数字符串转字典
 
 @param urlStr url参数字符串
 @return 结果字典
 */
+(NSDictionary *)dictionaryWithUrlString:(NSString *)urlStr
{
    urlStr = [urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (urlStr.length > 0) {
        NSArray *array = [urlStr componentsSeparatedByString:@"&"];
        NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
        for (NSString *param in array) {
            if (param.length > 0) {
                NSArray *parArr = [param componentsSeparatedByString:@"="];
                if (parArr.count == 2) {
                    [paramsDict setValue:parArr[1] forKey:parArr[0]];
                }
            }
        }
        return paramsDict;
    }else{
        return nil;
    }
}



/**
 json 字符串转字典的方法
 
 @param jsonString json字符串
 @return 转换后的字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}




/*
 *x*y
 *改变字符start 和 end 之间的字符的颜色 和 字体大小
 */
+ (void)messageAction:(UITextView *)theTextView startString:(NSString *)start endString:(NSString *)end andAllColor:(UIColor *)allColor andMarkColor:(UIColor *)markColor andMarkFondSize:(float)fontSize {
    NSString *tempStr = theTextView.text;
    NSMutableAttributedString *strAtt = [[NSMutableAttributedString alloc] initWithString:tempStr];
    [strAtt addAttribute:NSForegroundColorAttributeName value:allColor range:NSMakeRange(0, [strAtt length])];
    // 'x''y'字符的范围
    NSRange tempRange = NSMakeRange(0, 0);
    if ([self judgeStringIsNull:start]) {
        tempRange = [tempStr rangeOfString:start];
    }
    NSRange tempRangeOne = NSMakeRange([strAtt length], 0);
    if ([self judgeStringIsNull:end]) {
        tempRangeOne =  [tempStr rangeOfString:end];
    }
    // 更改字符颜色
    NSRange markRange = NSMakeRange(tempRange.location+tempRange.length, tempRangeOne.location-(tempRange.location+tempRange.length));
    [strAtt addAttribute:NSForegroundColorAttributeName value:markColor range:markRange];
    // 更改字体
    // [strAtt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20] range:NSMakeRange(0, [strAtt length])];
    [strAtt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:fontSize] range:markRange];
    theTextView.attributedText = strAtt;
}


/**
 *判断字符串是否不全为空
 */
+ (BOOL)judgeStringIsNull:(NSString *)string {
    if ([[string class] isSubclassOfClass:[NSNumber class]]) {
        return YES;
    }
    BOOL result = NO;
    if (string != nil && string.length > 0) {
        for (int i = 0; i < string.length; i ++) {
            NSString *subStr = [string substringWithRange:NSMakeRange(i, 1)];
            if (![subStr isEqualToString:@" "] && ![subStr isEqualToString:@""]) {
                result = YES;
            }
        }
    }
    return result;
}



/**
 判断字符串是否为纯数字
 
 @param checkedNumString 字符串
 @return 结果Bool类型
 */
+ (BOOL)isNum:(NSString *)checkedNumString {
    checkedNumString = [checkedNumString stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(checkedNumString.length > 0) {
        return NO;
    }
    return YES;
}


/**
 *  从图片中按指定的位置大小截取图片的一部分
 *
 *  @param image UIImage image 原始的图片
 *  @param rect  CGRect rect 要截取的区域
 *
 *  @return UIImage
 */
+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect {
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}





@end
