//
//  VMZPerson.h
//  StarWarsApi_objc
//
//  Created by Victor Monteiro on 6/25/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VMZPerson : NSObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSString *height;

- (instancetype)initWithName:(NSString *)name height:(NSString *)height;

@end


@interface VMZPerson (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id>*)dictionary;

@end

NS_ASSUME_NONNULL_END
