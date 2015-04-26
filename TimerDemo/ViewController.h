//
//  ViewController.h
//  TimerDemo
//
//  Created by Mario Abruzzi on 4/25/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"

@interface ViewController : UIViewController <MZTimerLabelDelegate>

@property (strong, nonatomic) UILabel *elapsedLbl;
@property (strong, nonatomic) MZTimerLabel *stopwatch;
@property (strong, nonatomic) UILabel *countdownLbl;
@property (strong, nonatomic) MZTimerLabel *countdownTimer;
@property (strong, nonatomic) UIButton *countdownBtn;

@end

