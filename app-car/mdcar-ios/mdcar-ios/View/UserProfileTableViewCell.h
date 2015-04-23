//
//  UserProfileTableViewCell.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserProfileTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userAvatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *userAboutLabel;

@end
