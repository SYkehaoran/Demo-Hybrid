//
//  Global.m
//  Demo-Hybird
//
//  Created by 柯浩然 on 8/29/18.
//  Copyright © 2018 柯浩然. All rights reserved.
//

#import "Global.h"

@implementation Global
- (void)changeBackgroundColor:(JSValue *)colorValue{
    self.ownViewcontroller.view.backgroundColor = [UIColor colorWithRed:colorValue[@"r"].toDouble green:colorValue[@"g"].toDouble blue:colorValue[@"b"].toDouble alpha:colorValue[@"a"].toDouble];
}
@end
