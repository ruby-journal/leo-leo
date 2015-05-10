//
//  UserClient.m
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "UserClient.h"
#import "User.h"
#import "constants.h"

@implementation UserClient

- (NSString *)urlRoot
{
  return @"users";
}

+ (NSDictionary *)modelClassesByResourcePath;
{
  return @{
           @"users": [User class],
           @"users/*": [User class],
           };
}

- (void)getResources:(void (^)(id resources, Meta *meta))success
             failure:(void (^)(NSError *error))failure
              offset:(NSNumber *)offset
               offset:(NSNumber *)limit
{
}

- (void)getResources:(void (^)(id resources))success
             failure:(void (^)(NSError *error))failure;
{
  [self doGET:[NSString stringWithFormat:@"%@", [self urlRoot]] success:success failure:failure];
}

+ (instancetype)sharedManager;
{
  static UserClient *sharedManager = nil;
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    sharedManager = [super sharedManager];
    // Listent change state of http session to add or remove api key
    [[NSNotificationCenter defaultCenter] addObserver:sharedManager
                                             selector:@selector(didSessionChangeStateNotification:)
                                                 name:@"HTTPSessionChangeState"
                                               object:nil];
    
  });

  return sharedManager;
}

- (void)checkChangeHTTPSessionState;
{
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  NSString *apiKey = [ud objectForKey:@"apiKey"];
  NSString *username = [ud objectForKey:@"userName"];
  
  if (apiKey && username && ![apiKey isEqualToString:@""]) {
    // Notify for other client known this change
    NSMutableDictionary *userInfo = [NSMutableDictionary new];
    [userInfo setObject:apiKey forKey:kStringUserInfoApiKey];
    [userInfo setObject:username forKey:kStringUserInfoUserName];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HTTPSessionChangeState"
                                                        object:nil
                                                      userInfo:userInfo];
  }
}

@end
