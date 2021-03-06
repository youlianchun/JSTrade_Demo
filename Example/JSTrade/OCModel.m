//
//  OCModel.m
//  WKWebView_JSTrade
//
//  Created by YLCHUN on 2017/3/14.
//  Copyright © 2017年 ylchun. All rights reserved.
//

#import "OCModel.h"
#import <WebKit/WebKit.h>
#import "JSModel.h"
#import "JSModel_Document.h"

@interface OCModel ()
@property (nonatomic, strong) JSModel* jsModel;
@property (nonatomic, strong) JSModel_Document* document;
@end
@implementation OCModel

-(JSModel_Document *)document {
    if (!_document) {
        _document = [[JSModel_Document alloc] init];
    }
    return _document;
}

-(JSModel *)jsModel {
    if (!_jsModel) {
        _jsModel = [[JSModel alloc] init];
        JSTradeImportSpaceNameSet(_jsModel, @"jsModel");
    }
    return _jsModel;
}

-(int)func0 {
    [JSExportManager asyncCallJSAfterReturn:^{
        self.document.title = @"title";
        self.document.bgColor = @"#E6E6FA";
    }];
    return 1;
}

-(void)func1:(id)p {
    id color = self.document.bgColor;
    NSLog(@"%@",color);
//    id i = [self.document getElementsByName:@"but1"];//类型不支持
//    NSLog(@"%@",i);
}

-(void)func2:(JSExportCallBack)cb {
    cb(@"func2:");
}

-(void)func3:(id)p cb:(JSExportCallBack)cb {
    cb([NSString stringWithFormat:@"func3:cb: %@", p]);
}

-(void)func4:(int)p p2:(NSString*)p2 cb:(JSExportCallBack)cb {
//    NSString *s = self.jsModel.str;
//    self.jsModel.str = @"s1";
//    s = self.jsModel.str;
    int i = [self.jsModel sum:1 b:4];
    id a = @[@{@"a":@"1",@"b":@"2"}];
    NSString *s = [self.jsModel obj:a];
    [self.jsModel showMessage:[NSString stringWithFormat:@"%d, %@", i, s]];
     cb([NSString stringWithFormat:@"func4:p2:cb: %d %@", p, p2]);
}

-(NSArray <JSImportObject> *)jsImportModels {
    return @[self.jsModel, self.document];
}

@end
