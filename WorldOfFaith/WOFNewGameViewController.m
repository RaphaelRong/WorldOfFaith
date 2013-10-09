//
//  WOFNewGameViewController.m
//  WorldOfFaith
//
//  Created by Raphael on 13-10-9.
//  Copyright (c) 2013年 Raphael. All rights reserved.
//

#import "WOFNewGameViewController.h"

@interface WOFNewGameViewController ()

@property (nonatomic, strong) NSDictionary *raceInfoDict;
@property (nonatomic, strong) NSMutableArray *raceNameArray;
@property (nonatomic, strong) NSString *selectedRaceCode;

@end

@implementation WOFNewGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.raceNameArray = [NSMutableArray array];
    
    CGRect raceLabelFrame = self.raceNameLabel.frame;
    CGRect raceScrollFrame = self.raceNameScrolView.frame;
    
    
    self.raceInfoDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Race" ofType:@"plist"]];
    self.raceNameScrolView.contentSize = CGSizeMake(raceScrollFrame.size.width * self.raceInfoDict.count, 320);
    self.raceNameScrolView.delegate = self;
    
    NSEnumerator *raceKey = [self.raceInfoDict keyEnumerator];
    id key;
    int i = 0;
    while ((key = [raceKey nextObject])) {
        /* code that uses the returned key */
        NSString *keyString = (NSString *)key;
        UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(raceLabelFrame.origin.x + i++ * raceScrollFrame.size.width, raceLabelFrame.origin.y, raceLabelFrame.size.width, raceLabelFrame.size.height)];
        aLabel.text = keyString;
        aLabel.font = [UIFont systemFontOfSize:24];
        aLabel.textAlignment = NSTextAlignmentCenter;
        [self.raceNameScrolView addSubview:aLabel];
        [self.raceNameArray addObject:keyString];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    NSString *raceName = [self.raceNameArray objectAtIndex:page];
    NSDictionary *raceDetail = [self.raceInfoDict objectForKey:raceName];
    self.raceDescText.text = [raceDetail objectForKey:@"desc"];
    self.selectedRaceCode = [raceDetail objectForKey:@"code"];
    [self.raceDescText scrollsToTop];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toPreviousPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)toNextPressed:(UIButton *)sender {
    NSLog(@"%@", self.selectedRaceCode);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"您选择了%@", self.selectedRaceCode] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}
@end
