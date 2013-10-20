//
//  dateObject.h
//  date-create
//
//  Created by Nathan Levine on 10/19/13.
//  Copyright (c) 2013 Daher Alfawares. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dateObject : NSObject

@property (nonatomic, strong) NSString *titleOfDate;
@property (nonatomic, strong) NSString *descriptionOfDate;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic) NSInteger numberOfDollarSigns;

- (dateObject*)initWithName:(NSString*)name andImageName:(NSString*)dateImageName andDescription:(NSString*)description andNumberOfDollarSigns:(NSInteger)dollarSigns;


@end
