//
//  DemoCave.m
//  TEORWorldMapTest
//
//  Created by Zach Babb on 12/30/13.
//
//

#import "DemoCave.h"
#import "GameController.h"
#import "AbstractBattleEnemy.h"
#import "FontManager.h"
#import "InputManager.h"
#import "SoundManager.h"
#import "ScriptReader.h"
#import "PackedSpriteSheet.h"
#import "TiledMap.h"
#import "ParticleEmitter.h"
#import "Animation.h"
#import "Image.h"
#import "Projectile.h"
#import "Character.h"
#import "StringWithDuration.h"
#import "AbstractBattleEnemy.h"
#import "AbstractEntity.h"
#import "FadeInOrOut.h"
#import "Textbox.h"
#import "Choicebox.h"
#import "Teleportal.h"
#import "Seior.h"
#import "BattleWizard.h"
#import "BattlePriest.h"
#import "OverMind.h"
#import "MoveMap.h"
#import "WorldFlashColor.h"
#import "Bats.h"
#import "Seior.h"
#import "Baal.h"

@implementation DemoCave

- (id)init {
    self = [super init];
    if (self) {
        battleImage = [[Image alloc] initWithImageNamed:@"AlfheimBackground.png" filter:GL_NEAREST];
        battleFont = [sharedFontManager getFontWithKey:@"battleFont"];
        sceneMap = [[TiledMap alloc] initWithFileName:@"cave" fileExtension:@"tmx"];
        cutScene = YES;
        cutSceneTimer = 0.5;
        [sharedInputManager setState:kNoTouchesAllowed];
        [FadeInOrOut fadeInWithDuration:2];
        sharedGameController.gameState = kGameState_World;
        sharedGameController.realm = kRealm_Alfheim;
        Seior *seior = [[Seior alloc] initAtLocation:CGPointMake(5 * 64, 60 * 64)];
        Baal *baal = [[Baal alloc] initAtLocation:CGPointMake(1 * 64, 60 * 64)];
        sharedGameController.player = baal;
        [self addEntityToActiveEntities:seior];
        [self addEntityToActiveEntities:baal];
        [seior release];
        [baal release];
        [self createCollisionMapArray];
        [self createPortalsArray];
        [sharedSoundManager loadMusicWithKey:@"Cave" musicFile:@"evil cave.mp3"];
        [sharedSoundManager loadMusicWithKey:@"Mountain" musicFile:@"overworld 1.mp3"];
        allowBattles = NO;
        stage = 0;

    }
    
    return self;
}

- (void)moveToNextStageInScene {
    switch (stage) {
        case 0:
            cutScene = NO;
            [sharedInputManager setState:kWalkingAround_NoTouches];
            stage = 1;
            break;
        case 1:
            NSLog(@"Getting to that next stage for some reason.");
            break;
        default:
            break;
    }
}

