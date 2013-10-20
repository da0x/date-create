//
//  UIImage+ScaleImage.h
//  EarShot
//
//  Created by Nathan Levine on 6/21/13.
//  Copyright (c) 2013 EarShot - Ravi Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MAX_IMAGE_DIMENSION 600.0f

@interface UIImage (ScaleImage)

-(UIImage*)scaleToSize:(CGSize)size withImage:(UIImage *)image;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImage:(CGSize)newSize
                transform:(CGAffineTransform)transform
           drawTransposed:(BOOL)transpose
     interpolationQuality:(CGInterpolationQuality)quality;
- (CGAffineTransform)transformForOrientation:(CGSize)newSize;


@end
