//
//  ViewController.m
//  TapCounter1
//
//  Created by Student P_07 on 14/09/16.
//  Copyright © 2016 gunchai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
#define kHeightOfResetButton 50.0

#define kHeightOfStatusBar 20.0

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    screenHeight= [[UIScreen mainScreen]bounds].size.height;
    screenWidth = [[UIScreen mainScreen]bounds].size.width;
    
    addButton = [[UIButton alloc]initWithFrame:CGRectMake(0, screenHeight/2-kHeightOfResetButton, screenWidth, screenHeight/2)];
    
    addButton.backgroundColor = [UIColor blackColor];
    [addButton addTarget:self action:@selector(handleAdd) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:addButton];
    
    
    subButton = [[UIButton alloc]initWithFrame:CGRectMake(0, kHeightOfStatusBar, screenWidth, screenHeight-kHeightOfStatusBar-kHeightOfResetButton-300)];
    subButton.backgroundColor=[UIColor blackColor];
    [subButton addTarget:self action:@selector(handleSub) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:subButton];
    
    ResetButton = [[UIButton alloc]initWithFrame:CGRectMake(0, screenHeight-kHeightOfResetButton, screenWidth, kHeightOfResetButton)];
    [ResetButton addTarget:self action:@selector(handleReset) forControlEvents:UIControlEventTouchUpInside];
    [ResetButton setTitle:@"Reset" forState:UIControlStateNormal];
    [ResetButton setTitle:@"Reseting..." forState:UIControlStateHighlighted];
    ResetButton.tintColor = [UIColor whiteColor];
    ResetButton.backgroundColor= [UIColor magentaColor];
    
    [self.view addSubview:ResetButton];

    count = [[UILabel alloc]initWithFrame:CGRectMake(0, kHeightOfStatusBar-30, screenWidth, screenHeight-kHeightOfResetButton+kHeightOfResetButton)];
    count.textColor = [UIColor whiteColor];
    count.textAlignment= NSTextAlignmentCenter;
    count.font = [UIFont systemFontOfSize:125];
   // count.font=[UIFont boldSystemFontOfSize:100];
    [self handleReset];
    [self.view addSubview:count];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)handleAdd{
    NSString *currentValue= count.text;
    int currentValueInt = currentValue.intValue;
    currentValueInt = currentValueInt+1;
    NSString *newValue= [NSString stringWithFormat:@"%d",currentValueInt];
    
    count.text= newValue;
    
}

-(void)handleSub{
    NSString *currentValue = count.text;
    int currentValueInt = currentValue.intValue;
    currentValueInt= currentValueInt-1;
    NSString *newValue = [NSString stringWithFormat:@"%d",currentValueInt];
    count.text = newValue;
}

-(void) handleReset{
    count.text=@" 0 ";
}



@end
