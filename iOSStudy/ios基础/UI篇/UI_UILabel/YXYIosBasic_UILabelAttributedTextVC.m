//
//  YXYIosBasic_UILabelAttributedTextVC.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2019/9/19.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYIosBasic_UILabelAttributedTextVC.h"

@interface YXYIosBasic_UILabelAttributedTextVC ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayData;
@property (nonatomic, strong) NSMutableArray *arrayStyle;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSMutableAttributedString *attributedStr;

@end

@implementation YXYIosBasic_UILabelAttributedTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //    UIFont;
    self.arrayData = @[@"设置字体",@"设置颜色 ",@"设置斜体 ",@"设置下划线",@"设置删除线 ",@"设置背景色",@"描边和填充",@"段落",@"字符间距",@"阴影",@"基线偏移",@"横向拉伸",@"书写方向",@"排版方向",@"超链接(点击效果只能用在UITextView上)",@"特殊效果",@"图文混排"];
    self.arrayStyle = @[@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO,@NO].mutableCopy;
    self.attributedStr = [[NSMutableAttributedString alloc] initWithString:@"啦啦啦我是富文本啦啦啦"];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.label];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(50);
        make.left.right.bottom.offset(0);
    }];
    _label.attributedText = self.attributedStr;
    //    vie
    //    self.tableView mas
}

#pragma mark --------------------------网络处理--------------------------


#pragma mark --------------------------点击事件--------------------------


#pragma mark --------------------------delegate&datasoure---------------
#pragma mark  -------------deleget & dataSource------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = self.arrayData[indexPath.row];
//    cell.detailTextLabel.text = self.arrayVC[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSRange range = [@"啦啦啦我是富文本啦啦啦" rangeOfString:@"我是富文本"];
    BOOL isSelect = ![self.arrayStyle[indexPath.row] boolValue];
    self.arrayStyle[indexPath.row] = @(isSelect);
    NSString *title = self.arrayData[indexPath.row];
