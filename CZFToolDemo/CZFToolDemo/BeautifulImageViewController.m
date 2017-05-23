//
//  BeautifulImageViewController.m
//  CZFToolDemo
//
//  Created by jointsky on 2017/5/23.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "BeautifulImageViewController.h"

@interface BeautifulImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;

@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;


@end

@implementation BeautifulImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    0.f  1.05f  2.f
    self.secondImageView.image = [CZFTool dealHBSImage:self.firstImageView.image andLight:0.f andContrast:1.05f andsaturation:2.f];
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
