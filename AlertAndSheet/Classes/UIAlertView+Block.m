//
//  UIAlertView+Block.m
//  
//
//  Created by 孙英伦 on 15/6/10.
//
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

static char key;

@implementation UIAlertView (Block)

- (void)showAlertWithHandle:(AlertCallBack)handle{
    if (handle) {
        objc_removeAssociatedObjects(self);
        
        objc_setAssociatedObject(self, &key, handle, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        self.delegate = self;
    }
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    AlertCallBack handle = objc_getAssociatedObject(self, &key);
    if (handle) {
        handle(alertView, buttonIndex);
    }
}

@end
