//
//  ViewController.m
//  line_animation
//
//  Created by Xmart on 15/12/22.
//  Copyright © 2015年 Xmart. All rights reserved.
//

#import "ViewController.h"
#import "were.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    were *we = [[were alloc]init];
    we.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    we.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:we];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
