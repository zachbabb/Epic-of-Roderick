//
//  HagalazMenuAnimation.m
//  TEORWorldMapTest
//
//  Created by Zach Babb on 6/24/11.
//  Copyright 2011 InstantLazer. All rights reserved.
//

#import "HagalazMenuAnimation.h"
#import "GameController.h"
#import "AbstractScene.h"
#import "Image.h"

@implementation HagalazMenuAnimation

- (void)dealloc {
	
	[super dealloc];
}

- (id)init {
	
	if (self = [super init]) {
		[self moveFromPoint:CGPointMake(260, 270) toPoint:CGPointMake(260, 70)];
		essenceColor = Color4fMake(0, 1, 0, 1);
		runeText = @"Calling on the powerof the Northern wind, Roderick can deal big damage to enemies not ready for the cold. Nordrin gives an ally the ability to attack twice, and shelters all allies from attacks.";
		rune = [[Image alloc] initWithImageNamed:@"Rune165.png" filter:GL_LINEAR];
	}
	return self;
}

- (void)updateWithDelta:(float)aDelta {
	
	[super updateWithDelta:aDelta];
	if (duration < 0) {
		switch (stage) {
			case 0:
				stage++;
				[self moveFromPoint:CGPointMake(360, 270) toPoint:CGPointMake(360, 70)];
				break;
			case 1:
				stage++;
				[self moveFromPoint:CGPointMake(260, 220) toPoint:CGPointMake(360, 120)];
				break;
			case 2:
				stage++;
				velocity = Vector2fMake(0, 0);
				duration = 2;
				break;
				
			case 3:
				[[GameController sharedGameController].currentScene removeDrawingImages];
				stage = 0;
				[self moveFromPoint:CGPointMake(260, 270) toPoint:CGPointMake(260, 70)];
				break;
				
			default:
				break;
		}
	}
}

- (void)resetAnimation {
    [self moveFromPoint:CGPointMake(260, 270) toPoint:CGPointMake(260, 70)];
	stage = 0;
}
@end