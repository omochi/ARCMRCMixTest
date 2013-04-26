//
//  AMMARCClass.h
//  ARCMRCMixTest
//
//  Created by おもちメタル on 13/04/27.
//  Copyright (c) 2013年 com.omochimetaru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMMARCClass : NSObject

@property(nonatomic,strong)NSString *name;

-(id)initWithName:(NSString *)name;

+(AMMARCClass *)makeRetainedWithName:(NSString *)name;
+(AMMARCClass *)makeRetainedAnnotatedWithName:(NSString *)name NS_RETURNS_RETAINED;

@end

void AMMARCTest();
void AMMARCTest2();