//
//  BBMDefaultRespone.m
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "BBMDefaultRespone.h"
#import "NSDictionary+Overcoat.h"

@implementation BBMDefaultRespone

// Default GET list objects always have meta & objects section
// need check response to make sure we get correct root key
// for serialize data
+ (NSString *)resultKeyPathForJSONDictionary:(NSDictionary *)JSONDictionary;
{
  if (JSONDictionary[@"objects"] && JSONDictionary[@"meta"]) {
    return @"objects";
  } else {
    return nil;
  }
}

/**
 *  Override method to help response meta object inside json response
 *  instead of only response array of object
 *
 *  @param HTTPResponse The HTTPResponse
 *  @param JSONObject   The JSONObject
 *  @param resultClass  The resultClass
 *
 *  @return BBMDefaultRespone
 */
+ (instancetype)responseWithHTTPResponse:(NSHTTPURLResponse *)HTTPResponse
                              JSONObject:(id)JSONObject
                             resultClass:(Class)resultClass;
{
  BBMDefaultRespone *response = [super responseWithHTTPResponse:HTTPResponse JSONObject:JSONObject resultClass:resultClass];
  
  if ([JSONObject isKindOfClass:[NSDictionary class]] &&
      (NSDictionary *)JSONObject[@"meta"]) {
    
    NSValueTransformer *valueTransformer = [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[Meta class]];
    NSDictionary *metaJSONObject;
    
    metaJSONObject = [(NSDictionary *)JSONObject ovc_objectForKeyPath:@"meta"];
    
    response.meta = [valueTransformer transformedValue:metaJSONObject];
  }
  
  return response;
}

@end
