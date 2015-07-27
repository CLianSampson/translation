//
//  ViewController.m
//  Dictionary
//
//  Created by  chenlian on 15/6/19.
//  Copyright (c) 2015年 Sourcing Asia. All rights reserved.
//

#import "ViewController.h"
#import <RESideMenu.h>
#import "translateViewController.h"
#import "myButton.h"
#import "circleButton.h"
#import "NetWithBlock.h"


#define IPONEWIDTH [UIScreen mainScreen].bounds.size.width
#define IPONEHEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    NSMutableArray *english;
    NSMutableArray *dutch;
    NSMutableArray *maleis;
    NSString *status;
    BOOL isFiltered; // 标识是否正在搜素
    NSMutableArray *filterArry;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"这个先执行");
    
    self.view.backgroundColor=[UIColor blackColor];
    UIImageView *backImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, IPONEWIDTH, 200)];
    backImage.image=[UIImage imageNamed:@"background-image"];
    [self.view addSubview:backImage];
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 220, IPONEWIDTH, IPONEHEIGHT-220)];
    self.tableView.backgroundColor=[UIColor whiteColor];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    
    UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(70, 40,IPONEWIDTH-140, 30)];
    textField.delegate=self;
    textField.layer.cornerRadius=10;
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [[UIColor whiteColor] CGColor];
    textField.backgroundColor=[UIColor clearColor];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Search" attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    textField.attributedPlaceholder = str;
    textField.textAlignment=NSTextAlignmentCenter;
    // 利用通知中心检测UITextField文本内容的改变
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldChanged:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:textField];
    [self.view addSubview:textField];
    
//    myButton *leftButton=[[myButton alloc]init];
//    leftButton.frame=CGRectMake(20, 40, 30, 30) ;
//    leftButton.backgroundColor=[UIColor clearColor];
//    [leftButton addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:leftButton];
    
    
    UIButton *leftButton=[[UIButton alloc]init];
    leftButton.frame=CGRectMake(20, 40, 30, 30) ;
//    leftButton.backgroundColor=[UIColor clearColor];
    [leftButton addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"menu-icoon"] forState:UIControlStateNormal];
    [self.view addSubview:leftButton];

    
    circleButton *rightButton=[[circleButton alloc]init];
    rightButton.frame=CGRectMake(IPONEWIDTH-50, 40, 30, 30);
    [self.view addSubview:rightButton];
    [rightButton addTarget:self action:@selector(search ) forControlEvents:UIControlEventTouchUpInside];
    rightButton.backgroundColor=[UIColor clearColor];
    
    
    _labelStatus=[[UILabel alloc]init];
    _labelStatus.frame=CGRectMake(10, 90, 200, 40) ;
    _labelStatus.textColor=[UIColor whiteColor];
    _labelStatus.text=@"Maleis to english";
    _labelStatus.font=[UIFont systemFontOfSize:25];
    [self.view addSubview:_labelStatus];
    
    [self netRequest];
}


-(void)netRequest{
    
    NSString *string=@"http://dictionary.ontwikkelomgeving.info/";
    [NetWithBlock urlString:string withBlock:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data!=nil) {
            NSDictionary *dictonary=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@",dictonary);
            NSArray *words=[dictonary objectForKey:@"words"];
            NSLog(@"words 是 : %@",words);
            
            english=[[NSMutableArray alloc]init];
            for (int i=0; i<words.count; i++) {
                NSString *englishWord=[[NSString alloc]init];
                englishWord =[[words objectAtIndex:i]objectForKey:@"english"];
                [english addObject:englishWord];
            }
            
            
            dutch=[[NSMutableArray alloc]init];
            for (int i=0; i<words.count; i++) {
                NSString *dutchWord=[[NSString alloc]init];
                dutchWord =[[words objectAtIndex:i]objectForKey:@"dutch"];
                [dutch addObject:dutchWord];
            }
           
            
            
            maleis=[[NSMutableArray alloc]init];
            for (int i=0; i<words.count; i++) {
                NSString *maleisWord=[[NSString alloc]init];
                maleisWord =[[words objectAtIndex:i]objectForKey:@"maleis"];
                [maleis addObject:maleisWord];
            }
            
            [self performSelectorOnMainThread:@selector(creatTableView) withObject:nil waitUntilDone:YES];
        }
        
    }];

}

-(void)creatTableView{
    [self.tableView reloadData];  //必须放在主线程中才有效
}


-(void)showLeft{
    [self presentLeftMenuViewController:nil];
}


-(void)search{

}

