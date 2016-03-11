//
//  ViewController.m
//  ECQQGroupHeader
//
//  Created by Eric on 16/3/10.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

static inline UIColor * pureColor(CGFloat value){
    return  [UIColor colorWithRed:arc4random_uniform(value)/255.0 green:arc4random_uniform(value)/255.0 blue:arc4random_uniform(value)/255.0 alpha:0.5];
}

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView01;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView001;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView0001;

@property (weak, nonatomic) IBOutlet UIImageView *ImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView02;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView002;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView0002;

@property (weak, nonatomic) IBOutlet UIImageView *ImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView03;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView003;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView0003;

@property (weak, nonatomic) IBOutlet UIImageView *ImageView4;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView04;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView004;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView0004;

@property (weak, nonatomic) IBOutlet UIImageView *ImageView5;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView05;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView005;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView0005;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path1 = [self imagePath:@"1.jpg"];
    NSString *path2 = [self imagePath:@"2.jpg"];
    NSString *path3 = [self imagePath:@"3.jpg"];
    NSString *path4 = [self imagePath:@"4.jpg"];
    NSString *path5 = [self imagePath:@"5.jpg"];

    NSArray *pathArray1 = @[path1];
    NSArray *pathArray2 = @[path1,path2];
    NSArray *pathArray3 = @[path1,path2,path3];
    NSArray *pathArray4 = @[path1,path2,path3,path4];
    NSArray *pathArray5 = @[path1,path2,path3,path4,path5];

    CGFloat wh = self.ImageView1.bounds.size.width;
    UIColor *color = pureColor(240);
    self.ImageView1.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray1 backgroundColor:color];
    self.ImageView01.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray1 backgroundColor:color];
    self.ImageView001.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray1 backgroundColor:color];
    self.ImageView0001.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray1 backgroundColor:color];
    
    wh = self.ImageView2.bounds.size.width;
    color = pureColor(220);
    self.ImageView2.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray2 backgroundColor:color];
    self.ImageView02.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray2 backgroundColor:color];
    self.ImageView002.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray2 backgroundColor:color];
    self.ImageView0002.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray2 backgroundColor:color];
    
    wh = self.ImageView3.bounds.size.width;
    color = pureColor(200);
    self.ImageView3.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray3 backgroundColor:color];
    self.ImageView03.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray3 backgroundColor:color];
    self.ImageView003.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray3 backgroundColor:color];
    self.ImageView0003.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray3 backgroundColor:color];
    
    wh = self.ImageView4.bounds.size.width;
    color = pureColor(180);
    self.ImageView4.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray4 backgroundColor:color];
    self.ImageView04.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray4 backgroundColor:color];
    self.ImageView004.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray4 backgroundColor:color];
    self.ImageView0004.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray4 backgroundColor:color];
    
    wh = self.ImageView5.bounds.size.width;
    color = pureColor(160);
    self.ImageView5.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray5 backgroundColor:color];
    self.ImageView05.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray5 backgroundColor:color];
    self.ImageView005.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray5 backgroundColor:color];
    self.ImageView0005.image = [UIImage composeHeaderImageWithConstrainWH:wh imagePathArray:pathArray5 backgroundColor:color];

}

- (NSString *)imagePath:(NSString *)imageName
{
    
    return [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
