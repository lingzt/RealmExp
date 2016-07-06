//
//  House.h
//  RealmExp
//
//  Created by ling toby on 7/6/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import <Realm/Realm.h>

@interface House : RLMObject
@property (strong,nonatomic) NSString *guestName;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<House>
RLM_ARRAY_TYPE(House)
