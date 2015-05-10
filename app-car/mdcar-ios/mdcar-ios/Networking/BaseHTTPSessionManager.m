//
//  BaseHTTPSessionManager.m
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "BaseHTTPSessionManager.h"
#import "BBMDefaultRespone.h"
#import "DefaultErrorResponse.h"

#define APIURLString @"http://localhost:2300/api/v1/"

@implementation BaseHTTPSessionManager

static NSString *apiKey;
static NSString *username;

// ********************************************************************
#pragma mark -
#pragma mark - ** Override **

/**
 *  Subclass must override this method to response correct resounce url
 *
 *
 *  @return The resouce root url
 */
- (NSString *)urlRoot;
{
  return nil;
}

// ********************************************************************
#pragma mark -
#pragma mark - ** Class configuration **

+ (instancetype)sharedManager;
{
  static BaseHTTPSessionManager *__sharedManager;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    __sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:APIURLString]];
  });
  return __sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url;
{
  self = [super initWithBaseURL:url];
  
  if (self) {
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
  }
  
  return self;
}

// Can override this method from sub class
+ (NSDictionary *)modelClassesByResourcePath;
{
  return @{};
}

// Can override this method from sub class
+ (Class)responseClass;
{
  return [BBMDefaultRespone class];
}

+ (Class)errorModelClass;
{
  return [BaseHTTPSessionManager class];
}


// ********************************************************************
#pragma mark -
#pragma mark - ** Operation methods **

- (void)doGET:(NSString *)url
      success:(void (^)(id obj))success
      failure:(void (^)(NSError *error))failure;
{
  [self doGET:url parameters:nil success:success failure:failure];
}

- (void)doGET:(NSString *)url
   parameters:(NSDictionary *)parameters
      success:(void (^)(id obj))success
      failure:(void (^)(NSError *error))failure;
{

  
  [self GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
    success(responseObject);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    failure(error);
  }];
}


- (void)didSessionChangeStateNotification:(NSNotification *)notification;
{
  NSDictionary *userInfo = notification.userInfo;
  if (userInfo[@"apiKey"]) {
    // Add api key to request
    apiKey = userInfo[@"apiKey"];
    username = userInfo[@"username"];
  } else {
    // Remove out api key from request
    [self.requestSerializer setValue:nil forHTTPHeaderField:@"Authorization"];
    apiKey = nil;
    username = nil;
  }
}

@end
