//
//  DemoCave.h
//  TEORWorldMapTest
//
//  Created by Zach Babb on 12/30/13.
//
//

#import "AbstractScene.h"

@interface DemoCave : AbstractScene {
    BOOL blocked[100][100];
    CGPoint portals[100][100];
    CGPoint portalDestination[7];
}

- (void)initCaveBoss;

@end
