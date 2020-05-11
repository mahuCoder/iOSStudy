//
//  YXYIosBasic_UIImageViewVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/21.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UIImageViewVC.h"

@interface YXYIosBasic_UIImageViewVC ()

@end

@implementation YXYIosBasic_UIImageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image_name = [[UIImage imageNamed:@"example"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"png"];
    NSString *path = [[[NSBundle mainBundle]  bundlePath] stringByAppendingFormat:@"/example.png"];
    NSString *path_1 = [[NSBundle mainBundle] pathForResource:@"pay" ofType:@"mp3"];
    UIImage *image_file = [UIImage imageWithContentsOfFile:path];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = FONT(12);
    [self.view addSubview:label];
    label.numberOfLines = 0;
    label.text = @"imageNamed: 这个方法用一个指定的名字在系统缓存中查找并返回一个图片对象如果它存在的话。如果缓存中没有找到相应的图片，这个方法从指定的文档中加载然后缓存并返回这个对象\nimageWithContentsOfFile：仅加载图片，图像数据不会缓存。因此对于较大的图片以及使用情况较少时，那就可以用该方法，降低内存消耗\n总得来说，使用大的图片，如果不是常用，那么用 imagewithcontentsoffile 方法，比较小的（比如图标），需要经常使用的，那么用后者，imageNamed 加载，内存常驻，效率高，但是会放在内存里作为cache，图片多了容易导致crash。";
    label.preferredMaxLayoutWidth = ScreenWidth - 50;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.left.offset(15);
    }];
    
    
    UIImageView *imageView_0 = [[UIImageView alloc] initWithImage:image_name];
    UIImageView *imageView_1 = [[UIImageView alloc] initWithImage:image_file];
    [self.view addSubview:imageView_0];
    [self.view addSubview:imageView_1];
    [imageView_0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom);
        make.left.offset(15);
    }];
    [imageView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView_0.mas_bottom).offset(15);
        make.left.offset(15);
    }];

    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
