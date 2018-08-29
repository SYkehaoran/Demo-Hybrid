//
//  Global.h
//  Demo-Hybird
//
//  Created by 柯浩然 on 8/29/18.
//  Copyright © 2018 柯浩然. All rights reserved.
//
#import <JavaScriptCore/JavaScriptCore.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol GlobalProtocol <JSExport>

- (void)changeBackgroundColor:(JSValue *)colorValue;

@end

@interface Global : NSObject<GlobalProtocol>
@property(nonatomic, strong) UIViewController *ownViewcontroller;
@end
