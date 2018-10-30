//
//  NSString+Extended.m
//  VSaver
//
//  Created by Jarek Pendowski on 11/10/2018.
//  Copyright © 2018 Jarek Pendowski. All rights reserved.
//

#import "NSString+Extended.h"
#import "NSArray+Extended.h"

@implementation NSString (Extended)

- (NSString *)stringByTrimmingEachLine
{
    NSArray<NSString *> *lines = [self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return [[lines vss_map:^id _Nullable (NSString *line) {
        return [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }] componentsJoinedByString:@"\n"];
}

- (NSComparisonResult)vss_compareWithVersion:(NSString *)version
{
    if (self.length == 0 && version.length == 0) {
        return NSOrderedSame;
    }
    
    NSMutableArray<NSString *> *originalComponents = [[self componentsSeparatedByString:@"."] mutableCopy];
    NSMutableArray<NSString *> *compareComponents = [[version componentsSeparatedByString:@"."] mutableCopy];
    
    while (originalComponents.count < compareComponents.count) {
        [originalComponents addObject:@"0"];
    }
    while (compareComponents.count < originalComponents.count) {
        [compareComponents addObject:@"0"];
    }
    
    for (NSInteger i = 0; i < originalComponents.count; i++) {
        NSInteger original = [originalComponents[i] integerValue];
        NSInteger compare = [compareComponents[i] integerValue];
        
        if (original < compare) {
            return NSOrderedAscending;
        } else if (original > compare) {
            return NSOrderedDescending;
        }
    }
    
    return NSOrderedSame;
}

@end
