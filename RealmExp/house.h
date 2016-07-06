//
//  house.h
//  
//
//  Created by ling toby on 7/6/16.
//
//

#import <Realm/Realm.h>

@interface house : RLMObject
@property (strong,nonatomic) NSString *streetName;
@property (nonatomic) int streetNumber;
@property(nonatomic, strong) NSString *uniqueID;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<house>
RLM_ARRAY_TYPE(house)
