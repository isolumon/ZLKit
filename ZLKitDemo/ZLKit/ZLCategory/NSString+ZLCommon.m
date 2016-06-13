//
//  NSString+ZLCommon.m
//  FZLCreateProject
//
//  Created by iLuffy  on 16/6/12.
//  Copyright © 2016年 solumon. All rights reserved.
//

#import "NSString+ZLCommon.h"
#import "NSNumber+ZLCommon.h"

@implementation NSString (ZLCommon)





/**
 *  去除空格
 *
 *  @return 新字符串
 */

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

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
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode
{
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

/**
 *  文本宽度
 *
 *  @param font 字体
 *
 *  @return 文本宽度
 */
- (CGFloat)widthForFont:(UIFont *)font {
    CGSize size = [self sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

/**
 *  文本高度
 *
 *  @param font  字体
 *  @param width 给定的宽
 *
 *  @return 文本高度
 */
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

#pragma mark - 数据类型转换
- (char)charValue {
    return self.numberValue.charValue;
}

- (unsigned char) unsignedCharValue {
    return self.numberValue.unsignedCharValue;
}

- (short) shortValue {
    return self.numberValue.shortValue;
}

- (unsigned short) unsignedShortValue {
    return self.numberValue.unsignedShortValue;
}

- (unsigned int) unsignedIntValue {
    return self.numberValue.unsignedIntValue;
}

- (long) longValue {
    return self.numberValue.longValue;
}

- (unsigned long) unsignedLongValue {
    return self.numberValue.unsignedLongValue;
}

- (unsigned long long) unsignedLongLongValue {
    return self.numberValue.unsignedLongLongValue;
}

- (NSUInteger) unsignedIntegerValue {
    return self.numberValue.unsignedIntegerValue;
}

- (NSNumber *)numberValue {
    return [NSNumber numberWithString:self];
}



@end
