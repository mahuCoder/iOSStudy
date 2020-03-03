//
//  WeakScriptMessageDelegate.m
// 
//
//  Created by 胡雪刚 on 2019/10/25.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import "WeakScriptMessageDelegate.h"

@implementation WeakScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    if (self = [super init]) {
        self.scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}
- (void)dealloc {
    NSLog(@"webView代理释放了");
}
@end
