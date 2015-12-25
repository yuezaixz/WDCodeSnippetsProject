//
//  LabelParagraphStyleViewController.m
//  WDCodeSnippetsProject
//
//  Created by 吴迪玮 on 15/12/25.
//  Copyright © 2015年 DNT. All rights reserved.
//

#import "LabelParagraphStyleViewController.h"

#define LINE_SPACING 10

@interface LabelParagraphStyleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (strong, nonatomic) NSMutableArray *textArray;

@end

@implementation LabelParagraphStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textArray = [@[@"跑动跑鞋"] mutableCopy];
}
- (IBAction)addTextAction:(id)sender {
    [self.textArray addObject:[NSString stringWithFormat:@"测试%ld",[self.textArray count]]];
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = LINE_SPACING;
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:[self textContent] attributes:@
                               
                               {
                               NSFontAttributeName: [UIFont systemFontOfSize:16],
                               NSParagraphStyleAttributeName: paragraphStyle,
                               }];
    //有一个问题就是如果只有一行，那么下方还会有个空白的行间距
    self.testLabel.attributedText = str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSString *)textContent{
    NSMutableString *text = [[NSMutableString alloc] init];
    for (NSString *str in self.textArray) {
        [text appendString:str];
    }
    return text;
}

@end
