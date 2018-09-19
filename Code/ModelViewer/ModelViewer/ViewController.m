//
//  ViewController.m
//  ModelViewer
//
//  Created by Dan Jiang on 2018/9/12.
//  Copyright © 2018年 Dan Jiang. All rights reserved.
//

#import "ViewController.h"
#import "cube.h"

@interface ViewController ()

@property (nonatomic, strong) GLKBaseEffect *effect;
@property (nonatomic, assign) float rotate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    GLKView *glkView = (GLKView *)self.view;
    glkView.context = context;
    
    glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
    glEnable(GL_CULL_FACE);
    
    [self createEffect];
    
    self.rotate = 0.0f;
}

- (void)update {
    self.rotate += 1.0f;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self setMatrices];
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, cubePositions);
    
    glEnableVertexAttribArray(GLKVertexAttribNormal);
    glVertexAttribPointer(GLKVertexAttribNormal, 3, GL_FLOAT, GL_FALSE, 0, cubeNormals);

    for (int i = 0; i < cubeMaterials; i++) {
        [self.effect prepareToDraw];
        
        self.effect.material.diffuseColor = GLKVector4Make(cubeDiffuses[i][0], cubeDiffuses[i][1], cubeDiffuses[i][2], 1.0f);
        self.effect.material.specularColor = GLKVector4Make(cubeSpeculars[i][0], cubeSpeculars[i][1], cubeSpeculars[i][2], 1.0f);
        
        glDrawArrays(GL_TRIANGLES, cubeFirsts[i], cubeCounts[i]);
    }
}

- (void)createEffect {
    self.effect = [GLKBaseEffect new];
    
//    NSDictionary *options = @{GLKTextureLoaderOriginBottomLeft: @YES};
//    NSError *error;
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"cube.png" ofType:nil];
//    GLKTextureInfo *texture = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];
//
//    if (texture == nil) {
//        NSLog(@"Error loading file: %@", [error localizedDescription]);
//    }
//
//    self.effect.texture2d0.name = texture.name;
//    self.effect.texture2d0.enabled = true;
    
    self.effect.lightingType = GLKLightingTypePerPixel;
    self.effect.light0.enabled = GL_TRUE;
    self.effect.light0.position = GLKVector4Make(1.0f, 1.0f, 1.0f, 1.0f);
    self.effect.light0.specularColor = GLKVector4Make(0.25f, 0.25f, 0.25f, 1.0f);
    self.effect.light0.diffuseColor = GLKVector4Make(0.75f, 0.75f, 0.75f, 1.0f);
}

- (void)setMatrices {
    const GLfloat aspectRatio = (GLfloat)(self.view.bounds.size.width) / (GLfloat)(self.view.bounds.size.height);
    const GLfloat fieldView = GLKMathDegreesToRadians(90.0f);
    const GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(fieldView, aspectRatio, 0.1f, 10.0f);
    self.effect.transform.projectionMatrix = projectionMatrix;
    
    GLKMatrix4 modelViewMatrix = GLKMatrix4Identity;
    modelViewMatrix = GLKMatrix4Translate(modelViewMatrix, 0.0f, 0.0f, -5.0f);
    modelViewMatrix = GLKMatrix4RotateX(modelViewMatrix, GLKMathDegreesToRadians(45.0f));
    modelViewMatrix = GLKMatrix4RotateY(modelViewMatrix, GLKMathDegreesToRadians(self.rotate));
    modelViewMatrix = GLKMatrix4RotateZ(modelViewMatrix, GLKMathDegreesToRadians(self.rotate));
    self.effect.transform.modelviewMatrix = modelViewMatrix;
}

@end
