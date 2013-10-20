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
#import "DateTitleReusableView.h"


static NSString * const dateCellIdentifier = @"dateCell";
static NSString * const dateTitleIdentifier = @"dateTitle";



@interface PackagesViewController ()
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *dateTitleLabel;
@property (nonatomic, strong) NSMutableArray *arrayOfDates;
@property (weak, nonatomic) IBOutlet swipeCollectionView *mySwipeCollectionView;
@property (nonatomic, weak) IBOutlet CollectionViewDateLayout *swipeDatesLayout;
- (IBAction)detailsButton:(id)sender;


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
    
    [self.mySwipeCollectionView registerClass:[DateTitleReusableView class]
            forSupplementaryViewOfKind:DateCreateTitleKind
                   withReuseIdentifier:dateTitleIdentifier];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeArrayOfDates
{
    self.arrayOfDates = [NSMutableArray new];
    
    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"Sushi Dinner Date" andImageName:@"blue-man-group.jpg" andDescription:@"date1 description" andNumberOfDollarSigns:2]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"Blue Man Group Date" andImageName:@"boat.jpg" andDescription:@"boat" andNumberOfDollarSigns:3]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"Boat Tour Date" andImageName:@"comedy-show.png" andDescription:@"date3 description" andNumberOfDollarSigns:1]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"Comedy Club Date" andImageName:@"cubs-game.jpg" andDescription:@"date4 description" andNumberOfDollarSigns:4]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"Cubs Game Date" andImageName:@"painting.jpg" andDescription:@"date5 description" andNumberOfDollarSigns:2]];

    [self.arrayOfDates addObject:[[dateObject alloc] initWithName:@"Painting Together Date" andImageName:@"sushi.jpg" andDescription:@"date6 description" andNumberOfDollarSigns:1]];
    
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
    
    cell.imageView.image = [UIImage imageNamed:((dateObject*)[self.arrayOfDates objectAtIndex:indexPath.row]).imageName];
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath;
{
    DateTitleReusableView *titleView =
    [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                       withReuseIdentifier:dateTitleIdentifier
                                              forIndexPath:indexPath];
    
    dateObject *date = self.arrayOfDates[indexPath.row];
    
    titleView.titleLabel.text = date.titleOfDate;
    
    return titleView;
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
            self.view.backgroundColor = [UIColor redColor];//colorWithRed:149.0f/255.0f green:0.0f/255.0f blue:18.0f/255.0f alpha:.4];



        } completion:^(BOOL finished){
            [self setUpDateTitleLabelFromIndexPath:indexPath];

            dateObject *objectToRemove = [self.arrayOfDates objectAtIndex:indexPath.row];
            [self.arrayOfDates removeObject:objectToRemove];
            [self.mySwipeCollectionView reloadData];
            self.mySwipeCollectionView.backgroundColor = [UIColor whiteColor];
            self.view.backgroundColor = [UIColor whiteColor];
            if (self.arrayOfDates.count == 0) {
                [self segueToFinalDate];
            }

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
            self.view.backgroundColor = [UIColor greenColor];//colorWithRed:69.0f/255.0f green:255.0f/255.0f blue:3.0f/255.0f alpha:.2];

            
        } completion:^(BOOL finished){
            [self setUpDateTitleLabelFromIndexPath:indexPath];

            dateObject *objectToRemove = [self.arrayOfDates objectAtIndex:indexPath.row];
            [self.arrayOfDates removeObject:objectToRemove];
            [self.mySwipeCollectionView reloadData];
            self.mySwipeCollectionView.backgroundColor = [UIColor whiteColor];
            self.view.backgroundColor = [UIColor whiteColor];
            if (self.arrayOfDates.count == 0) {
                [self segueToFinalDate];
            }
            
        }];
        
    }
}

- (void)setUpDateTitleLabelFromIndexPath:(NSIndexPath*)indexPath
{
    dateObject *date = [self.arrayOfDates objectAtIndex:indexPath.row];
    self.dateTitleLabel.text = date.titleOfDate;
}

- (void)segueToDetailsDate
{
    [self performSegueWithIdentifier:@"details" sender:self];
}

- (void)segueToFinalDate
{
    [self performSegueWithIdentifier:@"final" sender:self];
}
- (IBAction)detailsButton:(id)sender
{
    [self segueToDetailsDate];
}
@end
