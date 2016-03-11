//
//  UIImage+Extension.h
//  ECHeaders
//
//  Created by hjp on 16/3/9.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *)composeHeaderImageWithConstrainWH:(CGFloat)headerWH imagePathArray:(NSArray *)imagePathArray backgroundColor:(UIColor *)backgroundColor;
@end
