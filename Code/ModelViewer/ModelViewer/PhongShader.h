//
//  PhongShader.h
//  ModelViewer
//
//  Created by Dan Jiang on 2018/9/19.
//  Copyright © 2018年 Dan Jiang. All rights reserved.
//

#import "Shader.h"
@import GLKit;

NS_ASSUME_NONNULL_BEGIN

@interface PhongShader : Shader

// Program Handle
@property (readwrite) GLint program;

// Attribute Handles
@property (readwrite) GLint aPosition;
@property (readwrite) GLint aNormal;
@property (readwrite) GLint aTexel;

// Uniform Handles
@property (readwrite) GLint uProjectionMatrix;
@property (readwrite) GLint uModelViewMatrix;
@property (readwrite) GLint uNormalMatrix;
@property (readwrite) GLint uDiffuse;
@property (readwrite) GLint uSpecular;
@property (readwrite) GLint uTexture;

@end

NS_ASSUME_NONNULL_END
