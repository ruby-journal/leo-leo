//
//  DiscoverTableViewController.m
//  mdcar-ios
//
//  Created by Don Dinh on 4/23/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import "DiscoverTableViewController.h"

@interface DiscoverTableViewController ()
{
  NSArray *thumbnails;
  NSString *reuseIdentifier;
}
@end

@implementation DiscoverTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initTableView];
  [self getUsersFromServer];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma *************************************************
#pragma mark - UITableViewDelegate -

- (void)initTableView;
{
  reuseIdentifier = @"userProfileCell";
  [self.tableView registerNib:[UINib nibWithNibName:@"UserProfileTableViewCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}

- (void)getUsersFromServer;
{
  self.usersArray = [[NSMutableArray alloc] init];
  self.usersArray = [@[@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini"] mutableCopy];
  
}


#pragma *************************************************
#pragma mark - UITableViewDelegate -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
  // Return the number of rows in the section.
  return self.usersArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
 UserProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
 
//  cell.userAvatarImageView.image;
  cell.userAboutLabel.text = [NSString stringWithFormat:@"%@\nEmail: user@gmail.com \nGender: female", [self.usersArray objectAtIndex:indexPath.row]];
  [cell.userAboutLabel sizeToFit];
  cell.userAboutLabel.lineBreakMode = NSLineBreakByCharWrapping;
 return cell;
 }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 100;
}

@end
