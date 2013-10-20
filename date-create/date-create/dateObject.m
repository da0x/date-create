//
//  dateObject.m
//  date-create
//
//  Created by Nathan Levine on 10/19/13.
//  Copyright (c) 2013 Daher Alfawares. All rights reserved.
//

#import "dateObject.h"

@implementation dateObject
@synthesize titleOfDate, imageName, descriptionOfDate, numberOfDollarSigns;

- (dateObject*)initWithName:(NSString*)name andImageName:(NSString*)dateImageName andDescription:(NSString*)description andNumberOfDollarSigns:(NSInteger)dollarSigns
{
    self = [super init];
    if (self) {
        // Initialization code
        titleOfDate = name;
        imageName = dateImageName;
        descriptionOfDate = description;
        numberOfDollarSigns = dollarSigns;
        
    }
    return self;
}

@end
