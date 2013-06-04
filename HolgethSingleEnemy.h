//
//  HolgethSingleEnemy.h
//  TEORWorldMapTest
//
//  Created by Zach Babb on 6/27/11.
//  Copyright 2011 InstantLazer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractBattleAnimation.h"

@interface HolgethSingleEnemy : AbstractBattleAnimation {
    
    NSMutableArray *birdProjectiles;
    int birdIndex;
}

@end