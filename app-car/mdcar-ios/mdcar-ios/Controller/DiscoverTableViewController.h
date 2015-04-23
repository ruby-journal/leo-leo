//
//  DiscoverTableViewController.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfileTableViewCell.h"

@interface DiscoverTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *usersArray;

@end
