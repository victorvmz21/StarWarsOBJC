//
//  VMZPersonController.m
//  StarWarsApi_objc
//
//  Created by Victor Monteiro on 6/25/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

#import "VMZPersonController.h"

NSString * const baseURLString = @"https://swapi.dev/api";
NSString * const peopleEndPoint = @"people";

@implementation VMZPersonController

+ (void)fetchPersonWithName:(NSString *)searchTerm completion:(void (^)(VMZPerson * _Nullable))completion
{
    //buildingURL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL * peopleURL = [baseURL URLByAppendingPathComponent:peopleEndPoint];
    NSURL *finalURL = [peopleURL URLByAppendingPathComponent:searchTerm];
    NSLog(@"%@",finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
        }
        
        if (data)
        {
            NSDictionary *topLevel = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!topLevel)
            {
                NSLog(@"%@", error.localizedDescription);
                completion(nil);
                
            }
            
            VMZPerson *person = [[VMZPerson alloc]initWithDictionary:topLevel];
            completion(person);
        }
        
    }] resume];
}

@end
