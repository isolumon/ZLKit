//
//  NSString+ZLCommon.h
//  FZLCreateProject
//
//  Created by iLuffy  on 16/6/12.
//  Copyright © 2016年 solumon. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (ZLCommon)








/**
 *  去除空格
 *
 *  @return 新字符串
 */

- (NSString *)stringByTrim;

/**
 *  获取字符串的Size
 *
 *  @param font          字体大小
 *  @param size
 可以使用该方法计算文本绘制所需的空间。
 *   size 参数是一个constraint ,用于在绘制文本时作为参考。但是，如果绘制完整个文本需要更大的空间，则返回的矩形大小可能比 size 更大。一般，绘制时会采用constraint 提供的宽度，但高度则会根据需要而定。
 *  @param lineBreakMode 换行模式
 *
 *  @return 字符串所占的矩形区域的Size
 */
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

@end
