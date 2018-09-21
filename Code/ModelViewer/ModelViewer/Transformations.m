//
//  Transformations.m
//  ModelViewer
//
//  Created by Dan Jiang on 2018/9/21.
//  Copyright © 2018年 Dan Jiang. All rights reserved.
//

#import "Transformations.h"

@interface Transformations ()

@property (nonatomic, assign) float depth;
@property (nonatomic, assign) float scaleStart;
@property (nonatomic, assign) float scaleEnd;
@property (nonatomic, assign) GLKVector2 translationStart;
@property (nonatomic, assign) GLKVector2 translationEnd;
@property (nonatomic, assign) GLKVector3 rotationStart;
@property (nonatomic, assign) GLKQuaternion rotationEnd;
@property (nonatomic, assign) GLKVector3 front;
@property (nonatomic, assign) GLKVector3 right;
@property (nonatomic, assign) GLKVector3 up;

@end

@implementation Transformations

- (id)initWithDepth:(float)z Scale:(float)s Translation:(GLKVector2)t Rotation:(GLKVector3)r {
    if (self = [super init]) {
        self.depth = z;
        self.scaleEnd = s;
        self.translationEnd = t;
        self.right = GLKVector3Make(1.0f, 0.0f, 0.0f);
        self.up = GLKVector3Make(0.0f, 1.0f, 0.0f);
        self.front = GLKVector3Make(0.0f, 0.0f, 1.0f);
        r.x = GLKMathDegreesToRadians(r.x);
        r.y = GLKMathDegreesToRadians(r.y);
        r.z = GLKMathDegreesToRadians(r.z);
        self.rotationEnd = GLKQuaternionIdentity;
        self.rotationEnd = GLKQuaternionMultiply(GLKQuaternionMakeWithAngleAndVector3Axis(-r.x, self.right), self.rotationEnd);
        self.rotationEnd = GLKQuaternionMultiply(GLKQuaternionMakeWithAngleAndVector3Axis(-r.y, self.up), self.rotationEnd);
        self.rotationEnd = GLKQuaternionMultiply(GLKQuaternionMakeWithAngleAndVector3Axis(-r.z, self.front), self.rotationEnd);
    }
    return self;
}

- (void)start {
    self.state = S_NEW;
    self.scaleStart = self.scaleEnd;
    self.translationStart = GLKVector2Make(0.0f, 0.0f);
    self.rotationStart = GLKVector3Make(0.0f, 0.0f, 0.0f);
}

- (void)scale:(float)s {
    self.state = S_SCALE;
    self.scaleEnd = s * self.scaleStart;
}

- (void)translate:(GLKVector2)t withMultiplier:(float)m {
    self.state = S_TRANSLATION;
    
    t = GLKVector2MultiplyScalar(t, m);
    
    float dx = self.translationEnd.x + (t.x - self.translationStart.x);
    float dy = self.translationEnd.y - (t.y - self.translationStart.y);
    
    self.translationEnd = GLKVector2Make(dx, dy);
    self.translationStart = GLKVector2Make(t.x, t.y);
}

- (void)rotate:(GLKVector3)r withMultiplier:(float)m {
    self.state = S_ROTATION;
    
    float dx = r.x - self.rotationStart.x;
    float dy = r.y - self.rotationStart.y;
    float dz = r.z - self.rotationStart.z;
    self.rotationStart = GLKVector3Make(r.x, r.y, r.z);
    self.rotationEnd = GLKQuaternionMultiply(GLKQuaternionMakeWithAngleAndVector3Axis(-dx*m, self.up), self.rotationEnd);
    self.rotationEnd = GLKQuaternionMultiply(GLKQuaternionMakeWithAngleAndVector3Axis(-dy*m, self.right), self.rotationEnd);
    self.rotationEnd = GLKQuaternionMultiply(GLKQuaternionMakeWithAngleAndVector3Axis(-dz, self.front), self.rotationEnd);
}

- (GLKMatrix4)getModelViewMatrix {
    GLKMatrix4 modelViewMatrix = GLKMatrix4Identity;
    GLKMatrix4 quaternionMatrix = GLKMatrix4MakeWithQuaternion(self.rotationEnd);
    modelViewMatrix = GLKMatrix4Translate(modelViewMatrix, self.translationEnd.x, self.translationEnd.y, -self.depth);
    modelViewMatrix = GLKMatrix4Multiply(modelViewMatrix, quaternionMatrix);
    modelViewMatrix = GLKMatrix4Scale(modelViewMatrix, self.scaleEnd, self.scaleEnd, self.scaleEnd);
    return modelViewMatrix;
}

@end
