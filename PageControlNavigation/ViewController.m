//
//  ViewController.m
//  PageControlNavigation
//
//  Created by Winton Wu on 8/26/15.
//  Copyright (c) 2015 Wu Liang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) UIView *page1;
@property (weak, nonatomic) UIView *page2;
@property (weak, nonatomic) UIView *page3;



- (IBAction)changePage:(id)sender;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    
    self.scrollView.frame = self.view.frame;
    
    UIStoryboard *mainStoryBoard = self.storyboard;
    
    UIViewController *page1ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page1"];
    self.page1 = page1ViewController.view;
    self.page1.frame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
    
    UIViewController *page2ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page2"];
    self.page2 = page2ViewController.view;
    self.page2.frame = CGRectMake(320.0f, 0.0f, 320.0f, 480.0f);
    
    UIViewController *page3ViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page3"];
    self.page3 = page3ViewController.view;
    self.page3.frame = CGRectMake(320.0f * 2, 0.0f, 320.0f, 480.0f);
    
    [self.scrollView addSubview:self.page1];
    [self.scrollView addSubview:self.page2];
    [self.scrollView addSubview:self.page3];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changePage:(id)sender {
    [UIView animateWithDuration:0.3f animations:^{
        NSInteger whichPage = self.pageControl.currentPage;
        self.scrollView.contentOffset = CGPointMake(whichPage * 320.0f, 0.0f);
    }];
    
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    self.pageControl.currentPage = offset.x / 320.0f;
}


@end
