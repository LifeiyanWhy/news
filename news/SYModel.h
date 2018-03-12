//
//  SYModel.h
//  news
//
//  Created by 李飞艳 on 2017/10/22.
//  Copyright © 2017年 李飞艳. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SYModel : NSObject
@property(nonatomic,strong) NSMutableArray *data;
@property(nonatomic,assign) NSUInteger newsNum;
@property(nonatomic,strong) NSString *title;
@end
