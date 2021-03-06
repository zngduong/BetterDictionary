//
//  NSView+ExploreViews.m
//  BetterDictionary
//
//  Created by Pooria Azimi on 2/9/12.
//
//  Copyright (c) 2012 Pooria Azimi. All rights reserved.
//

#import "DebugLog.h"
#import "NSView+ExploreViews.h"

@implementation NSView (ExploreViews)

- (void)_exploreViewAtLevel:(int)level
{
	NSMutableString* mutableString = [[NSMutableString alloc] init];
	
	for (int i=0; i<level; i++)
		[mutableString appendString:@"   "];
	
    [mutableString appendFormat:@"%@ | %@", [self className], NSStringFromRect(NSRectFromCGRect([self frame]))];
	
	DebugLog(@"%@", mutableString);
	[mutableString release];
	
	for (NSView *subview in [self subviews])
        [subview _exploreViewAtLevel:(level + 1)];
}

- (void)exploreView
{
	DebugLog(@"=========================================");
	[self _exploreViewAtLevel:0];
	DebugLog(@"=========================================");
}


@end
