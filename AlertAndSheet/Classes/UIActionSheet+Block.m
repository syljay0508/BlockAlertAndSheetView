//
//  UIActionSheet+Block.m
//  
//
//  Created by 孙英伦 on 15/6/11.
//
//

#import "UIActionSheet+Block.h"
#import <objc/runtime.h>

static char key;

@implementation UIActionSheet (Block)

- (void)showSheetInView:(UIView *)view withHandle:(SheetCallBack)handle{
    if (view == nil || [view isMemberOfClass:[UIView class]] == NO) {
        return;
    }
    
    if (handle) {
        objc_removeAssociatedObjects(self);
        
        objc_setAssociatedObject(self, &key, handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
        self.delegate = self;
    }
    [self showInView:view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    SheetCallBack handle = objc_getAssociatedObject(self, &key);
    if (handle) {
        handle(actionSheet, buttonIndex);
    }
}

@end
