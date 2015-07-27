//
//  leftViewController.h
//  Dictionary
//
//  Created by  chenlian on 15/6/19.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myblock)(NSString *);

@interface leftViewController : UIViewController


@property(nonatomic,copy)myblock setType;

@end
