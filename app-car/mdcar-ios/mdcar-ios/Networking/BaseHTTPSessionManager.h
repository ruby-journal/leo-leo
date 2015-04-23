//
//  BaseHTTPSessionManager.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "OVCHTTPSessionManager.h"

#import <Mantle/Mantle.h>

#import "Meta.h"

@interface BaseHTTPSessionManager : OVCHTTPSessionManager

+ (instancetype) sharedManager;

//- (void)didSessionChangeStateNotification:(NSNotification *)notification;

#pragma mark - Operation methods

- (void)doGET:(NSString *)url
      success:(void (^)(id obj, Meta *meta))success
      failure:(void (^)(NSError *error))failure;

@end
