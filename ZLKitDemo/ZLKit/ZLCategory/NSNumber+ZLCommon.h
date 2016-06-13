//
//  NSNumber+ZLCommon.h
//  FZLCreateProject
//
//  Created by iLuffy  on 16/6/12.
//  Copyright © 2016年 solumon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ZLCommon)

/**
 *  NSString 转NSNumber
 *
 *  @param string 传入的String
 *
 *  @return 传出的Number
 */
+ (NSNumber *)numberWithString:(NSString *)string;

@end
