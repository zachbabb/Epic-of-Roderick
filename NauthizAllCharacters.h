//
//  NauthizAllCharacters.h
//  TEORWorldMapTest
//
//  Created by Zach Babb on 6/25/11.
//  Copyright 2011 InstantLazer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractBattleAnimation.h"

@class ParticleEmitter;

@interface NauthizAllCharacters : AbstractBattleAnimation {
    
    ParticleEmitter *doubleHealingEmitter;
    float nauthizDuration;
}

@end
