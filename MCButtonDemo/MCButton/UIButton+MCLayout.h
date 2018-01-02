//
//  UIButton+MCLayout.h
//  MCButtonDemo
//
//  Created by chh on 2018/1/2.
//  Copyright © 2018年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MCLayoutStatus){
    /** 正常位置，图左字右 */
    MCLayoutStatusNormal,
    /** 图右字左 */
    MCLayoutStatusImageRight,
    /** 图上字下 */
    MCLayoutStatusImageTop,
    /** 图下字上 */
    MCLayoutStatusImageBottom,
};
@interface UIButton (MCLayout)
- (void)layoutWithStatus:(MCLayoutStatus)status andMargin:(CGFloat)margin;
@end
