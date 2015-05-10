//
//  BaseHTTPSessionManager.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

//#import "OVCHTTPSessionManager.h"
#import "AFHTTPSessionManager.h"

#import <Mantle/Mantle.h>

#import <Overcoat/Overcoat.h>

#import "Meta.h"

@interface BaseHTTPSessionManager : AFHTTPSessionManager

+ (instancetype) sharedManager;

#pragma mark - Operation methods

- (void)doGET:(NSString *)url
      success:(void (^)(id obj))success
      failure:(void (^)(NSError *error))failure;

@end
