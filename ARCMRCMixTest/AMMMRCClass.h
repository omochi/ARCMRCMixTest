//
//  AMMMRCClass.h
//  ARCMRCMixTest
//
//  Created by おもちメタル on 13/04/27.
//  Copyright (c) 2013年 com.omochimetaru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMMMRCClass : NSObject

@property(nonatomic,retain)NSString *name;

-(id)initWithName:(NSString *)name;

+(AMMMRCClass *)makeRetainedWithName:(NSString *)name;
+(AMMMRCClass *)makeRetainedAnnotatedWithName:(NSString *)name NS_RETURNS_RETAINED;

@end

void AMMMRCTest();