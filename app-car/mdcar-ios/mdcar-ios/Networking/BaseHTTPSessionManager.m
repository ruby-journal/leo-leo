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

#define APIURLString @"/api/v1/"

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
  BaseHTTPSessionManager *sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:APIURLString]];
  sharedManager.requestSerializer = [AFJSONRequestSerializer serializer];
  [sharedManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  return sharedManager;
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
      success:(void (^)(id obj, Meta *meta))success
      failure:(void (^)(NSError *error))failure;
{
  [self doGET:url parameters:nil success:success failure:failure];
}

- (void)doGET:(NSString *)url
   parameters:(NSDictionary *)parameters
      success:(void (^)(id obj, Meta *meta))success
      failure:(void (^)(NSError *error))failure;
{
//  [self setApiKeyForRequestSerializer:(AFJSONRequestSerializer *)self.requestSerializer];
  [self GET:url parameters:parameters completion:^(BBMDefaultRespone *response, NSError *error) {
    if (!error) {
      success(response.result, response.meta);
    } else {
      failure(error);
    }
  }];
}

@end
