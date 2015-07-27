//
//  translateViewController.m
//  Dictionary
//
//  Created by  chenlian on 15/6/19.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import "translateViewController.h"
#import <RESideMenu.h>
#import "ViewController.h"

#define IPONEWIDTH [UIScreen mainScreen].bounds.size.width
#define IPONEHEIGHT [UIScreen mainScreen].bounds.size.height

@interface translateViewController ()

@end

@implementation translateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=[UIColor blackColor];
    
    UIView *upView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, IPONEWIDTH, (IPONEHEIGHT-20)/2)];
    upView.backgroundColor=[UIColor colorWithRed:211/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    [self.view addSubview:upView];
    
    UILabel *orginal=[[UILabel alloc]init];
    orginal.frame=CGRectMake(0, 20+(IPONEHEIGHT-20)/2/2-20, IPONEWIDTH, 40);
    orginal.text=self.originalWord;
    orginal.textColor=[UIColor blackColor];
    orginal.textAlignment=NSTextAlignmentCenter;
    orginal.font=[UIFont boldSystemFontOfSize:20];
    [self.view addSubview:orginal];
    
    UIView *downView=[[UIView alloc]initWithFrame:CGRectMake(0, 20+(IPONEHEIGHT-20)/2, IPONEWIDTH, (IPONEHEIGHT-20)/2)];
    downView.backgroundColor=[UIColor colorWithRed:69/255.0 green:203/255.0 blue:181/255.0 alpha:1];
    [self.view addSubview:downView];
    
    
    UILabel *tranlation=[[UILabel alloc]init];
    tranlation.frame=CGRectMake(0, 20+(IPONEHEIGHT-20)/2+(IPONEHEIGHT-20)/2/2-20, IPONEWIDTH, 40);
    tranlation.text=self.tranlationWord;
    tranlation.textColor=[UIColor whiteColor];
    tranlation.textAlignment=NSTextAlignmentCenter;
    tranlation.font=[UIFont boldSystemFontOfSize:20];
    [self.view addSubview:tranlation];
    
    UIButton *backButton=[[UIButton alloc]init];
    backButton.frame=CGRectMake(10, 30, 30, 30);
    [backButton setBackgroundImage:[UIImage imageNamed:@"back-button"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    UILabel *translation=[[UILabel alloc]init];
    translation.frame=CGRectMake(IPONEWIDTH/2-70, 30, 140, 30);
    translation.text=@"translation";
    translation.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:translation];
    
    
    
}

-(void)back{
    //[self.sideMenuViewController showViewController:[[ViewController alloc]init] sender:nil];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [self.view.window.layer addAnimation:transition forKey:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -change statusBar's color
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
