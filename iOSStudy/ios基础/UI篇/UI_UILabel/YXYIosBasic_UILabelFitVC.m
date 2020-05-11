//
//  YXYIosBasic_UILabelFitVC.m
//  iOSStudy
//
//  Created by sunny on 2020/3/19.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasic_UILabelFitVC.h"

@interface YXYIosBasic_UILabelFitVC ()

@end

@implementation YXYIosBasic_UILabelFitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 24, 300, 20)];
    label1.text = @"sizeToFit: 会计算出最优的 size 而且会改变自己的 size";
    label1.numberOfLines = 0;
    label1.backgroundColor = HEXCOLOR(0xcccccc);
    [label1 sizeToFit];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 94, 300, 20)];
    label2.text = @"sizeThatFits: 会计算出最优的 size 但是不会改变 自己的 size";
    label2.numberOfLines = 0;
    label2.backgroundColor = HEXCOLOR(0xcccccc);
    CGSize size = [label2 sizeThatFits:CGSizeZero];
    [ToastManager showToast:[@"sizeThatFits" stringByAppendingString:NSStringFromCGSize(size)]];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(50,150, 300, 30)];
    label3.backgroundColor = HEXCOLOR(0xcccccc);
    label3.text = @"setAdjustsFontSizeToFitWidth设置为yes，超出文本的话字体会自动调节大小以保证在显示范围内";
//    label3.numberOfLines = 0;
    [label3 setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 300, 60)];
    label4.text = @"sizeThatFits: 会计算出最优的 size 但是不会改变 自己的 size";
    label4.numberOfLines = 0;
    label4.backgroundColor = HEXCOLOR(0xcccccc);
    CGSize size4 = [label2 sizeThatFits:CGSizeZero];
    DebugLog(@"%@", NSStringFromCGSize(size4));
//    [ToastManager showToast:NSStringFromCGSize(size)];
    [self.view addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(50, 270, 300, 30)];
    label5.text = @"sizeToFit: 会先调用sizeThatFits，然后zise赋值label，所以单行显示不完整";
    label5.backgroundColor = HEXCOLOR(0xcccccc);
    [label5 sizeToFit];
    [self.view addSubview:label5];
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(50,350, 300, 30)];
    label6.backgroundColor = HEXCOLOR(0xcccccc);
    //设置最小字体
    label6.minimumScaleFactor = 7;
    //设置最大字体
    label6.text = @"minimumScaleFactor设置最小字体，可配合setAdjustsFontSizeToFitWidth使用";
    //    label3.numberOfLines = 0;
    [label6 setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:label6];
    
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(50,400, 300, 50)];
    label7.numberOfLines = 0;
    label7.backgroundColor = HEXCOLOR(0xcccccc);
    //使用自动布局是生效
    label7.preferredMaxLayoutWidth = 200;
    label7.text = @"preferredMaxLayoutWidth 可以限制最大宽度 xib和自动布局生效";
    //    label3.numberOfLines = 0;
    [self.view addSubview:label7];
    [label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(40);
        make.top.offset(400);
    }];
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
