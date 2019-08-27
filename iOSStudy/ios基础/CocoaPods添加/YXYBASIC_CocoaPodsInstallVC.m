//
//  YXYBASIC_CocoaPodsInstallVC.m
//  iOS技术学习总结
//
//  Created by 胡雪刚 on 2019/5/8.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "YXYBASIC_CocoaPodsInstallVC.h"

@interface YXYBASIC_CocoaPodsInstallVC ()

@end

@implementation YXYBASIC_CocoaPodsInstallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //参考：https://www.jianshu.com/p/1bb0ad42cb2e
    
    //Step1:安装需要用到Ruby，虽然Mac自带了Ruby，不过版本有点老了，最好更新一下
    //sudo gem update --system
    //因为Ruby的软件源rubygems.org被屏蔽了，所以要更换源
    //接下来查看下源路径是否更换了
    //gem sources -l
    //如果不是https://gems.ruby-china.com/ 输入gem sources --remove “刚才得到的地址”
    //gem sources --add https://gems.ruby-china.com/。接下来查看下源路径是否更换了
    //gem sources -l
    //如果是：跳过刚才这一步
    //接下来安装Cocoapods了
    //
    //sudo gem install -n /usr/local/bin cocoapods
    //等待....
    //安装完后你可以输入下面的命令查看是否成功，当前CocoaPods版本   pod --version
    //安装完cocoapods后进行最蛋疼的一步，设置仓库，就是把所有上传到cocoapods的第三方框架下载每个
    //版本和网络地址以及一些其他描述信息到本地，因为服务器在国外所以比较蛋疼，网速好的直接无视我的
    //话输完下面命令后跳到下载中说明-。-
    //pod step
    
    
    
}


@end
