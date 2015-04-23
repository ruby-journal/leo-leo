//
//  User.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface User : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *userId;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *gender;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *imageUrl;

@end
