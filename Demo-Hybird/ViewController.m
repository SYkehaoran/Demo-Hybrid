//
//  ViewController.m
//  Demo-Hybird
//
//  Created by 柯浩然 on 8/29/18.
//  Copyright © 2018 柯浩然. All rights reserved.
//

#import "ViewController.h"
#import "Global.h"
@interface ViewController ()
@property(nonatomic, strong) Global *global;
@property(nonatomic, strong) NSMutableArray *actionArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.actionArray = [NSMutableArray array];
    
    self.global = [Global new];
    self.global.ownViewcontroller = self;
    JSContext *context = [JSContext new];
    [context setObject:self.global forKeyedSubscript:@"Global"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    NSData *jsData = [NSData dataWithContentsOfFile:path];
    NSString *jsString = [[NSString alloc ] initWithData:jsData encoding:NSUTF8StringEncoding];
    JSValue *jsValue = [context evaluateScript:jsString];
    for (int i = 0; i<jsValue.toArray.count; i++) {
        
        JSValue *subValue = [jsValue objectAtIndexedSubscript:i];
        if ([[subValue objectForKeyedSubscript:@"typeName"].toString isEqualToString:@"Button"]) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
            [button setTitle:subValue[@"text"].toString forState:UIControlStateNormal];
            [button addTarget: self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = self.actionArray.count;
            [self.actionArray addObject:subValue[@"callFunc"]];
            [self.view addSubview:button];
        }
    }
}
- (void)buttonClick:(UIButton *)sender {
    JSValue *jsValue = [self.actionArray objectAtIndex:sender.tag];
    [jsValue callWithArguments:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
