//
//  UIImage+Extension.m
//  ECHeaders
//
//  Created by hjp on 16/3/9.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "UIImage+Extension.h"
#import <QuartzCore/QuartzCore.h>

#define kClipHalfAngle 30  //裁剪弧度的一半的度数

static inline float radians(double degrees){
    return (degrees) * M_PI / 180.0;
}
static inline CGRect getRect(CGPoint center ,CGSize size)
{
    return CGRectMake(center.x - size.width / 2, center.y - size.height / 2, size.width, size.height);
}
static inline CGFloat getDiagonal(CGFloat wh){
    return  sqrtf(2 * wh * wh);
}
static inline CGFloat getWH(CGFloat diagonal){
    return diagonal /sqrtf(2);
}
static inline NSValue * valueFrame(CGRect frame){
    return [NSValue valueWithCGRect:frame];
}

@implementation UIImage (Extension)

+ (UIImage *)composeHeaderImageWithConstrainWH:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor
{
    
    if (!imagePathArray || [imagePathArray count] <= 0) {
        return nil;
    }
    
    UIImage *image = nil;
    switch ([imagePathArray count]) {
        case 1: {
            image = [self getComposeImage1:headerWH imagePathArray:imagePathArray backgroundColor:backgroundColor];
            break;
        }
        case 2: {
            image = [self getComposeImage2:headerWH imagePathArray:imagePathArray backgroundColor:backgroundColor];
            break;
        }
        case 3: {
            image = [self getComposeImage3:headerWH imagePathArray:imagePathArray backgroundColor:backgroundColor];
            break;
        }
        case 4: {
            image = [self getComposeImage4:headerWH imagePathArray:imagePathArray backgroundColor:backgroundColor];
            break;
        }
        case 5: {
            image = [self getComposeImage5:headerWH imagePathArray:imagePathArray backgroundColor:backgroundColor];
            break;
        }
        default:
            break;
    }
    return image;
}

+ (UIImage *)getComposeImage1:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor
{
    CGFloat diameter = headerWH;
    
    CGSize size0 = CGSizeMake(diameter, diameter);
    
    UIImage *image0 = [self drawImageWithImagePath:imagePathArray.firstObject contextSize:size0 degrees:0 isClip:NO backgroundColor:backgroundColor];
    
    return image0;
}

+ (UIImage *)getComposeImage2:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor
{
    CGFloat diagonal = getDiagonal(headerWH);
    CGFloat radius = diagonal / 2 / (1 + sqrtf(2));
    CGFloat diameter = 2 * radius;
    CGSize composeSize = CGSizeMake(headerWH, headerWH);
    CGSize contextSize = CGSizeMake(diameter, diameter);
    
    
    CGRect frame0 = (CGRect){{0,0},contextSize};
    UIImage *image0 = [self drawImageWithImagePath:imagePathArray[0] contextSize:contextSize degrees:0 isClip:NO backgroundColor:backgroundColor];
 
    CGRect frame1 = (CGRect){{getWH(diameter)  , getWH(diameter)} ,contextSize};
    UIImage *image1 = [self drawImageWithImagePath:imagePathArray[1] contextSize:contextSize degrees:180 - 45 isClip:YES backgroundColor:backgroundColor];
    
    
    UIImage *image = [self getComposeImageWithImages:@[image0,image1] frames:@[valueFrame(frame0),valueFrame(frame1)] inSize:composeSize backgroundColor:backgroundColor];

    return image;
}

