//
//  YXYIosBasic_block_exapmleVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/19.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_block_exapmleVC.h"

@interface YXYIosBasic_block_exapmleVC ()

@end

@implementation YXYIosBasic_block_exapmleVC

- (void)viewDidLoad {
    [super viewDidLoad];
     //实例1
    int var = 10;
    DebugLog(@"%p",&var);
    void (^blcok)(void) =  ^void (void ) {
        DebugLog(@"%p",&var);
        DebugLog(@"var=%d",var);
    };
    
    var = 2;
    blcok();
    
    //实例2
    __block int a = 10;
    DebugLog(@"ap=%p",&a);
    void (^aBlcok)(void) =  ^ {
        DebugLog(@"ap==%p",&a);
        DebugLog(@"a=%d",a);
        
    };
    a = 2;
    aBlcok();
    
    //实例3
    static int b = 10;
    DebugLog(@"bp=%p",&b);
    void (^bBlock)(void) = ^ {
        DebugLog(@"bp=%p",&b);
        DebugLog(@"b=%d",b);
    };
    b = 2;
    bBlock();
    DebugLog(@"b==%d",b);
    //实例4
    NSString *str_0 = @"abc";
    void (^strBlock_0)(void) = ^ {
        DebugLog(@"str_0=%@",str_0);
//        str_0 = @"123";
        DebugLog(@"str_0=%@",str_0);
    };
    str_0 = @"abc123";
    strBlock_0();
    DebugLog(@"str_0==%@",str_0);
    
    //实例5
    __block NSString *str_1 = @"abc";
    void (^strBlock_1)(void) = ^ {
        DebugLog(@"str_1=%@",str_1);
        str_1 = @"123";
        DebugLog(@"str_1=%@",str_1);
    };
    str_1 = @"abc123";
    strBlock_1();
    DebugLog(@"str_1==%@",str_1);
    
    //实例6
    static NSString *str_2 = @"abc";
    void (^strBlock_2)(void) = ^ {
        DebugLog(@"str_2=%@",str_2);
        str_2 = @"123";
        DebugLog(@"str_2=%@",str_2);
    };
    str_2 = @"abc123";
    strBlock_2();
    DebugLog(@"str_2==%@",str_2);
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.font = FONT(14);
    [self.view addSubview:label];
    label.preferredMaxLayoutWidth = ScreenWidth - 30;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.left.offset(15);
    }];
    label.text = @" 实例1、\n int var = 10;\n void (^blcok)(void) =  ^void (void ) {\n DebugLog(@\"%d\",var);}; \n var = 2; \nblcok(); \n打印结果：10(拷贝的是变量的值，内存地址是2个不同的内存) \n\n 实例2、\n __block int var = 10;\n void (^blcok)(void) =  ^void (void ) {\n DebugLog(@\"%d\",var);}; \n var = 2; \nblcok(); \n打印结果：2(拷贝的对象在堆区，指向同一个值，内存地址是2个不同的内存) \n\n 实例3、\n static int var = 10;\n void (^blcok)(void) =  ^void (void ) {\n DebugLog(@\"%d\",var);}; \n var = 2; \nblcok(); \n打印结果：2 \n\n";
    
    
    
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
