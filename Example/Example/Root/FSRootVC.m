//
//  FSRootVC.m
//  Example
//
//  Created by 张忠燕 on 2020/5/29.
//  Copyright © 2020 张忠燕. All rights reserved.
//

#import "FSRootVC.h"
#import "ViewController.h"
#import "FSStockDemoVC.h"

@interface FSRootVC ()

@end

@implementation FSRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(UITableViewCell.class)];
    }
    
    // Configure the cell...
    NSInteger row = indexPath.row;
    if (row == 0) {
        cell.textLabel.text = @"粗糙款式";
    } else if (row == 1) {
        cell.textLabel.text = @"股票款式";
    }
    
    return cell;
}


#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger row = indexPath.row;
    if (row == 0) {
        ViewController *vc = [[ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (row == 1) {
        FSStockDemoVC *vc = [[FSStockDemoVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
