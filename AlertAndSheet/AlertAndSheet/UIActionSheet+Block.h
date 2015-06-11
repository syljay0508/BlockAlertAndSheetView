//
//  UIActionSheet+Block.h
//  
//
//  Created by 孙英伦 on 15/6/11.
//
//

#import <UIKit/UIKit.h>
typedef void (^SheetCallBack)(UIActionSheet *sheet, NSInteger index);

@interface UIActionSheet (Block)

- (void)showSheetInView:(UIView *)view withHandle:(SheetCallBack)handle;

@end
