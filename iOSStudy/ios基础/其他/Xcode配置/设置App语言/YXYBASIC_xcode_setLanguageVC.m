//
//  YXYBASIC_xcode_setLanguageVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/2.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYBASIC_xcode_setLanguageVC.h"

@interface YXYBASIC_xcode_setLanguageVC ()

@end

@implementation YXYBASIC_xcode_setLanguageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1、更改nfo.plist文件(即项目的info选项)中设置Localization native development region的字段
    // 默认为en（英语） 修改为china（中文）
    //2、如果上面操作无效，PROJECT -> Info -> Localizations中添加语言包才可以。chinese
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
