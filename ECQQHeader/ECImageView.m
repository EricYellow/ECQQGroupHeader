//
//  ECImageView.m
//  ECQQGroupHeader
//
//  Created by 黄继平 on 16/3/10.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

#import "ECImageView.h"

@implementation ECImageView

- (void)awakeFromNib
{
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.layer.masksToBounds = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
