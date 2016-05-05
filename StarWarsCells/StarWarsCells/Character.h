//
//  Character.h
//  StarWarsCells
//
//  Created by Jorge Catalan on 5/4/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *charDescription;
@property (copy,nonatomic) NSString *image;







+ (Character *)characterWithDictionary:(NSDictionary *)charDict;

@end
