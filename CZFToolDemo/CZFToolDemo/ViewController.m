//
//  ViewController.m
//  CZFToolDemo
//
//  Created by jointsky on 2017/5/23.
//  Copyright © 2017年 陈帆. All rights reserved.
//

#import "ViewController.h"

#define HOME_TABLEVIEW_CELL_ID @"cell"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSArray *_dataSource;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 初始化
    self.title = @"工具类使用";
    
    // 设置TableView
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 设置Data
    _dataSource = @[@{@"图片相关处理" : @[@{@"AddImageWaterView" : @"图片添加水印"},
                                        @{@"BeautifulImageView" : @"图片美化"},]},
                    
                    @{@"时间相关处理" : @[@{@"TimeStampDateView" : @"时间显示"},]},
                    
                    @{@"数据加密" : @[@{@"AESCEnDeCryptView" : @"AESC加解密"},]},
                    ];
}


#pragma mark - TableView Delegate
#pragma mark section count
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

#pragma mark row count
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dataDict = _dataSource[section];
    
    NSString *dictKeyTitle = [dataDict allKeys][0];
    
    return [dataDict[dictKeyTitle] count];
}

#pragma mark cell content
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HOME_TABLEVIEW_CELL_ID];
    
    // 解析数据
    NSDictionary *dataDict = _dataSource[indexPath.section];
    NSArray *dataArray = dataDict[[dataDict allKeys][0]];
    NSDictionary *rowDataDict = dataArray[indexPath.row];
    
    cell.detailTextLabel.text = [rowDataDict allKeys][0];
    cell.textLabel.text = [rowDataDict objectForKey:cell.detailTextLabel.text];
    
    return cell;
}


#pragma mark cell click
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 解析数据
    NSDictionary *dataDict = _dataSource[indexPath.section];
    NSArray *dataArray = dataDict[[dataDict allKeys][0]];
    NSDictionary *rowDataDict = dataArray[indexPath.row];
    
    // 跳转界面
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:[rowDataDict allKeys][0]];
    
    UIBarButtonItem *returnBarItem = [[UIBarButtonItem alloc] init];
    returnBarItem.title = @"返回";
    self.navigationItem.backBarButtonItem = returnBarItem;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark cell Height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dataDict = _dataSource[section];
    return [dataDict allKeys][0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
