//
//  UserClient.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "BaseHTTPSessionManager.h"
#import "User.h"

@interface UserClient : BaseHTTPSessionManager

- (void)getResources:(void (^)(id resources, Meta *meta))success
             failure:(void (^)(NSError *error))failure
              offset:(NSNumber *)offset
              offset:(NSNumber *)limit;

- (void)getResources:(void (^)(id resources))success
             failure:(void (^)(NSError *error))failure;

@end
