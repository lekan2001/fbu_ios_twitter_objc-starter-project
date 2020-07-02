//
//  User.h
//  twitter
//
//  Created by Olalekan Abdurazaq Adisa on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject


//Add properties
@property (nonatomic, strong) NSString *name;
@property (nonatomic,strong) NSString *screenName;



//Create initializer
//-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
