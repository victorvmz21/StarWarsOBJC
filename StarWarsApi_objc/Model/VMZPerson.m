//
//  VMZPerson.m
//  StarWarsApi_objc
//
//  Created by Victor Monteiro on 6/25/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

#import "VMZPerson.h"

@implementation VMZPerson

- (instancetype)initWithName:(NSString *)name height:(NSString *)height
{
    self = [super init];
    if (self)
    {
        _name = name;
        _height = height;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *height = dictionary[@"height"] ;
    
    return [self initWithName:name height:height];
}


@end
