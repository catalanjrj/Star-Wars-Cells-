//
//  Character.m
//  StarWarsCells
//
//  Created by Jorge Catalan on 5/4/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "Character.h"

@implementation Character
+ (Character *)characterWithDictionary:(NSDictionary *)charDict
{
    Character *aCharacter = nil;
    {if (charDict) {
        aCharacter = [[Character alloc] init];
        aCharacter.name = charDict[@"name"];
        aCharacter.charDescription = charDict[@"charDescription"];
        aCharacter.image = charDict[@"image"];
      
        
    }
        return aCharacter;
    }
    
}

@end
