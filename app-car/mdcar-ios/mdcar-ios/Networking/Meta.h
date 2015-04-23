//
//  Meta.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface Meta : MTLModel <MTLJSONSerializing>
@property (copy, nonatomic) NSNumber *limit;
@property (copy, nonatomic) NSNumber *offset;
@property (copy, nonatomic) NSNumber *total;
@end
