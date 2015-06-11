//
//  UIAlertView+Block.h
//  
//
//  Created by 孙英伦 on 15/6/10.
//
//

#import <UIKit/UIKit.h>
typedef void (^AlertCallBack)(UIAlertView *alertView, NSInteger index);
@interface UIAlertView (Block)

- (void)showAlertWithHandle:(AlertCallBack)handle;

@end
