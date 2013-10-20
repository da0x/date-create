//
//  swipeCollectionViewCell.h
//  date-create
//
//  Created by Nathan Levine on 10/19/13.
//  Copyright (c) 2013 Daher Alfawares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface swipeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *swipeDateCardImageView;
@property (weak, nonatomic) IBOutlet UILabel *swipeDateCardTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *swipeDateCareDescriptionLabel;
@property (nonatomic, strong, readwrite) UIImageView *imageView;


@end