- (void)createPortalsArray {
    
    /*portals[64][34] = CGPointMake(98, 4);
    portals[64][33] = CGPointMake(98, 4);
    portals[97][2] = CGPointMake(99, 1400);
    portals[97][3] = CGPointMake(99, 1400);
    portals[97][4] = CGPointMake(99, 1400);
    portals[97][5] = CGPointMake(99, 1400);
    portals[97][6] = CGPointMake(99, 1400);
    portals[97][7] = CGPointMake(99, 1400);
    portals[60][20] = CGPointMake(99, 15);
    portals[61][20] = CGPointMake(99, 15);
    portals[42][2] = CGPointMake(99, 50);
    portals[42][3] = CGPointMake(99, 50);
    portals[42][4] = CGPointMake(99, 50);
    portals[42][5] = CGPointMake(99, 50);
    portals[90][32] = CGPointMake(33, 34);
    portals[90][31] = CGPointMake(33, 34);
    portals[90][37] = CGPointMake(76, 49);
    portals[90][36] = CGPointMake(76, 49);
    portals[94][39] = CGPointMake(35, 22);
    portals[95][39] = CGPointMake(35, 22);
    portals[96][39] = CGPointMake(35, 22);
    portals[33][33] = CGPointMake(99, 88);
    portals[33][34] = CGPointMake(99, 88);
    portals[33][35] = CGPointMake(99, 88);
    portals[76][49] = CGPointMake(99, 88);
    portals[75][49] = CGPointMake(99, 88);
    portals[35][21] = CGPointMake(99, 88);
    portals[35][22] = CGPointMake(99, 88);
    portals[35][23] = CGPointMake(99, 88);
    portals[21][47] = CGPointMake(99, 890);
    portals[22][47] = CGPointMake(99, 890);
    portals[23][47] = CGPointMake(99, 890);
    portals[24][47] = CGPointMake(99, 890);
    portals[25][47] = CGPointMake(99, 890);
    portals[24][76] = CGPointMake(38, 74);
    portals[35][79] = CGPointMake(99, 152);
    portals[36][79] = CGPointMake(99, 152);
    portals[37][79] = CGPointMake(99, 152);
    portals[38][79] = CGPointMake(99, 152);
    portals[39][79] = CGPointMake(99, 152);
    portals[40][79] = CGPointMake(99, 152);
    portals[37][90] = CGPointMake(53, 62);
    portals[48][67] = CGPointMake(99, 155);
    portals[49][67] = CGPointMake(99, 155);
    portals[50][67] = CGPointMake(99, 155);
    portals[51][67] = CGPointMake(99, 155);
    portals[52][67] = CGPointMake(99, 155);
    portals[53][67] = CGPointMake(99, 155);
    portals[54][67] = CGPointMake(99, 155);
    portals[55][67] = CGPointMake(99, 155);
    portals[56][67] = CGPointMake(99, 155);
    portals[57][67] = CGPointMake(99, 155);
    portals[58][67] = CGPointMake(99, 155);
    portals[61][81] = CGPointMake(99, 159);
    portals[61][80] = CGPointMake(99, 159);
    portals[61][79] = CGPointMake(99, 159);
    portals[61][78] = CGPointMake(99, 159);
    portals[61][77] = CGPointMake(99, 159);
    portals[35][85] = CGPointMake(99, 166);
    portals[36][85] = CGPointMake(99, 166);
    portals[37][85] = CGPointMake(99, 166);
    portals[38][85] = CGPointMake(99, 166);
    portals[39][85] = CGPointMake(99, 166);
    portals[40][85] = CGPointMake(99, 166);
    portals[68][91] = CGPointMake(99, 197);
    portals[68][90] = CGPointMake(99, 197);
    portals[68][89] = CGPointMake(99, 197);*/
    
    
    
    
    //Allow battles portals
    /*
     portals[33][33] = CGPointMake(99, kAllowBattles);
     portals[33][34] = CGPointMake(99, kAllowBattles);
     portals[33][35] = CGPointMake(99, kAllowBattles);
     portals[76][49] = CGPointMake(99, kAllowBattles);
     portals[75][49] = CGPointMake(99, kAllowBattles);
     portals[35][21] = CGPointMake(99, kAllowBattles);
     portals[35][22] = CGPointMake(99, kAllowBattles);
     portals[35][23] = CGPointMake(99, kAllowBattles);
     portals[21][47] = CGPointMake(99, kAllowBattles);
     portals[22][47] = CGPointMake(99, kAllowBattles);
     portals[23][47] = CGPointMake(99, kAllowBattles);
     portals[24][47] = CGPointMake(99, kAllowBattles);
     portals[25][47] = CGPointMake(99, kAllowBattles);*/
    
    
}

- (void)createCollisionMapArray {
    
    int collisionLayerIndex = [sceneMap layerIndexWithName:@"Collisions"];
    Layer *collisionLayer = [[sceneMap layers] objectAtIndex:collisionLayerIndex];
    for (int yy = 0; yy < 100; yy++) {
        for (int xx = 0; xx < 100; xx++) {
            int globalTileId = [collisionLayer globalTileIDAtTile:CGPointMake(xx, yy)];
            if (globalTileId != -1) {
                blocked[xx][yy] = YES;
            }
        }
    }
}

- (BOOL)checkForPortal {
    // NSLog(@"Checking for portal with portal value (%f, %f).", portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].x, portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].y);
    NSLog(@"Stage is: %d", stage);
    if (portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].x != 0 || portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].y != 0) {
        if (portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].x == 99 && portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].y == stage) {
            [self moveToNextStageInScene];
            return YES;
        } else if (portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].x == 99 && portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].y == kAllowBattles) {
            allowBattles = YES;
        }
        
        else if(portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].x == 99 && portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y].y != stage) {
            return NO;
        } else {
            [Teleportal teleportalToTile:portals[(int)sharedGameController.player.currentTile.x][(int)sharedGameController.player.currentTile.y]];
            return YES;
        }
    }
    return NO;
}

- (BOOL)isBlocked:(float)x y:(float)y {
    
    return blocked[(int)x][(int)y];
}

@end
