//
//  TimeStampDateViewController.m
//  CZFToolDemo
//
//  Created by jointsky on 2017/5/23.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "TimeStampDateViewController.h"

@interface TimeStampDateViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showOneLabel;

@property (weak, nonatomic) IBOutlet UILabel *showTwoLabel;

@property (weak, nonatomic) IBOutlet UILabel *showThreeLabel;


@property (weak, nonatomic) IBOutlet UILabel *showTitleLabel;

@property (strong, nonatomic) NSTimer *timerOne;

@property (strong, nonatomic) NSTimer *timerTwo;


@end

@implementation TimeStampDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // timer one
    self.timerOne = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        // title label
        self.showTitleLabel.text = [CZFTool stringNormalReadWithDate:[NSDate date]];
        
        // second Label
        self.showTwoLabel.text = [NSString stringWithFormat:@"%.0f", [NSDate timeIntervalSinceReferenceDate]];
        
        // third Label
        self.showThreeLabel.text = [CZFTool stringFromDate:[NSDate date] andFormatterString:DATE_STANDARD_FORMATTER];
    }];
    
    // timer two
    self.timerTwo = [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer * _Nonnull timer) {
        // first Label
        NSArray *currentDateInfoArray = [CZFTool getDateYearMonthDayWithDate:[NSDate date]];
        self.showOneLabel.text = [NSString stringWithFormat:@"%@年%@月%@日 %@时%@分%@秒 周%@  %.0f", currentDateInfoArray[0], currentDateInfoArray[1], currentDateInfoArray[2], currentDateInfoArray[3], currentDateInfoArray[4], currentDateInfoArray[5],currentDateInfoArray[7], [currentDateInfoArray[6] doubleValue]/1000000];
    }];
    
    
    
    
    
    
    
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_timerOne invalidate];
    [_timerTwo invalidate];
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
