//
//  BBFirstViewController.m
//  FadeAnimation
//
//  Created by wave on 15/12/9.
//  Copyright © 2015年 wave. All rights reserved.
//

#import "BBFirstViewController.h"
#import "BBFadeController.h"
#import "BBMoveController.h"
#import "BBTestViewController.h"

@interface BBFirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *titileArray;

@end

@implementation BBFirstViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSLog(@"第一层:%@",self.navigationController.viewControllers);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.tableView.tableFooterView = [[UIView alloc]init];
    
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titileArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titileArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        BBFadeController *vc = [[BBFadeController alloc]init];
        [self showViewController:vc sender:self];
    }else if (indexPath.row == 1){
        BBMoveController *vc = [[BBMoveController alloc]init];
        [self showViewController:vc sender:self];
    }else if (indexPath.row == 2){
        BBTestViewController *testVC = [[BBTestViewController alloc]init];
        [self showViewController:testVC sender:self];
    }
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    }
    return _tableView;
}

-(NSArray *)titileArray{
    if (!_titileArray) {
        _titileArray = @[@"FadeAnimation",@"MoveAnimation",@"testVC"];
    }
    return _titileArray;
}

@end
