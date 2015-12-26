//
//  RootIndexTableViewController.m
//  WDCodeSnippetsProject
//
//  Created by 吴迪玮 on 15/12/25.
//  Copyright © 2015年 DNT. All rights reserved.
//

#import "RootIndexTableViewController.h"
#import "RootIndexTableViewCell.h"

#define ReuseIdentifier @"rootIndexCell"

@interface RootIndexTableViewController ()

@property (strong, nonatomic) NSArray *indexArray;

@end

@implementation RootIndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //CODE SNIPPET<----- 代码段这里看是
    //这里隐藏防止NavigationBar挡住VC，这里我在StoryBoard的runtime中修改了，这里所以注释掉
    //    self.navigationController.navigationBar.translucent = NO;
    //>----- 代码段这里结束
    self.indexArray = @[@{@"name":@"UILabel行间距",@"class":@"LabelParagraphStyleViewController"},
                        @{@"name":@"SDWebImage例子",@"class":@"SDWebimageTestViewController"}];
     self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.indexArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RootIndexTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.indexItemDict = [self.indexArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *indexItemDict = [self.indexArray objectAtIndex:indexPath.row];
    NSString *className = [indexItemDict objectForKey:@"class"];
    Class vcClass = NSClassFromString(className);
    UIViewController *vc = [[vcClass alloc] initWithNibName:className bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
