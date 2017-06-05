//
//  ViewController.m
//  MCamera
//
//  Created by 郑志勤 on 2017/6/5.
//  Copyright © 2017年 zzqiltw. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "ZQDrawableImageView.h"

@interface ViewController ()

@property (nonatomic, strong) ZQDrawableImageView *originalImageView;
@property (nonatomic, strong) ZQDrawableImageView *resultImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originalImageView = ({
        ZQDrawableImageView *imageView = [[ZQDrawableImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"1.png"];
        imageView.layer.borderWidth = 2;
        [self.view addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.offset(64);
            make.size.mas_equalTo(CGSizeMake(64 * 2, 113 * 2));
        }];
        
        imageView;
    });
    
    self.resultImageView = ({
        ZQDrawableImageView *imageView = [[ZQDrawableImageView alloc] init];
        imageView.layer.borderWidth = 2;
        [self.view addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.originalImageView);
            make.top.equalTo(self.originalImageView.mas_bottom).offset(50);
        }];
        
        imageView;
    });
}



@end
