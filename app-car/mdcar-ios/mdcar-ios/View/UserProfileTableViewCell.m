//
//  UserProfileTableViewCell.m
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "UserProfileTableViewCell.h"

@implementation UserProfileTableViewCell

- (void)awakeFromNib;
{
  [self makeCircle:self.userAvatarImageView];
}

- (void)makeCircle:(UIImageView *)imageView;
{
  imageView.layer.cornerRadius = imageView.frame.size.width / 2;
  imageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
