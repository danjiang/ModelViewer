//
//  ViewController.m
//  ModelViewer
//
//  Created by Dan Jiang on 2018/9/12.
//  Copyright © 2018年 Dan Jiang. All rights reserved.
//

#import "ViewController.h"
#import "starship.h"
#import "cube.h"
#import "PhongShader.h"
#import "Transformations.h"

typedef enum Models
{
    M_CUBE,
    M_STARSHIP,
}
Models;

@interface ViewController ()

@property (nonatomic, strong) PhongShader *phongShader;
@property (nonatomic, assign) float rotate;
@property (nonatomic, assign) Models model;
@property (nonatomic, strong) Transformations *transformations;

@end

@implementation ViewController

- (IBAction)selectModel:(UISegmentedControl *)sender {
    self.paused = YES;
    
    int m = (int)sender.selectedSegmentIndex;
    switch (m) {
        case 0:
            self.model = M_CUBE;
            break;
        case 1:
            self.model = M_STARSHIP;
            break;
    }
    
    [self loadTexture];
    
    self.paused = NO;
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:sender.view];
    float x = translation.x / sender.view.frame.size.width;
    float y = translation.y / sender.view.frame.size.height;
    if (sender.numberOfTouches == 1 && (self.transformations.state == S_NEW || self.transformations.state == S_TRANSLATION)) {
        [self.transformations translate:GLKVector2Make(x, y) withMultiplier:5.0f];
    } else if (sender.numberOfTouches == 2 && (self.transformations.state == S_NEW || self.transformations.state == S_ROTATION)) {
        const float m = GLKMathDegreesToRadians(0.5f);
        CGPoint rotation = [sender translationInView:sender.view];
        [self.transformations rotate:GLKVector3Make(rotation.x, rotation.y, 0.0f) withMultiplier:m];
    }
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    if (self.transformations.state == S_NEW || self.transformations.state == S_SCALE) {
        float scale = [sender scale];
        [self.transformations scale:scale];
    }
}

- (IBAction)rotation:(UIRotationGestureRecognizer *)sender {
    if (self.transformations.state == S_NEW || self.transformations.state == S_ROTATION) {
        float rotation = [sender rotation];
        [self.transformations rotate:GLKVector3Make(0.0f, 0.0f, rotation) withMultiplier:1.0f];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.transformations start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = M_CUBE;

    self.transformations = [[Transformations alloc] initWithDepth:5.0f Scale:2.0f Translation:GLKVector2Make(0.0f, 0.0f) Rotation:GLKVector3Make(0.0f, 0.0f, 0.0f)];
    
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    GLKView *glkView = (GLKView *)self.view;
    glkView.context = context;
    
    glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
    glEnable(GL_CULL_FACE);
    glEnable(GL_DEPTH_TEST);
    
    [self loadShader];
    [self loadTexture];
    
    self.rotate = 0.0f;
}

- (void)loadTexture {
    NSDictionary *options = @{GLKTextureLoaderOriginBottomLeft: @YES};
    NSError *error;
    NSString *path;
    switch (self.model) {
        case M_CUBE:
            path = [[NSBundle mainBundle] pathForResource:@"cube_decal.png" ofType:nil];
            break;
        case M_STARSHIP:
            path = [[NSBundle mainBundle] pathForResource:@"starship_decal.png" ofType:nil];
            break;
    }
    GLKTextureInfo *texture = [GLKTextureLoader textureWithContentsOfFile:path options:options error:&error];
    
    if (texture == nil) {
        NSLog(@"Error loading file: %@", [error localizedDescription]);
    }
    
    glBindTexture(GL_TEXTURE_2D, texture.name);
    glUniform1i(self.phongShader.uTexture, 0);
}

- (void)loadShader {
    self.phongShader = [PhongShader new];
    glUseProgram(self.phongShader.program);
}

- (void)update {
    self.rotate += 1.0f;
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self setMatrices];
    
    glEnableVertexAttribArray(self.phongShader.aPosition);
    glEnableVertexAttribArray(self.phongShader.aNormal);
    glEnableVertexAttribArray(self.phongShader.aTexel);
    
    switch (self.model) {
        case M_CUBE:
            [self renderCube];
            break;
        case M_STARSHIP:
            [self renderStarship];
            break;
    }
}

- (void)setMatrices {
    const GLfloat aspectRatio = (GLfloat)(self.view.bounds.size.width) / (GLfloat)(self.view.bounds.size.height);
    const GLfloat fieldView = GLKMathDegreesToRadians(90.0f);
    const GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(fieldView, aspectRatio, 0.1f, 10.0f);
    glUniformMatrix4fv(self.phongShader.uProjectionMatrix, 1, 0, projectionMatrix.m);
    
    GLKMatrix4 modelViewMatrix = [self.transformations getModelViewMatrix];
    glUniformMatrix4fv(self.phongShader.uModelViewMatrix, 1, 0, modelViewMatrix.m);
    
    bool invertible;
    GLKMatrix3 normalMatrix = GLKMatrix4GetMatrix3(GLKMatrix4InvertAndTranspose(modelViewMatrix, &invertible));
    if (!invertible) {
        NSLog(@"MV matrix is not invertible");
    }
    glUniformMatrix3fv(self.phongShader.uNormalMatrix, 1, 0, normalMatrix.m);
}

- (void)renderCube {
    glVertexAttribPointer(self.phongShader.aPosition, 3, GL_FLOAT, GL_FALSE, 0, cubePositions);
    glVertexAttribPointer(self.phongShader.aTexel, 2, GL_FLOAT, GL_FALSE, 0, cubeTexels);
    glVertexAttribPointer(self.phongShader.aNormal, 3, GL_FLOAT, GL_FALSE, 0, cubeNormals);
    
    for (int i = 0; i < cubeMaterials; i++) {
        glUniform3f(self.phongShader.uDiffuse, cubeDiffuses[i][0], cubeDiffuses[i][1], cubeDiffuses[i][2]);
        glUniform3f(self.phongShader.uSpecular, cubeSpeculars[i][0], cubeSpeculars[i][1], cubeSpeculars[i][2]);
        
        glDrawArrays(GL_TRIANGLES, cubeFirsts[i], cubeCounts[i]);
    }
}

- (void)renderStarship {
    glVertexAttribPointer(self.phongShader.aPosition, 3, GL_FLOAT, GL_FALSE, 0, starshipPositions);
    glVertexAttribPointer(self.phongShader.aTexel, 2, GL_FLOAT, GL_FALSE, 0, starshipTexels);
    glVertexAttribPointer(self.phongShader.aNormal, 3, GL_FLOAT, GL_FALSE, 0, starshipNormals);
    
    for (int i = 0; i < starshipMaterials; i++) {
        glUniform3f(self.phongShader.uDiffuse, starshipDiffuses[i][0], starshipDiffuses[i][1], starshipDiffuses[i][2]);
        glUniform3f(self.phongShader.uSpecular, starshipSpeculars[i][0], starshipSpeculars[i][1], starshipSpeculars[i][2]);
        
        glDrawArrays(GL_TRIANGLES, starshipFirsts[i], starshipCounts[i]);
    }
}

@end