+ (UIImage *)getComposeImage3:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor
{
    CGFloat diameter = headerWH/2;
    
    CGSize composeSize = CGSizeMake(headerWH, headerWH);
    CGSize contextSize = CGSizeMake(diameter, diameter);
  
    
    CGPoint center0 = CGPointMake(diameter, diameter / 2);
    CGRect frame0 = getRect(center0 ,contextSize);
    UIImage *image0 = [self drawImageWithImagePath:imagePathArray[0] contextSize:contextSize degrees:30 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center1 = CGPointMake(center0.x - diameter * sin(radians(30)), diameter / 2 + diameter * cos(radians(30)));
    CGRect frame1 = getRect(center1,contextSize);
    UIImage *image1 = [self drawImageWithImagePath:imagePathArray[1] contextSize:contextSize degrees:270 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center2 = CGPointMake(center1.x + diameter, center1.y);
    CGRect frame2 = getRect(center2,contextSize);
    UIImage *image2 = [self drawImageWithImagePath:imagePathArray[2] contextSize:contextSize degrees:180 - 30 isClip:YES backgroundColor:backgroundColor];
    
    UIImage *image = [self getComposeImageWithImages:@[image0,image1,image2] frames:@[valueFrame(frame0),valueFrame(frame1),valueFrame(frame2)] inSize:composeSize backgroundColor:backgroundColor];
    
    
    return image;
}

+ (UIImage *)getComposeImage4:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor
{

    CGFloat diameter = headerWH/2;
    CGFloat r = diameter / 2;
    CGSize size = CGSizeMake(diameter, diameter);
    
    CGSize composeSize = CGSizeMake(headerWH, headerWH);
    CGSize contextSize = CGSizeMake(diameter, diameter);
    
    
    CGPoint center0 = CGPointMake(r, r);
    CGRect frame0 = getRect(center0 ,size);
    UIImage *image0 = [self drawImageWithImagePath:imagePathArray[0] contextSize:contextSize degrees:0 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center1 = CGPointMake(center0.x, center0.y + diameter);
    CGRect frame1 = getRect(center1,CGSizeMake(diameter, diameter));
    UIImage *image1 = [self drawImageWithImagePath:imagePathArray[1] contextSize:contextSize degrees:270 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center2 = CGPointMake(center1.x + diameter, center1.y);
    CGRect frame2 = getRect(center2,CGSizeMake(diameter, diameter));
    UIImage *image2 = [self drawImageWithImagePath:imagePathArray[2] contextSize:contextSize degrees:180 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center3 = CGPointMake(center2.x, center2.y - diameter);
    CGRect frame3 = getRect(center3,CGSizeMake(diameter, diameter));
    UIImage *image3 = [self drawImageWithImagePath:imagePathArray[3] contextSize:contextSize degrees:90 isClip:YES backgroundColor:backgroundColor];
    
    UIImage *image = [self getComposeImageWithImages:@[image0,image1,image2,image3] frames:@[valueFrame(frame0),valueFrame(frame1),valueFrame(frame2),valueFrame(frame3)]  inSize:composeSize backgroundColor:backgroundColor];
    
    return image;
}

+ (UIImage *)getComposeImage5:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor
{

    CGFloat r = headerWH / 2 / (2 * sin(radians(54)) + 1);
    CGFloat diameter = r * 2;
    
    CGSize composeSize = CGSizeMake(headerWH, headerWH);
    CGSize contextSize = CGSizeMake(diameter, diameter);
    
    CGPoint center0 = CGPointMake(headerWH / 2, r);
    CGRect frame0 = getRect(center0 ,CGSizeMake(diameter, diameter));
    UIImage *image0 = [self drawImageWithImagePath:imagePathArray[0] contextSize:contextSize degrees:54 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center1 = CGPointMake(center0.x - diameter * sin(radians(54)), center0.y + diameter * cos(radians(54)));
    CGRect frame1 = getRect(center1,CGSizeMake(diameter, diameter));
    UIImage *image1 = [self drawImageWithImagePath:imagePathArray[1] contextSize:contextSize degrees:270 + 72 isClip:YES backgroundColor:backgroundColor];
    
    
    CGPoint center2 = CGPointMake(center1.x + diameter * cos(radians(72)), center1.y + diameter * sin(radians(72)));
    CGRect frame2 = getRect(center2,CGSizeMake(diameter, diameter));
    UIImage *image2 = [self drawImageWithImagePath:imagePathArray[2] contextSize:contextSize degrees:270 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center3 = CGPointMake(center2.x + diameter, center2.y);
    CGRect frame3 = getRect(center3,CGSizeMake(diameter, diameter));
    UIImage *image3 = [self drawImageWithImagePath:imagePathArray[3] contextSize:contextSize degrees:180 + 18 isClip:YES backgroundColor:backgroundColor];
    
    CGPoint center4 = CGPointMake(center3.x + diameter * cos(radians(72)), center3.y - diameter * sin(radians(72)));
    CGRect frame4 = getRect(center4,CGSizeMake(diameter, diameter));
    UIImage *image4 = [self drawImageWithImagePath:imagePathArray[4] contextSize:contextSize degrees:90 + 36 isClip:YES backgroundColor:backgroundColor];
    
    UIImage *image = [self getComposeImageWithImages:@[image0,image1,image2,image3,image4] frames:@[valueFrame(frame0),valueFrame(frame1),valueFrame(frame2),valueFrame(frame3),valueFrame(frame4)]  inSize:composeSize backgroundColor:backgroundColor];
    
    return image;
}


//===================================获得裁剪图片============================================//

+ (UIImage *)drawImageWithImagePath:(NSString *)imagePath contextSize:(CGSize)size degrees:(NSInteger)degrees isClip:(BOOL)isClip backgroundColor:(UIColor *)backgroundColor
{
    UIImage *image = [UIImage imageNamed:imagePath];
    image = [self getSquareImageWithOriginalImage:image];

    CGRect bounds = (CGRect){{0,0},size};
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));

    // 开启context
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    

    // 绘制背景
    [backgroundColor setFill];
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, size.height);
    CGContextAddLineToPoint(context, size.width, size.height);
    CGContextAddLineToPoint(context, size.width, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSaveGState(context);
    
    
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, center.x, center.y);
    transform = CGAffineTransformRotate(transform, radians(degrees));
    transform = CGAffineTransformTranslate(transform, -center.x, -center.y);
    
    if (isClip) {
        CGPathAddArc(mutablePath, &transform, size.width / 2, size.height / 2, size.width / 2, radians((90 - kClipHalfAngle)), radians(90 + kClipHalfAngle), 1);
        CGPathAddArcToPoint(mutablePath,&transform,
                            size.width / 2,
                            size.height / 2 + (size.width / 2 * sin(radians(90 - kClipHalfAngle)) - size.width / 2 * sin(radians(kClipHalfAngle)) * tan(radians(kClipHalfAngle))),
                            size.width / 2 + size.width / 2 * sin(radians(kClipHalfAngle)),
                            size.height / 2 + size.width / 2 * sin(radians(90 - kClipHalfAngle)),
                            size.width / 2);
    } else {
        CGPathAddArc(mutablePath, &transform, size.width / 2, size.height / 2, size.width / 2, radians((90)), radians(90 + 0.01), 1);
    }
    
    CGContextAddPath(context, mutablePath);
    CGContextClosePath(context);
    CGContextClip(context);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    
    CGContextRestoreGState(context);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭context
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)getSquareImageWithOriginalImage:(UIImage *)originalImage
{
    CGFloat origionalWidth = originalImage.size.width;
    CGFloat origionalHeight = originalImage.size.height;
    CGSize clipSize = CGSizeZero;
    
    clipSize = origionalWidth > origionalHeight? CGSizeMake(origionalHeight, origionalHeight):CGSizeMake(origionalWidth, origionalWidth);
    
    // 开启context
    UIGraphicsBeginImageContextWithOptions(clipSize, YES, [UIScreen mainScreen].scale);
    
    //CGRect drawRect = CGRectMake(-2, -2, originalImage.size.width +4, originalImage.size.height + 4);
    
    [originalImage drawInRect:(CGRect){CGPointZero,originalImage.size}];
    
    UIImage *composeImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭context
    UIGraphicsEndImageContext();
    
    return composeImage;
    
}


+ (UIImage *)getComposeImageWithImages:(NSArray<UIImage *> *)images frames:(NSArray<NSValue *> *)frames inSize:(CGSize)size backgroundColor:(UIColor *)backgroundColor
{
    // 开启context
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIImage *composeImage = nil;
    
    [backgroundColor setFill];
    
    // 绘制背景
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, size.height);
    CGContextAddLineToPoint(context, size.width, size.height);
    CGContextAddLineToPoint(context, size.width, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSaveGState(context);
    
    // 绘制图标
    for (int i = 0; i < frames.count; i++) {
        
        CGContextSaveGState(context);
        
        NSValue *frameValue = frames[i];
        CGRect frame = [frameValue CGRectValue];
        // 去除黑边
        CGRect constFrame = CGRectMake(frame.origin.x + .5, frame.origin.y + .5, frame.size.width -1, frame.size.height - 1);
        // 裁圆形
        CGContextAddEllipseInRect(context, constFrame);

        CGContextClip(context);
        
        UIImage *image = images[i];
        
        [image drawInRect:frame];
        
        CGContextRestoreGState(context);
    }
    
    CGContextRestoreGState(context);
    
    composeImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭context
    UIGraphicsEndImageContext();
    
    return composeImage;
}

@end
