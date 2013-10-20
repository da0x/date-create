//
//  DateTitleReusableView.m
//  date-create
//
//  Created by Nathan Levine on 10/20/13.
//  Copyright (c) 2013 Daher Alfawares. All rights reserved.
//

#import "DateTitleReusableView.h"

@interface DateTitleReusableView ()

@property (nonatomic, strong, readwrite) UILabel *titleLabel;

@end

@implementation DateTitleReusableView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
        self.titleLabel.backgroundColor = [UIColor greenColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:13.0f];
        self.titleLabel.textColor = [UIColor redColor];
        self.titleLabel.shadowColor = [UIColor colorWithWhite:1.0f alpha:0.3f];
        self.titleLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
        
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.titleLabel.text = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
