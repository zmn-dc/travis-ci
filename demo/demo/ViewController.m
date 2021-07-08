//
//  ViewController.m
//  demo
//
//  Created by HH on 2021/1/19.
//

#import "ViewController.h"

#import <AFNetworking/AFNetworking.h>

#import <DesignKit/NSObject+HYLEncrypt.h>

#import <WZLBadgeImport.h>
#import <WZLBadgeProtocol.h>
#import <YYImage/YYImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"csrfToken = %@", [self encrypt_csrfTokenWithMobile:@"15215621210"]);
    
    [self loadGifView];
    
    self.view.backgroundColor = UIColor.greenColor;
}

- (void)loadGifView {
    
//    UIImage *image = [YYImage imageNamed:@"loading.gif"];
//    UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(20, 100, 100, 100);
//    [self.view addSubview:imageView];

    UIImageView *imageView = [[YYAnimatedImageView alloc] init];
    imageView.frame = CGRectMake(20, 100, 100, 100);
    [self.view addSubview:imageView];
    UIImage *image = [YYImage imageNamed:@"loading.gif"];
    imageView.image = image;
}


@end
