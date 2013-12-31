//
//  Baal.m
//  TEORWorldMapTest
//
//  Created by Zach Babb on 12/30/13.
//
//

#import "Baal.h"
#import "GameController.h"
#import "AbstractScene.h"
#import "InputManager.h"
#import "Image.h"
#import "Animation.h"
#import "Textbox.h"
#import "SpriteSheet.h"


@implementation Baal

- (id)initAtLocation:(CGPoint)aLocation
{
    self = [super init];
    if (self) {
        SpriteSheet *baalSheet = [[SpriteSheet alloc] initWithImageNamed:@"baal.png" spriteSize:CGSizeMake(64, 64) spacing:0 margin:0 imageFilter:GL_LINEAR];
		float delay = 0.14;
		
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(3, 0)] delay:delay];
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(4, 0)] delay:delay];
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(3, 0)] delay:delay];
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(5, 0)] delay:delay];
		
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(0, 0)] delay:delay];
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(7, 0)] delay:delay];
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(0, 0)] delay:delay];
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(8, 0)] delay:delay];
		
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(9, 0)] delay:delay];
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(10, 0)] delay:delay];
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(9, 0)] delay:delay];
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(11, 0)] delay:delay];
		
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(6, 0)] delay:delay];
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(1, 0)] delay:delay];
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(6, 0)] delay:delay];
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(2, 0)] delay:delay];
		
		leftAnimation.state = kAnimationState_Stopped;
		leftAnimation.type = kAnimationType_Repeating;
		rightAnimation.state = kAnimationState_Stopped;
		rightAnimation.type = kAnimationType_Repeating;
		upAnimation.state = kAnimationState_Stopped;
		upAnimation.type = kAnimationType_Repeating;
		downAnimation.state = kAnimationState_Stopped;
		downAnimation.type = kAnimationType_Repeating;
		currentAnimation.state = kAnimationState_Stopped;
		currentAnimation.type = kAnimationType_Repeating;
		
		currentAnimation = leftAnimation;
		movementSpeed = 105;
        currentLocation = aLocation;
        stage = 6;
        active = YES;
    }
    
    return self;
}

- (id)initAtTile:(CGPoint)aTile {
    
    self = [super initAtTile:aTile];
    if (self) {
        SpriteSheet *baalSheet = [[SpriteSheet alloc] initWithImageNamed:@"baal.png" spriteSize:CGSizeMake(64, 64) spacing:0 margin:0 imageFilter:GL_LINEAR];
		float delay = 0.14;
		
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(3, 0)] delay:delay];
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(4, 0)] delay:delay];
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(3, 0)] delay:delay];
		[leftAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(5, 0)] delay:delay];
		
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(0, 0)] delay:delay];
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(7, 0)] delay:delay];
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(0, 0)] delay:delay];
		[rightAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(8, 0)] delay:delay];
		
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(9, 0)] delay:delay];
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(10, 0)] delay:delay];
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(9, 0)] delay:delay];
		[upAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(11, 0)] delay:delay];
		
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(6, 0)] delay:delay];
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(1, 0)] delay:delay];
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(6, 0)] delay:delay];
		[downAnimation addFrameWithImage:[baalSheet spriteImageAtCoords:CGPointMake(2, 0)] delay:delay];
		
		
		leftAnimation.state = kAnimationState_Stopped;
		leftAnimation.type = kAnimationType_Repeating;
		rightAnimation.state = kAnimationState_Stopped;
		rightAnimation.type = kAnimationType_Repeating;
		upAnimation.state = kAnimationState_Stopped;
		upAnimation.type = kAnimationType_Repeating;
		downAnimation.state = kAnimationState_Stopped;
		downAnimation.type = kAnimationType_Repeating;
		currentAnimation.state = kAnimationState_Stopped;
		currentAnimation.type = kAnimationType_Repeating;
		
		currentAnimation = leftAnimation;
		movementSpeed = 105;
        currentLocation = CGPointMake(aTile.x * 40.5, aTile.y * 40.5);
        stage = 6;
        active = YES;    }
    return self;
}

- (void)youWereTapped {
	
    if (triggerNextStage) {
        [super youWereTapped];
        [self facePlayerAndStop];
        return;
    }
	
	Textbox *tb = [[Textbox alloc] initWithRect:CGRectMake(0, 0, 480, 100) color:Color4fMake(0.0, 0.0, 1.0, 0.5) duration:-1 animating:YES text:message];
	[sharedGameController.currentScene addObjectToActiveObjects:tb];
	[[InputManager sharedInputManager] setState:kWalkingAround_TextboxOnScreen];
	[self facePlayerAndStop];
	[tb release];
    
}

+ (void)baalAppearAt:(CGPoint)aLocation move:(int)aDirection andFace:(int)aFacing {
    
    Baal *baal = [[Baal alloc] initAtLocation:aLocation];
    [baal fadeIn];
    switch (aDirection) {
        case kMovingUp:
            [baal moveToPoint:CGPointMake(aLocation.x, aLocation.y + 64) duration:1];
            break;
        case kMovingDown:
            [baal moveToPoint:CGPointMake(aLocation.x, aLocation.y - 64) duration:1];
            break;
        case kMovingRight:
            [baal moveToPoint:CGPointMake(aLocation.x + 64, aLocation.y) duration:1];
            break;
        case kMovingLeft:
            [baal moveToPoint:CGPointMake(aLocation.x - 64, aLocation.y) duration:1];
            break;
            
        default:
            break;
    }
    switch (aFacing) {
        case kMovingUp:
            [baal faceUp];
            break;
        case kMovingDown:
            [baal faceDown];
            break;
        case kMovingRight:
            [baal faceRight];
            break;
        case kMovingLeft:
            [baal faceLeft];
            break;
            
        default:
            break;
    }
    [[GameController sharedGameController].currentScene addEntityToActiveEntities:baal];
    [baal release];
}

+ (void)joinParty {
    
    for (Baal *baal in [GameController sharedGameController].currentScene.activeEntities) {
        if ([baal isMemberOfClass:[Baal class]]) {
            [baal moveToPoint:[GameController sharedGameController].player.currentLocation duration:1];
            [baal fadeOut];
        }
    }
}

+ (void)move:(int)aDirection {
    for (Baal *baal in [GameController sharedGameController].currentScene.activeEntities) {
        if ([baal isMemberOfClass:[Baal class]]) {
            switch (aDirection) {
                case kMovingUp:
                    [baal moveToPoint:CGPointMake(baal.currentLocation.x, baal.currentLocation.y + 64) duration:1];
                    break;
                case kMovingDown:
                    [baal moveToPoint:CGPointMake(baal.currentLocation.x, baal.currentLocation.y - 64) duration:1];
                    break;
                case kMovingRight:
                    [baal moveToPoint:CGPointMake(baal.currentLocation.x + 64, baal.currentLocation.y) duration:1];
                    break;
                case kMovingLeft:
                    [baal moveToPoint:CGPointMake(baal.currentLocation.x - 64, baal.currentLocation.y) duration:1];
                    break;
                    
                default:
                    break;
            }
            
        }
    }
    
}


@end
