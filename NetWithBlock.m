//
//  NetWithBlock.m
//  block网络封装
//
//  Created by  chenlian on 15/6/4.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import "NetWithBlock.h"



@implementation NetWithBlock




+(void)urlString:(NSString *)string withBlock:(myBlock)block{
    
    
    NSLog(@"block的大小是 : %lu",sizeof(block));
    
    NSString *urlString=[string stringByReplacingOccurrencesOfString: @ " " withString: @ "%20"];
    NSURL *url=[NSURL URLWithString:urlString];
//    NSLog(@"--- uuuuuu : %@",uuuuu);
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //开始执行自定义的block
        block(response,data,connectionError);
    }];
}


@end
