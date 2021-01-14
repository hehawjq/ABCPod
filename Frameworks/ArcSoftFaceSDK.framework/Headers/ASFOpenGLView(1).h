//
//  ASFOpenGLView.h
//  ArcFaceSDK
//
//  Created by zhangkai on 2018/11/13.
//  Copyright © 2018年 zhangkai. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface ASFOpenGLView : UIView

typedef NS_ENUM(NSInteger,ASFOpenGLViewContentMode) {
    ASFOpenGLViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
    ASFOpenGLViewContentModeScaleAspectFill,     // default mode,contents scaled to fill with fixed aspect. some portion of content may be clipped.
};

- (void)setFaceImage:(UIImage *)uiImage;

- (void)displayPixelBuffer:(CVPixelBufferRef)pixelBuffer;

- (void)displayPixelBuffer:(CVPixelBufferRef)pixelBuffer withLandmarks:(float *)landmarks count:(int)count;

- (void)enablePhotoMode:(BOOL)enable;
@end
