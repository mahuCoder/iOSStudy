//
//  YXYIosBasicWebViewController.m
//  iOSStudy
//
//  Created by 胡雪刚 on 2020/5/19.
//  Copyright © 2020 yunhun. All rights reserved.
//

#import "YXYIosBasicWebViewController.h"
#import <WebKit/WebKit.h>
@interface YXYIosBasicWebViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation YXYIosBasicWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//    }];
    NSURL *url = [NSURL URLWithString:self.path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:(NSURLRequestUseProtocolCachePolicy) timeoutInterval:10];
    [self.webView loadRequest:request];
    
    [self.webView addObserver:self forKeyPath:@"titile" options:(NSKeyValueObservingOptionNew) context:nil];
    
    // Do any additional setup after loading the view.
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"title"]) {
        self.title = self.webView.title;
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    }
    return _webView;
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
