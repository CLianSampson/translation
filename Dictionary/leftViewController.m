//
//  leftViewController.m
//  Dictionary
//
//  Created by  chenlian on 15/6/19.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import "leftViewController.h"
#import <RESideMenu.h>
#import "translateViewController.h"


#define IPONEWIDTH [UIScreen mainScreen].bounds.size.width
#define IPONEHEIGHT [UIScreen mainScreen].bounds.size.height

@interface leftViewController ()

@end

@implementation leftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:69/255.0 green:203/255.0 blue:181/255.0 alpha:1];
    
    UIImageView *iconImage=[[UIImageView alloc]init];
    iconImage.frame=CGRectMake(30, 40, 60, 60);
    iconImage.image=[UIImage imageNamed:@"kevin"];
    iconImage.layer.cornerRadius=30;
    iconImage.layer.masksToBounds=YES;
    [self.view addSubview:iconImage];
    
    
    
    UILabel *name=[[UILabel alloc]init];
    name.frame=CGRectMake(110, 40, IPONEWIDTH-110, 40);
    name.text=@"Maleis APP";
    name.textColor=[UIColor whiteColor];
    name.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:name];
    
    UILabel *description=[[UILabel alloc]init];
    description.frame=CGRectMake(110, 80, IPONEWIDTH-110, 20);
    description.textColor=[UIColor groupTableViewBackgroundColor];
    description.text=@"Translate to and from maleis";
    description.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:description];
    
    
    UIButton *button1=[[UIButton alloc]init];
    button1.frame=CGRectMake(60, 140, IPONEWIDTH-60, 60) ;
    [button1 setTitle:@"Maleis to english" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(jump1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2=[[UIButton alloc]init];
    button2.frame=CGRectMake(60, 200, IPONEWIDTH-60, 60) ;
    [button2 setTitle:@"Maleis to dutch" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button2 addTarget:self action:@selector(jump2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3=[[UIButton alloc]init];
    button3.frame=CGRectMake(60, 260, IPONEWIDTH-60, 60) ;
    [button3 setTitle:@"Dutch to maleis" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button3 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button3 addTarget:self action:@selector(jump3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];

    UIButton *button4=[[UIButton alloc]init];
    button4.frame=CGRectMake(60, 320, IPONEWIDTH-60, 60) ;
    [button4 setTitle:@"English to maleis" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button4 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button4 addTarget:self action:@selector(jump4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
    UIButton *button5=[[UIButton alloc]init];
    button5.frame=CGRectMake(60, 380, IPONEWIDTH-60, 60) ;
    [button5 setTitle:@"About" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button5 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button5 addTarget:self action:@selector(jump5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
}


-(void)jump1{
    [self.sideMenuViewController hideMenuViewController];
    self.setType(@"Maleis to english");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Maleis to english" object:nil];
}

-(void)jump2{
    [self.sideMenuViewController hideMenuViewController];
    self.setType(@"Maleis to dutch");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Maleis to dutch" object:nil];
}

-(void)jump3{
    [self.sideMenuViewController hideMenuViewController];
    self.setType(@"Dutch to maleis");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Dutch to maleis" object:nil];
}

-(void)jump4{
    [self.sideMenuViewController hideMenuViewController];
    self.setType(@"English to maleis");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"English to maleis" object:nil];
}

-(void)jump5{
    
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
