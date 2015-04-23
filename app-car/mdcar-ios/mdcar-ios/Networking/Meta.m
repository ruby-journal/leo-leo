//
//  Meta.m
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "Meta.h"

@implementation Meta

+ (NSDictionary *)JSONKeyPathsByPropertyKey;
{
  return @{
           @"total": @"total_count"
           };
}

@end