//       self.arrayData = @[@"设置字体",@"设置颜色 ",@"设置斜体 ",@"设置下划线",@"设置删除线 ",@"设置背景色",@"描边和填充",@"段落",@"字符间距",@"阴影",@"基线偏移",@"横向拉伸",@"书写方向",@"排版方向",@"超链接",@""];
    if ([title isEqualToString:@"设置字体"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSFontAttributeName value:FONT(20) range:range];
        } else {
            [self.attributedStr removeAttribute:NSFontAttributeName range:range];
        }
    } else if ([title isEqualToString:@"设置颜色"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
        } else {
            [self.attributedStr removeAttribute:NSForegroundColorAttributeName range:range];
        }
    } else if ([title isEqualToString:@"设置斜体"]) {
        if (isSelect) {
            //斜体  value是倾斜度  ,正值右倾，负值左倾
            [self.attributedStr addAttribute:NSObliquenessAttributeName value:@0.7 range:range];
        } else {
            [self.attributedStr removeAttribute:NSObliquenessAttributeName range:range];
        }
    } else if ([title isEqualToString:@"设置下划线"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
            [self.attributedStr addAttribute:NSUnderlineColorAttributeName value:[UIColor greenColor] range:range];
            
        } else {
            [self.attributedStr removeAttribute:NSUnderlineStyleAttributeName range:range];
            [self.attributedStr removeAttribute:NSUnderlineColorAttributeName range:range];
            
        }
    } else if ([title isEqualToString:@"设置删除线"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
            [self.attributedStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor greenColor] range:range];
        } else {
            [self.attributedStr removeAttribute:NSStrikethroughStyleAttributeName range:range];
            [self.attributedStr removeAttribute:NSStrikethroughColorAttributeName range:range];
            
        }
    } else if ([title isEqualToString:@"设置背景色"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:range];
        } else {
            [self.attributedStr removeAttribute:NSBackgroundColorAttributeName range:range];
        }
    } else if ([title isEqualToString:@"描边和填充"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:range];
            // 笔画宽度(粗细)，取值为 NSNumber 对象（整数），负值填充效果，正值中空效果
            [self.attributedStr addAttribute:NSStrokeWidthAttributeName value:@(-10) range:range];
        } else {
            [self.attributedStr removeAttribute:NSStrokeColorAttributeName range:range];
            [self.attributedStr removeAttribute:NSStrokeWidthAttributeName range:range];
        }
    } else if ([title isEqualToString:@"段落"]) {
        //        1.alignment // 对齐方式
        //        2.firstLineHeadIndent // 首行缩进
        //        3.headIndent // 缩进
        //        4.tailIndent // 尾部缩进
        //        5.lineBreakMode // 断行方式
        //        6.maximumLineHeight // 最大行高
        //        7.minimumLineHeight // 最低行高
        //        8.lineSpacing // 行距
        //        9.paragraphSpacing // 段距
        //        10.paragraphSpacingBefore // 段首空间
        //        11.baseWritingDirection // 句子方向
        //        12.lineHeightMultiple // 可变行高,乘因数。
        //        13.hyphenationFactor // 连字符属性
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.firstLineHeadIndent = 30;
        style.lineSpacing = 20;
        style.minimumLineHeight = 50;
        if (isSelect) {
            [self.attributedStr addAttribute:NSParagraphStyleAttributeName value:style range:range];
        } else {
            [self.attributedStr removeAttribute:NSParagraphStyleAttributeName range:range];
        }
    } else if ([title isEqualToString:@"字符间距"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSKernAttributeName value:@10 range:range];
        } else {
            [self.attributedStr removeAttribute:NSKernAttributeName range:range];
        }
    } else if ([title isEqualToString:@"阴影"]) {
        NSShadow *shadow = [[NSShadow alloc]init];
        shadow.shadowOffset = CGSizeMake(2, 2);
        shadow.shadowColor = [UIColor grayColor];
        if (isSelect) {
            [self.attributedStr addAttribute:NSShadowAttributeName value:shadow range:range];
        } else {
            [self.attributedStr removeAttribute:NSShadowAttributeName range:range];
        }
    } else if ([title isEqualToString:@"基线偏移"]) {//(float）,正值上偏，负值下偏
        if (isSelect) {
            [self.attributedStr addAttribute:NSBaselineOffsetAttributeName value:@2 range:range];
        } else {
            [self.attributedStr removeAttribute:NSBaselineOffsetAttributeName range:range];
        }
    } else if ([title isEqualToString:@"横向拉伸"]) {//（float）,正值横向拉伸文本，负值横向压缩文本
        if (isSelect) {
            [self.attributedStr addAttribute:NSExpansionAttributeName value:@0.5 range:range];
        } else {
            [self.attributedStr removeAttribute:NSExpansionAttributeName range:range];
        }
    } else if ([title isEqualToString:@"书写方向"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSWritingDirectionAttributeName value:@[@3] range:range];
        } else {
            [self.attributedStr removeAttribute:NSWritingDirectionAttributeName range:range];
        }
    } else if ([title isEqualToString:@"排版方向"]) {//0 横排默认。1竖排
        if (isSelect) {
            [self.attributedStr addAttribute:NSVerticalGlyphFormAttributeName value:@1 range:range];
        } else {
            [self.attributedStr removeAttribute:NSVerticalGlyphFormAttributeName range:range];
        }
    } else if ([title isEqualToString:@"超链接(点击效果只能用在UITextView上)"]) {
        if (isSelect) {
            [self.attributedStr addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"http://www.baidu.com"] range:range];
        } else {
            [self.attributedStr removeAttribute:NSLinkAttributeName range:range];
        }
    } else if ([title isEqualToString:@"特殊效果"]) {//默认为nil
        if (isSelect) {
            [self.attributedStr addAttribute:NSTextEffectAttributeName value:NSTextEffectLetterpressStyle range:range];
        } else {
            [self.attributedStr removeAttribute:NSTextEffectAttributeName range:range];
        }
    } else if ([title isEqualToString:@"图文混排"]) {
        NSTextAttachment *attach = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
        attach.bounds = CGRectMake(0, 0, 50, 50);
        attach.image = [UIImage imageNamed:@"example"];
        NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:attach];
        if (isSelect) {
            [self.attributedStr insertAttributedString:str atIndex:range.location];
        } else {
            [self.attributedStr replaceCharactersInRange:NSMakeRange(range.location, str.length) withString:@""];
        }
    }
    self.label.attributedText = self.attributedStr;
}


#pragma mark --------------------------初始化UI---------------------------

#pragma mark --------------------------懒加载-----------------------------
#pragma mark tableView-lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.backgroundColor = [UIColor clearColor];
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:yhCellID];
    }
    return _tableView;
}
- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 300, 40)];
        _label.font = FONT(16);
        _label.userInteractionEnabled = YES;
    }
    return _label;
}
@end


