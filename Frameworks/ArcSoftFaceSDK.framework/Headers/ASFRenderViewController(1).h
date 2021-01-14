//
//  ASFRenderViewController.h
//  ArcFaceSDK
//
//  Created by zhangkai on 2018/11/13.
//  Copyright © 2018年 zhangkai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASFOpenGLView.h"
#import <AVFoundation/AVFoundation.h>

@protocol ASFRenderViewControllerDelegate <NSObject>
- (void)didTakeSnapshoot:(UIImage *)image;
- (void)didOutputVideoSampleBuffer:(CVPixelBufferRef)pixelBuffer;
@optional
- (void)detectedFace:(BOOL)hasface;
- (void)finishVideoRecordWithCompletion;
@end

@interface ASFRenderViewController : UIViewController
@property (nonatomic, assign) id<ASFRenderViewControllerDelegate> delegate;
@property (nonatomic, strong) ASFOpenGLView *renderView;
@property (nonatomic, strong) UIImage *logoImage;
@property (nonatomic, assign) float renderWidth;
@property (nonatomic, assign) float renderHeight;
@property (nonatomic, assign) BOOL isOpenAudio;
@property (nonatomic, assign) BOOL isCameraRunning;

- (void)takeSnapshoot;

- (void)setFaceImage:(UIImage *)image;

- (void)enablePhotoMode:(BOOL)enable;

- (void)setFaceDetectTimeOut:(UInt64)timeout;

- (void)enableFaceDetec:(BOOL)enable;

- (void)startRecord:(NSString *)path Params:(NSDictionary *)params;

- (void)stopRecord;

- (BOOL)isRecord;

- (void)startCameraRunning;

- (void)stopCameraRunning;

@end
