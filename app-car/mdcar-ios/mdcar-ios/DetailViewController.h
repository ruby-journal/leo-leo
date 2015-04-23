//
//  DetailViewController.h
//  mdcar-ios
//
//  Created by Don Dinh on 4/22/15.
//  Copyright (c) 2015 asnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

