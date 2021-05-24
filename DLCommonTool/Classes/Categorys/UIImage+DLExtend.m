//
//  UIImage+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "UIImage+DLExtend.h"

@implementation UIImage (DLExtend)

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)dl_fixOrientation {
    if (!self) {
        return nil;
    }
   // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) {
        return self;
    }
     
   // We need to calculate the proper transformation to make the image upright.
   // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
   CGAffineTransform transform = CGAffineTransformIdentity;
     
   switch (self.imageOrientation) {
     case UIImageOrientationDown:
     case UIImageOrientationDownMirrored:
       transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
       transform = CGAffineTransformRotate(transform, M_PI);
       break ;
         
     case UIImageOrientationLeft:
     case UIImageOrientationLeftMirrored:
       transform = CGAffineTransformTranslate(transform, self.size.width, 0);
       transform = CGAffineTransformRotate(transform, M_PI_2);
       break ;
         
     case UIImageOrientationRight:
     case UIImageOrientationRightMirrored:
       transform = CGAffineTransformTranslate(transform, 0, self.size.height);
       transform = CGAffineTransformRotate(transform, -M_PI_2);
       break ;
     default :
       break ;
   }
     
   switch (self.imageOrientation) {
     case UIImageOrientationUpMirrored:
     case UIImageOrientationDownMirrored:
       transform = CGAffineTransformTranslate(transform, self.size.width, 0);
       transform = CGAffineTransformScale(transform, -1, 1);
       break ;
         
     case UIImageOrientationLeftMirrored:
     case UIImageOrientationRightMirrored:
       transform = CGAffineTransformTranslate(transform, self.size.height, 0);
       transform = CGAffineTransformScale(transform, -1, 1);
       break ;
     default :
       break ;
   }
     
   // Now we draw the underlying CGImage into a new context, applying the transform
   // calculated above.
   CGContextRef ctx = CGBitmapContextCreate( NULL , self.size.width, self.size.height,
                        CGImageGetBitsPerComponent(self.CGImage), 0,
                        CGImageGetColorSpace(self.CGImage),
                        CGImageGetBitmapInfo(self.CGImage));
   CGContextConcatCTM(ctx, transform);
   switch (self.imageOrientation) {
     case UIImageOrientationLeft:
     case UIImageOrientationLeftMirrored:
     case UIImageOrientationRight:
     case UIImageOrientationRightMirrored:
       // Grr...
       CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
       break ;
         
     default :
       CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
       break ;
   }
     
   // And now we just create a new UIImage from the drawing context
   CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
   UIImage *img = [UIImage imageWithCGImage:cgimg];
   CGContextRelease(ctx);
   CGImageRelease(cgimg);
   return  img;
}


@end
