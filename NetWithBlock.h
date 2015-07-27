//
//  NetWithBlock.h
//  block网络封装
//
//  Created by  chenlian on 15/6/4.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^myBlock)(NSURLResponse *response, NSData *data, NSError *connectionError);


@interface NetWithBlock : NSObject



+(void)urlString:(NSString *)string withBlock:(myBlock)block;


@end
