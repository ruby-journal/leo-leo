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
  UIActivityIndicatorView *spinner;
  BOOL isFinishedLoading;
}
@end

@implementation DiscoverTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self addActivityIndicator];
  [self initTableView];
  [self getUsersFromServer];
  self.navigationItem.title = @"Lotus Demo";
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma *************************************************
#pragma mark - UITableViewDelegate -

- (void)addActivityIndicator;
{
  self.foregroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  self.foregroundView.backgroundColor = [UIColor whiteColor];
  spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  spinner.tag = 1;
  CGRect frame = spinner.frame;
  frame.origin.x = self.view.frame.size.width / 2 - frame.size.width / 2;
  frame.origin.y = self.view.frame.size.height / 2 - frame.size.height / 2;
  spinner.frame = frame;
  [spinner startAnimating];
  [self.foregroundView addSubview:spinner];
  [self.navigationController.view addSubview:self.foregroundView];
}

- (void)removeActivityIndicator;
{
  [spinner stopAnimating];
  [self.foregroundView removeFromSuperview];
}

- (void)initTableView;
{
  reuseIdentifier = @"userProfileCell";
  [self.tableView registerNib:[UINib nibWithNibName:@"UserProfileTableViewCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
}

- (void)getUsersFromServer;
{
  self.usersArray = [[NSMutableArray alloc] init];
  [[UserClient sharedManager] getResources:^(id resources) {
    [self removeActivityIndicator];
    self.usersArray = resources;
    isFinishedLoading = YES;
    [self.tableView reloadData];
  } failure:^(NSError *error) {
    [self removeActivityIndicator];
    // do somthing
  }];
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
 
  User *user = [MTLJSONAdapter modelOfClass:User.class fromJSONDictionary:[self.usersArray objectAtIndex:indexPath.row] error:NULL];

  cell.userAboutLabel.text = [NSString stringWithFormat:@"%@\nEmail: %@ \nGender: %@",user.name, user.email, user.gender];
  [cell.userAboutLabel sizeToFit];
  cell.userAboutLabel.lineBreakMode = NSLineBreakByCharWrapping;
 return cell;
 }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 100;
}

@end
