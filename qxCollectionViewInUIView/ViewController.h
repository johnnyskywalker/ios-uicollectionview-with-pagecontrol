//
//  ViewController.h
//  qxCollectionViewInUIView
//
//  Created by CQ on 6/14/13.
//  Copyright (c) 2013 gameball. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)prevPage:(id)sender;
@end
