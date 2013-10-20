//
//  PackagesViewController.m
//  date-create
//
//  Created by Daher Alfawares on 10/19/13.
//  Copyright (c) 2013 Daher Alfawares. All rights reserved.
//

#import "PackagesViewController.h"
#import "dateObject.h"
#import "swipeCollectionViewCell.h"
#import "swipeCollectionView.h"
#import "CollectionViewDateLayout.h"

static NSString * const dateCellIdentifier = @"dateCell";


@interface PackagesViewController ()
{
    
}
@property (nonatomic, strong) NSMutableArray *arrayOfDates;
@property (weak, nonatomic) IBOutlet swipeCollectionView *mySwipeCollectionView;
@property (nonatomic, weak) IBOutlet CollectionViewDateLayout *swipeDatesLayout;


@end

@implementation PackagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self makeArrayOfDates];
    [self.mySwipeCollectionView registerClass:[swipeCollectionViewCell class]
            forCellWithReuseIdentifier:dateCellIdentifier];
    //self.mySwipeCollectionView.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeArrayOfDates
{
    self.arrayOfDates = [NSMutableArray new];
    
    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"date1" andImageName:@"date1Image" andDescription:@"date1 description" andNumberOfDollarSigns:2]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"date2" andImageName:@"date2Image" andDescription:@"date2 description" andNumberOfDollarSigns:3]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"date3" andImageName:@"date3Image" andDescription:@"date3 description" andNumberOfDollarSigns:1]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"date4" andImageName:@"date4Image" andDescription:@"date4 description" andNumberOfDollarSigns:4]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"date5" andImageName:@"date5Image" andDescription:@"date5 description" andNumberOfDollarSigns:2]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"date6" andImageName:@"date6Image" andDescription:@"date6 description" andNumberOfDollarSigns:1]];
    
   // [self.mySwipeCollectionView reloadData];
    
}

#pragma mark - Collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.arrayOfDates.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    swipeCollectionViewCell *cell = [self.mySwipeCollectionView dequeueReusableCellWithReuseIdentifier:@"dateCell" forIndexPath:indexPath];
    cell.swipeDateCardImageView.image = [UIImage imageNamed:((dateObject*)[self.arrayOfDates objectAtIndex:indexPath.row]).imageName];
    cell.swipeDateCardTitleLabel.text = ((dateObject*)[self.arrayOfDates objectAtIndex:indexPath.row]).titleOfDate;
    cell.swipeDateCardTitleLabel.text = ((dateObject*)[self.arrayOfDates objectAtIndex:indexPath.row]).descriptionOfDate;
    
    UISwipeGestureRecognizer *leftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftGestureRecognizer:)];
    leftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:leftGestureRecognizer];
    
    UISwipeGestureRecognizer *rightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightGestureRecognizer:)];
    rightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:rightGestureRecognizer];


    
    return cell;
}

#pragma mark - View Rotation

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        self.swipeDatesLayout.numberOfColumns = 3;
        
        // handle insets for iPhone 4 or 5
        CGFloat sideInset = [UIScreen mainScreen].preferredMode.size.width == 1136.0f ?
        45.0f : 25.0f;
        
        self.swipeDatesLayout.itemInsets = UIEdgeInsetsMake(22.0f, sideInset, 13.0f, sideInset);
        
    } else {
        self.swipeDatesLayout.numberOfColumns = 2;
        self.swipeDatesLayout.itemInsets = UIEdgeInsetsMake(22.0f, 22.0f, 13.0f, 22.0f);
    }
}

- (void)leftGestureRecognizer:(UISwipeGestureRecognizer*)sender
{
    if (sender.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [sender locationInView:self.mySwipeCollectionView];
    
    NSIndexPath *indexPath = [self.mySwipeCollectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        // get the cell at indexPath (the one you long pressed)
        UICollectionViewCell* cell = [self.mySwipeCollectionView cellForItemAtIndexPath:indexPath];
        CGPoint cellStartCenter = cell.center;
        // do stuff with the cell
        [UIView animateWithDuration:.3f animations:^{
            cell.center = CGPointMake(cellStartCenter.x - 300, cellStartCenter.y - 30);
            cell.transform = CGAffineTransformMakeRotation(100);

        } completion:^(BOOL finished){
            dateObject *objectToRemove = [self.arrayOfDates objectAtIndex:indexPath.row];
            [self.arrayOfDates removeObject:objectToRemove];
            [self.mySwipeCollectionView reloadData];
        }];
        
    }
}

- (void)rightGestureRecognizer:(UISwipeGestureRecognizer*)sender
{
    if (sender.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [sender locationInView:self.mySwipeCollectionView];
    
    NSIndexPath *indexPath = [self.mySwipeCollectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        // get the cell at indexPath (the one you long pressed)
        UICollectionViewCell* cell = [self.mySwipeCollectionView cellForItemAtIndexPath:indexPath];
        CGPoint cellStartCenter = cell.center;
        // do stuff with the cell
        [UIView animateWithDuration:.3f animations:^{
            cell.center = CGPointMake(cellStartCenter.x + 300, cellStartCenter.y - 30);
            cell.transform = CGAffineTransformMakeRotation(100);
            
        } completion:^(BOOL finished){
            dateObject *objectToRemove = [self.arrayOfDates objectAtIndex:indexPath.row];
            [self.arrayOfDates removeObject:objectToRemove];
            [self.mySwipeCollectionView reloadData];
        }];
        
    }
}
@end
