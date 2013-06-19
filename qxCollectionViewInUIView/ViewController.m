//
//  ViewController.m
//  qxCollectionViewInUIView
//
//  Created by CQ on 6/14/13.
//  Copyright (c) 2013 gameball. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
	NSArray *recipeImages;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [_flowLayout setItemSize:CGSizeMake(300, 490)];
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [_myCollectionView setBounces:NO];
    [_myCollectionView setCollectionViewLayout:_flowLayout];
    [_myCollectionView setBackgroundColor:[UIColor clearColor]];
    
    recipeImages = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", @"", @"", nil];
    
    NSLog(@"view controller did load");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return recipeImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
	
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
	
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
	UILabel *descLabel = (UILabel *)[cell viewWithTag:110];
	[descLabel setText:[recipeImages objectAtIndex:indexPath.row]];
    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
	
//    cell.backgroundColor = [UIColor redColor];
	//cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame.png"]];
	//[self.CellLabel setText:[recipeImages objectAtIndex:indexPath.row]];
	
    int pages = floor(_myCollectionView.contentSize.width / _myCollectionView.frame.size.width) + 1;
    [_pageControl setNumberOfPages:pages];
	
    return cell;
}

#pragma mark - UIScrollVewDelegate for UIPageControl

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = _myCollectionView.frame.size.width;
    float currentPage = _myCollectionView.contentOffset.x / pageWidth;
    
    if (0.0f != fmodf(currentPage, 1.0f)) {
        _pageControl.currentPage = currentPage + 1;
    } else {
        _pageControl.currentPage = currentPage;
    }
    NSLog(@"finishPage: %d", _pageControl.currentPage);
}

#pragma mark - Next & Prev Page Button

- (IBAction)prevPage:(id)sender {
    _pageControl.currentPage--;
    CGFloat prevPageX = _myCollectionView.frame.size.width * MAX(_pageControl.currentPage, 0);
    [_myCollectionView setContentOffset:CGPointMake(prevPageX, 0) animated:YES];
    NSLog(@"NewPage: %d", _pageControl.currentPage);
}

- (IBAction)nextPage:(id)sender {
    _pageControl.currentPage++;
    CGFloat prevPageX = _myCollectionView.frame.size.width * MIN(_pageControl.currentPage, 5);
    [_myCollectionView setContentOffset:CGPointMake(prevPageX, 0) animated:YES];
    NSLog(@"NewPage: %d", _pageControl.currentPage);
}
@end
