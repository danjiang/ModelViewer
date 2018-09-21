//
//  Transformations.h
//  ModelViewer
//
//  Created by Dan Jiang on 2018/9/21.
//  Copyright © 2018年 Dan Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@import GLKit;

NS_ASSUME_NONNULL_BEGIN

typedef enum TransformationState
{
    S_NEW,
    S_SCALE,
    S_TRANSLATION,
    S_ROTATION
}
TransformationState;

@interface Transformations : NSObject

@property (nonatomic, assign) TransformationState state;

- (id)initWithDepth:(float)z Scale:(float)s Translation:(GLKVector2)t Rotation:(GLKVector3)r;
- (void)start;
- (void)scale:(float)s;
- (void)translate:(GLKVector2)t withMultiplier:(float)m;
- (void)rotate:(GLKVector3)t withMultiplier:(float)m;
- (GLKMatrix4)getModelViewMatrix;

@end

NS_ASSUME_NONNULL_END
