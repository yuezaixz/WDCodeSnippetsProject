//
//  SDWebimageTestViewController.m
//  WDCodeSnippetsProject
//
//  Created by 吴迪玮 on 15/12/26.
//  Copyright © 2015年 DNT. All rights reserved.
//

#import "SDWebimageTestViewController.h"
#import <SDWebImageManager.h>
#import <UIImageView+WebCache.h>

@interface SDWebimageTestViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *progressImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dynamicImageView;

@end

@implementation SDWebimageTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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

- (IBAction)dynamicDownAction:(UIButton *)btn {
    [self.dynamicImageView sd_setImageWithURL:[NSURL URLWithString:@"http://2g0t2nsbu43qexp0d9njul4x.wpengine.netdna-cdn.com/wp-content/uploads/2013/12/Steve-Jobs-Think-Different-1.jpg"] placeholderImage:[UIImage imageNamed:@"Aerial08"] options:SDWebImageProgressiveDownload];
    
}


- (IBAction)progressDownAction:(UIButton *)btn {
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:@"http://www.jobs.ac.uk/images/global/jobs_ac_uk-logo-with-strapline.jpg"]
                                                    options:SDWebImageRefreshCached
                                                   progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                                       dispatch_async(dispatch_get_main_queue(),^(){
                                                           [btn setTitle:[NSString stringWithFormat:@"进度(%ld%%)加载",receivedSize*100/expectedSize] forState:UIControlStateNormal];
                                                       });
                                                    }
                                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                        [self.progressImageView setImage:image];
                                                      NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:@"http://www.jobs.ac.uk/images/global/jobs_ac_uk-logo-with-strapline.jpg"]];
                                                      NSLog(@"KEY:%@",key);
                                                      [[SDWebImageManager sharedManager].imageCache clearDisk];
                                                      [[SDWebImageManager sharedManager].imageCache clearMemory];
                                                    }];
}

- (void)tet {
//    [SDWebImageManager sharedManager] down
}

@end
