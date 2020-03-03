//
//  WeakScriptMessageDelegate.h

//
//  Created by 胡雪刚 on 2019/10/25.
//  Copyright © 2019 yunhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>


@property (nonatomic, weak) id <WKScriptMessageHandler> scriptDelegate;


- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;

@end

NS_ASSUME_NONNULL_END
