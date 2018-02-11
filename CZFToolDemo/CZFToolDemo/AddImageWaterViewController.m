//
//  AddImageWaterViewController.m
//  CZFToolDemo
//
//  Created by jointsky on 2017/5/23.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "AddImageWaterViewController.h"

@interface AddImageWaterViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;

@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;


@end

@implementation AddImageWaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *dealImage = [UIImage createShareImage:self.firstImageView.image :@"图片水印处理" :20];
    
    
    self.secondImageView.image = [UIImage createShareImaga:dealImage :@"2017/05/23 西安市" :@"绿地笔克 汇鑫IBC" :@"PM2.5: 80μg/m³" :@"青春飞扬" : dealImage.size.width * 0.1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
