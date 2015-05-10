//
//  User.m
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "User.h"

@implementation User

+ (NSDictionary *)JSONKeyPathsByPropertyKey;
{
  return @{
          @"userId": @"id",
          @"imageUrl": @"image_url"
           };
}

+ (NSValueTransformer *)userIdJSONTransformer;
{
  return [MTLValueTransformer reversibleTransformerWithBlock:^(NSNumber *number) {
    return [NSString stringWithFormat:@"%@",number];
  }];
}

+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
  if (JSONDictionary[@"image_url"] != nil) {
    return User.class;
  }
  
  if (JSONDictionary[@"id"] != nil) {
    return User.class;
  }
  
  NSAssert(NO, @"No matching class for the JSON dictionary '%@'.", JSONDictionary);
  return self;
}

@end
