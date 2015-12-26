//
//  SDWebimageTestViewController.m
//  WDCodeSnippetsProject
//
//  Created by 吴迪玮 on 15/12/26.
//  Copyright © 2015年 DNT. All rights reserved.
//

#import "SDWebimageTestViewController.h"
#import <SDWebImageManager.h>

@interface SDWebimageTestViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *progressImageView;

@end

@implementation SDWebimageTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //        _isPause = NO;
        if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]){
            
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)progressDownAction:(UIButton *)btn {
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:@"http://7oxfjd.com2.z0.glb.qiniucdn.com/shoes%2F2_Asics_Gel_Kayano_20_12.png"]
                                                    options:SDWebImageRefreshCached
                                                   progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                                                        [btn setTitle:[NSString stringWithFormat:@"进度(%ld%%)加载",receivedSize*100/expectedSize] forState:UIControlStateNormal];
                                                    }
                                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                        [self.progressImageView setImage:image];
                                                    }];
}

- (void)tet {
//    [SDWebImageManager sharedManager] down
}

@end
