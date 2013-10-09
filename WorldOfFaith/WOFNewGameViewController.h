//
//  WOFNewGameViewController.h
//  WorldOfFaith
//
//  Created by Raphael on 13-10-9.
//  Copyright (c) 2013年 Raphael. All rights reserved.
//

#import "WOFController.h"

@interface WOFNewGameViewController : WOFController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *raceNameLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *raceNameScrolView;
@property (weak, nonatomic) IBOutlet UITextView *raceDescText;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@end
