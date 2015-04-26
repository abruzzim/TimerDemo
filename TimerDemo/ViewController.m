//
//  ViewController.m
//  TimerDemo
//
//  Created by Mario Abruzzi on 4/25/15.
//  Copyright (c) 2015 FWS. All rights reserved.
//

#import "ViewController.h"
#import "MZTimerLabel.h"

#define LABEL_FONT_SIZE 20.0f
#define TIMER_FONT_SIZE 28.0f
#define BUTTON_FONT_SIZE 15.0f

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.elapsedLbl = [[UILabel alloc] init];
    self.elapsedLbl.backgroundColor = [UIColor whiteColor];
    self.elapsedLbl.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:LABEL_FONT_SIZE];
    self.elapsedLbl.textColor = [UIColor blueColor];
    self.elapsedLbl.textAlignment = NSTextAlignmentCenter;
    self.elapsedLbl.text = @"Elapsed Time";
    [self.view addSubview:self.elapsedLbl];
    
    self.elapsedLbl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.elapsedLbl
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self.view
      attribute:NSLayoutAttributeCenterX
      multiplier:1
      constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.elapsedLbl
      attribute:NSLayoutAttributeTop
      relatedBy:NSLayoutRelationEqual
      toItem:self.view
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:64]];
    [self.elapsedLbl addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.elapsedLbl
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:200]];
    [self.elapsedLbl addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.elapsedLbl
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:30]];
    
    self.stopwatch = [[MZTimerLabel alloc] init];
    self.stopwatch.timeLabel.backgroundColor = [UIColor whiteColor];
    self.stopwatch.timeLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:TIMER_FONT_SIZE];
    self.stopwatch.timeLabel.textColor = [UIColor blueColor];
    self.stopwatch.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.stopwatch];
    [self.stopwatch start];
    
    self.stopwatch.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.elapsedLbl
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self.stopwatch
      attribute:NSLayoutAttributeCenterX
      multiplier:1
      constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.elapsedLbl
      attribute:NSLayoutAttributeTop
      relatedBy:NSLayoutRelationEqual
      toItem:self.stopwatch
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:-32]];
    [self.stopwatch addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.stopwatch
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:200]];
    [self.stopwatch addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.stopwatch
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:50]];
    
    self.countdownLbl = [[UILabel alloc] init];
    self.countdownLbl.backgroundColor = [UIColor whiteColor];
    self.countdownLbl.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:LABEL_FONT_SIZE];
    self.countdownLbl.textColor = [UIColor redColor];
    self.countdownLbl.textAlignment = NSTextAlignmentCenter;
    self.countdownLbl.text = @"Countdown Timer";
    [self.view addSubview:self.countdownLbl];
    
    self.countdownLbl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.stopwatch
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self.countdownLbl
      attribute:NSLayoutAttributeCenterX
      multiplier:1
      constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.stopwatch
      attribute:NSLayoutAttributeTop
      relatedBy:NSLayoutRelationEqual
      toItem:self.countdownLbl
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:-55]];
    [self.countdownLbl addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownLbl
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:200]];
    [self.countdownLbl addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownLbl
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:30]];
    
    self.countdownTimer = [[MZTimerLabel alloc] initWithTimerType:MZTimerLabelTypeTimer];
    self.countdownTimer.timeLabel.backgroundColor = [UIColor whiteColor];
    self.countdownTimer.timeLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:TIMER_FONT_SIZE];
    self.countdownTimer.timeLabel.textColor = [UIColor redColor];
    self.countdownTimer.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.countdownTimer setCountDownTime:5];
    self.countdownTimer.resetTimerAfterFinish = YES;
    self.countdownTimer.delegate = self;
    [self.view addSubview:self.countdownTimer];
    
    self.countdownTimer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownLbl
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self.countdownTimer
      attribute:NSLayoutAttributeCenterX
      multiplier:1
      constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownLbl
      attribute:NSLayoutAttributeTop
      relatedBy:NSLayoutRelationEqual
      toItem:self.countdownTimer
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:-32]];
    [self.countdownTimer addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownTimer
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:200]];
    [self.countdownTimer addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownTimer
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:50]];
    
    self.countdownBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.countdownBtn.layer.cornerRadius = 5;
    self.countdownBtn.backgroundColor = [UIColor whiteColor];
    self.countdownBtn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:BUTTON_FONT_SIZE];
    self.countdownBtn.tintColor = [UIColor redColor];
    self.countdownBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.countdownBtn setTitle:@"Start" forState:UIControlStateNormal];
    [self.countdownBtn setTitle:@"Starting" forState:UIControlStateHighlighted];
    [self.countdownBtn addTarget:self
                          action:@selector(startCountDownWithBlock:)
                forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.countdownBtn];
    
    self.countdownBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownTimer
      attribute:NSLayoutAttributeCenterX
      relatedBy:NSLayoutRelationEqual
      toItem:self.countdownBtn
      attribute:NSLayoutAttributeCenterX
      multiplier:1
      constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownTimer
      attribute:NSLayoutAttributeTop
      relatedBy:NSLayoutRelationEqual
      toItem:self.countdownBtn
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:-52]];
    [self.countdownBtn addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownBtn
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:50]];
    [self.countdownBtn addConstraint:
     [NSLayoutConstraint
      constraintWithItem:self.countdownBtn
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:0
      multiplier:1
      constant:50]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startCountDownWithBlock:(id)sender {
    
    if (![self.countdownTimer counting]) {
        [self.countdownTimer startWithEndingBlock:^(NSTimeInterval countTime) {
            NSString *msg = [NSString stringWithFormat:@"Time elapsed.\nTime counted: %i seconds.", (int)countTime];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reminder"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"Dismiss"
                                                  otherButtonTitles:nil];
            [alert show];
        }];
    }
}

@end
