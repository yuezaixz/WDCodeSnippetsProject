//
//  RootIndexTableViewCell.m
//  WDCodeSnippetsProject
//
//  Created by 吴迪玮 on 15/12/25.
//  Copyright © 2015年 DNT. All rights reserved.
//

#import "RootIndexTableViewCell.h"

@interface RootIndexTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *indexItemName;


@end


@implementation RootIndexTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
}

-(void)setIndexItemDict:(NSDictionary *)indexItemDict{
    _indexItemDict = indexItemDict;
    self.indexItemName.text = [_indexItemDict objectForKey:@"name"];
}

@end
