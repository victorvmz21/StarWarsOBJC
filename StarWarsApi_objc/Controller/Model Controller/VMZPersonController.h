//
//  VMZPersonController.h
//  StarWarsApi_objc
//
//  Created by Victor Monteiro on 6/25/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMZPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface VMZPersonController : NSObject

+ (void)fetchPersonWithName:(NSString *)searchTerm completion:(void (^)(VMZPerson *))completion;


@end

NS_ASSUME_NONNULL_END