#pragma mark -UITextField abbsever
-(void)textFieldChanged:(NSNotification *)notify {
    UITextField *textField=(UITextField *)notify.object;
    
    if (textField.text.length==0) {
        isFiltered=NO;
        [self.tableView reloadData];
        return;
    }
   
    isFiltered=YES;
    // 谓词搜索
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains [cd] %@",textField.text];
    
    if ([self.labelStatus.text isEqualToString:@"English to maleis"]) {
        filterArry =  [[NSMutableArray alloc] initWithArray:[english filteredArrayUsingPredicate:predicate]];
    }
    else if ([self.labelStatus.text isEqualToString:@"Dutch to maleis"]){
         filterArry =  [[NSMutableArray alloc] initWithArray:[dutch filteredArrayUsingPredicate:predicate]];
    }
    else if ([self.labelStatus.text isEqualToString:@"Maleis to english"]){
         filterArry =  [[NSMutableArray alloc] initWithArray:[maleis filteredArrayUsingPredicate:predicate]];
    }
    else if ([self.labelStatus.text isEqualToString:@"Maleis to dutch"]){
         filterArry =  [[NSMutableArray alloc] initWithArray:[maleis filteredArrayUsingPredicate:predicate]];
    }
   [self.tableView reloadData];
}

#pragma mark -tableView dataSourceDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (isFiltered) {
        return filterArry.count;
    }
    return english.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    if (isFiltered) {
        cell.textLabel.text=[filterArry objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"list-view-icoon"];
        return cell;
    }
    
    
    
    
    if ([self.labelStatus.text isEqualToString:@"English to maleis"]) {
         cell.textLabel.text = [english objectAtIndex:indexPath.row];
         status=@"English to maleis";
    }
    else if ([self.labelStatus.text isEqualToString:@"Dutch to maleis"]){
        cell.textLabel.text = [dutch objectAtIndex:indexPath.row];
        status=@"Dutch to maleis";
    }
    else if ([self.labelStatus.text isEqualToString:@"Maleis to english"]){
        cell.textLabel.text = [maleis objectAtIndex:indexPath.row];
        status=@"Maleis to english";
    }
    else if ([self.labelStatus.text isEqualToString:@"Maleis to dutch"]){
        cell.textLabel.text = [maleis objectAtIndex:indexPath.row];
        status=@"Maleis to dutch";
    }
    cell.imageView.image = [UIImage imageNamed:@"list-view-icoon"];
    return cell;
}


#pragma mark -tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    translateViewController *VC=[[translateViewController alloc]init];
    
    if (isFiltered) {
        NSString *str=[filterArry objectAtIndex:indexPath.row];
        VC.originalWord=str;
        
        
        NSInteger num;
        
        if ([status isEqualToString:@"English to maleis"]) {
            for (NSInteger i=0; i<maleis.count; i++) {
                if (english[i]==str) {
                    num=i;
                    break;
                }
            }
           VC.tranlationWord=[maleis objectAtIndex:num];
        }
        else if ([status isEqualToString:@"Dutch to maleis"]){
            for (NSInteger i=0; i<maleis.count; i++) {
                if (dutch[i]==str) {
                    num=i;
                    break;
                }
            }
            VC.tranlationWord=[maleis objectAtIndex:num];
        }
        else if ([status isEqualToString:@"Maleis to english"]){
            for (NSInteger i=0; i<maleis.count; i++) {
                if (maleis[i]==str) {
                    num=i;
                    break;
                }
            }
            VC.tranlationWord=[english objectAtIndex:num];
        }
        else if ([status isEqualToString:@"Maleis to dutch"]){
            for (NSInteger i=0; i<maleis.count; i++) {
                if (maleis[i]==str) {
                    num=i;
                    break;
                }
            }
            VC.tranlationWord=[dutch objectAtIndex:num];
        }
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [self.view.window.layer addAnimation:transition forKey:nil];
        
        [self presentViewController:VC animated:YES completion:nil];
        
        return;

    }
    
    
    if ([status isEqualToString:@"English to maleis"]) {
            VC.originalWord=[english objectAtIndex:indexPath.row];
            VC.tranlationWord=[maleis objectAtIndex:indexPath.row];
        }
    else if ([status isEqualToString:@"Dutch to maleis"]){
            VC.originalWord=[dutch objectAtIndex:indexPath.row];
            VC.tranlationWord=[maleis objectAtIndex:indexPath.row];
        }
    else if ([status isEqualToString:@"Maleis to english"]){
            VC.originalWord=[maleis objectAtIndex:indexPath.row];
            VC.tranlationWord=[english objectAtIndex:indexPath.row];
        }
    else if ([status isEqualToString:@"Maleis to dutch"]){
            VC.originalWord=[maleis objectAtIndex:indexPath.row];
            VC.tranlationWord=[dutch objectAtIndex:indexPath.row];
        }
    
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:transition forKey:nil];
    
    [self presentViewController:VC animated:YES completion:nil];
    
    return;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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

@end
