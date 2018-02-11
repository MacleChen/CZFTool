//
//  AESCEnDeCryptViewController.m
//  CZFToolDemo
//
//  Created by jointsky on 2017/5/24.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "AESCEnDeCryptViewController.h"

@interface AESCEnDeCryptViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textOneView;
@property (weak, nonatomic) IBOutlet UITextView *textTwoView;
@property (weak, nonatomic) IBOutlet UITextView *textThreeView;


@end

@implementation AESCEnDeCryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

// MARK: 加密
- (IBAction)aescEncryptBtnClick:(UIButton *)sender {
    if (self.textOneView.text.length > 0) {
        self.textTwoView.text = [AESCryptJointSky encrypt:self.textOneView.text password:@"abc"];
    }
    [self.textOneView resignFirstResponder];
}

// MARK: 解密
- (IBAction)aescDecryptBtnClick:(UIButton *)sender {
    if (self.textTwoView.text.length > 0) {
        self.textThreeView.text = [AESCryptJointSky decrypt:self.textTwoView.text password:@"abc"];
    }
}




@end
