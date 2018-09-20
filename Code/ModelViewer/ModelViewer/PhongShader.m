//
//  PhongShader.m
//  ModelViewer
//
//  Created by Dan Jiang on 2018/9/19.
//  Copyright © 2018年 Dan Jiang. All rights reserved.
//

#import "PhongShader.h"

#define STRINGIFY(A) #A
#include "Phong.vsh"
#include "Phong.fsh"

@implementation PhongShader

- (id)init
{
    if(self = [super init])
    {
        // 2
        // Program
        self.program = [self BuildProgram:PhongVSH with:PhongFSH];
        
        // 3
        // Attributes
        self.aPosition = glGetAttribLocation(self.program, "aPosition");
        self.aNormal = glGetAttribLocation(self.program, "aNormal");
        self.aTexel = glGetAttribLocation(self.program, "aTexel");

        // 4
        // Uniforms
        self.uProjectionMatrix = glGetUniformLocation(self.program, "uProjectionMatrix");
        self.uModelViewMatrix = glGetUniformLocation(self.program, "uModelViewMatrix");
        self.uNormalMatrix = glGetUniformLocation(self.program, "uNormalMatrix");
        self.uDiffuse = glGetUniformLocation(self.program, "uDiffuse");
        self.uSpecular = glGetUniformLocation(self.program, "uSpecular");
        self.uTexture = glGetUniformLocation(self.program, "uTexture");
    }
    
    return self;
}

@end
