//
//  ViewController.m
//  MailCompositionDemo
//
//  Created by dev on 4/26/15.
//  Copyright (c) 2015 self. All rights reserved.
//

#import "ViewController.h"
@import MessageUI;

@interface ViewController ()<MFMailComposeViewControllerDelegate>
@property (nonatomic,strong) UIButton *sendMailBtn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sendMailBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.sendMailBtn setTitle:@"Send Mail" forState:UIControlStateNormal];
    [self.sendMailBtn setFrame:CGRectMake(0, 0, 150, 40)];
    [self.sendMailBtn addTarget:self action:@selector(sendMailAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.sendMailBtn];
}

- (void)viewWillLayoutSubviews
{
    [self.sendMailBtn setCenter:self.view.center];
}

- (void)sendMailAction
{
    MFMailComposeViewController *mailComposeVC = [[MFMailComposeViewController alloc] init];
    [mailComposeVC setMailComposeDelegate:self];
    mailComposeVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [mailComposeVC setSubject:@"Test Subject"];
    
    [self presentViewController:mailComposeVC animated:YES completion:nil];
}

#pragma mark - MFMailComposeViewController Delegate method(s)

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(error)
    {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",[error localizedDescription]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
