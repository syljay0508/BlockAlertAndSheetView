//
//  CustomViewController.m
//  AlertAndSheet
//
//  Created by 孙英伦 on 15/6/10.
//  Copyright (c) 2015年 Keep. All rights reserved.
//

#import "CustomViewController.h"
#import "UIAlertView+Block.h"
#import "UIActionSheet+Block.h"
@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alertShow:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"block" message:@"hahahha" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"取消", nil];
    [alert showAlertWithHandle:^(UIAlertView *alertView, NSInteger index) {
        NSString *title = [alertView buttonTitleAtIndex:index];
        if ([title isEqualToString:@"取消"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (IBAction)sheetShow:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"block" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"取消", nil];
    [sheet showSheetInView:self.view withHandle:^(UIActionSheet *sheet, NSInteger index) {
        NSString *title = [sheet buttonTitleAtIndex:index];
        if ([title isEqualToString:@"取消"]) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)dealloc{
    NSLog(@"[%@ dealloc]", NSStringFromClass([self class]));
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
