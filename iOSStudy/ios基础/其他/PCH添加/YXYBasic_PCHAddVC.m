//
//  YXYBasic_PCHAddVC.m
//  iOS技术学习总结
//
//  Created by 胡雪刚 on 2019/5/8.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYBasic_PCHAddVC.h"

@interface YXYBasic_PCHAddVC ()

@end

@implementation YXYBasic_PCHAddVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    @"Step_1";
    //Step1:创建PCH文件，command+n -->ios --> other --> PCH File
    //Step2:选择target --> Build setting --> search "Prefix Header" --> pch文件目录拖动到上一步
    //Step3:将Step2绝对目录替换成相对目录-- 目录前缀替换成 $(SRCROOT)/
    
    
}



@end
