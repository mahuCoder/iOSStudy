//
//  YXYIosBasic_block_writeVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/19.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_block_writeVC.h"

///宏定义写法
typedef void(^blockNameType)(NSString *paramters);




@interface YXYIosBasic_block_writeVC ()

///直接写blokc属性
@property (nonatomic, copy) void(^blockNameProperty)(NSString *paramters);
///使用宏定义block属性
@property (nonatomic, copy) blockNameType block;


@end

@implementation YXYIosBasic_block_writeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.font = FONT(14);
    [self.view addSubview:label];
    label.preferredMaxLayoutWidth = ScreenWidth - 30;
    label.text = @"宏定义写法\n typedef void(^blockNameType)(NSString *paramters);\n\n 成员变量写法\n 1、@property (nonatomic, copy) void(^blockNameProperty)(NSString *paramters);\n 2、@property (nonatomic, copy) blockNameType block;\n\n 形参写法\n1、- (void)method:(void (^)(NSString *))blcokName{};\n 2、- (void)methodtype:(blockNameType )blcokTypeName{}; \n\n 标准定义 Int (^blockName)(int a,int b); \n\n标准申明\n return_type (^blockName)(var_type) = ^return_type (var_type varName) {};\n\n 简写\n  1、返回类型void\n void (^blockName)(var_type) = ^(var_type varName) {};\n 2、参数为void\n return_type (^blockName)(void) = ^return_type {};\n 3、返回和参数都为void\n void (^blockName)(void) = ^{};";
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.offset(0);
    }];
    
    
    
    ^ void (void){
        
    };
    
    
    
    self.block = ^(NSString *paramters) {
        
    };
    //普通写法
    int var = 10;
    void (^blcok)(void) =  ^void (void ) {
//        printf("%d", var);
        DebugLog(@"%d",var);
    };
    
    var = 2;
    blcok();

    
}
///形参写法
- (void)method:(void (^)(NSString *))blcokName {
    
}
///形参宏写法
- (void)methodtype:(blockNameType )blcokTypeName {
    
}


@end
