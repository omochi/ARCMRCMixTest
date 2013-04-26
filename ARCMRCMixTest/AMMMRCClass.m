//
//  AMMMRCClass.m
//  ARCMRCMixTest
//
//  Created by おもちメタル on 13/04/27.
//  Copyright (c) 2013年 com.omochimetaru. All rights reserved.
//

#import "AMMMRCClass.h"

#import "AMMARCClass.h"

@implementation AMMMRCClass

-(id)initWithName:(NSString *)name{
	self = [super init];
	if(self){
		NSLog(@"MRC %@ init",name);
		_name = [name retain];
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"MRC %@ dealloc",self.name);
    [_name release];
    [super dealloc];
}

+(AMMMRCClass *)makeRetainedWithName:(NSString *)name{
	return [[AMMMRCClass alloc]initWithName:name];
}

+(AMMMRCClass *)makeRetainedAnnotatedWithName:(NSString *)name{
	return [[AMMMRCClass alloc]initWithName:name];
}

@end

void AMMMRCTest(){
	//MRC側からARCのコードを使えるか
	
	NSLog(@"--- 8");
	@autoreleasepool {
		if(YES){
			AMMARCClass * h = [[[AMMARCClass alloc]initWithName:@"house"]autorelease];
			AMMARCClass * i = [AMMARCClass makeRetainedWithName:@"ion"];
			AMMARCClass * j = [AMMARCClass makeRetainedAnnotatedWithName:@"joke"];
			(void)h,(void)i,(void)j;
			[j release];
		}
		NSLog(@"--- 9");
	}
	//ここで解放されれば正しい
	NSLog(@"--- 10");
	
	
}
