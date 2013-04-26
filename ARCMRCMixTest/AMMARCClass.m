//
//  AMMARCClass.m
//  ARCMRCMixTest
//
//  Created by おもちメタル on 13/04/27.
//  Copyright (c) 2013年 com.omochimetaru. All rights reserved.
//

#import "AMMARCClass.h"
#import "AMMMRCClass.h"

@implementation AMMARCClass

-(id)initWithName:(NSString *)name{
	self = [super init];
	if(self){
		NSLog(@"ARC %@ init",name);
		_name = name;
	}
	return self;
}

- (void)dealloc{
	NSLog(@"ARC %@ dealloc",self.name);
}

+(AMMARCClass *)makeRetainedWithName:(NSString *)name{
	return [[AMMARCClass alloc]initWithName:name];
}

+(AMMARCClass *)makeRetainedAnnotatedWithName:(NSString *)name{
	return [[AMMARCClass alloc]initWithName:name];
}

+(void)makeAndReturnByDoublePointerStrongWithName:(NSString *)name
											 dest:(AMMARCClass * __strong *)dest{
	if(dest)*dest = [[AMMARCClass alloc]initWithName:name];
}

@end

void AMMARCTest(){
	NSLog(@"--- 1");

	@autoreleasepool {
		if(YES){
			AMMARCClass * __strong a = [[AMMARCClass alloc]initWithName:@"apple"];
			AMMARCClass * __autoreleasing b = [[AMMARCClass alloc]initWithName:@"banana"];
			(void)a,(void)b;
		}
		NSLog(@"--- 2");//スコープを抜けるのでaが解放される
	}
	NSLog(@"--- 3");//autoreleaseされてbが解放される
	
	//ARC環境でMRCでretainedな返り値を受け取るとどうなるのか？
	@autoreleasepool {
		if(YES){
			AMMMRCClass * __strong c = [[AMMMRCClass alloc]initWithName:@"cherry"];
			AMMMRCClass * __strong d = [AMMMRCClass makeRetainedWithName:@"doll"];
			AMMMRCClass * __strong e = [AMMMRCClass makeRetainedAnnotatedWithName:@"eye"];
			(void)c,(void)d,(void)e;
			//dがリーク、eがここで解放されたということは、
			//dは解放が足りない、つまり、dに対してはautoreleaseを前提にしていたという事
		}
		NSLog(@"--- 4");
	}
	NSLog(@"--- 5");
	
	//ではARCで注釈なしの一般のメソッドはautoreleaseするようになっているのだろうか
	@autoreleasepool {
		if(YES){
			AMMARCClass * __strong f = [AMMARCClass makeRetainedWithName:@"fish"];
			AMMARCClass * __strong g = [AMMARCClass makeRetainedAnnotatedWithName:@"girl"];
			(void)f,(void)g;
		}
		NSLog(@"--- 6");
	}
	//fがここで解放されたということは、デフォルトではautoreleaseしている
	NSLog(@"--- 7");
	

}

void AMMARCTest2(){
	//returns_retainedでもARCなら解放漏れしない
	NSLog(@"--- 11");
	@autoreleasepool {
		if(YES) {
			(void)[[AMMARCClass alloc]initWithName:@"knight"];
			[AMMARCClass makeRetainedWithName:@"lime"];
			[AMMARCClass makeRetainedAnnotatedWithName:@"money"];
			(void)[[AMMMRCClass alloc]initWithName:@"nuke"];
			[AMMMRCClass makeRetainedWithName:@"ocean"];
			[AMMMRCClass makeRetainedAnnotatedWithName:@"pine"];
		}
		NSLog(@"--- 12");
	}
	NSLog(@"--- 13");

}