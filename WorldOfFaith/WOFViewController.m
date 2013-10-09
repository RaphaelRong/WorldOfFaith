//
//  WOFViewController.m
//  WorldOfFaith
//
//  Created by Raphael on 13-10-9.
//  Copyright (c) 2013年 Raphael. All rights reserved.
//

#import "WOFViewController.h"
#import "Constant.h"

@implementation WOFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    // Configure the view.
//    SKView * skView = (SKView *)self.view;
//    skView.showsFPS = YES;
//    skView.showsNodeCount = YES;
//    
//    // Create and configure the scene.
//    SKScene * scene = [WOFMyScene sceneWithSize:skView.bounds.size];
//    scene.scaleMode = SKSceneScaleModeAspectFill;
//    
//    // Present the scene.
//    [skView presentScene:scene];
}

- (IBAction)newGamePressed:(UIButton *)sender {
    [self performSegueWithIdentifier:FROM_INDEXMENU_TO_NEW_GAME sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
