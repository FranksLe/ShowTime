//
//  ArtistService.h
//  Artist
//
//  Created by lienbao on 15/4/21.
//  Copyright (c) 2015年 lienbao. All rights reserved.
//

#import "NetworkService.h"

static NSString *serviceUidKey = @"serviceUid";
static NSString *serviceTokenKey = @"serviceTokenKey";

#if DEBUG
static NSString * const kArtistServiceUrl = @"http://api.jiazu.co/api/";
// @"http://test.jiazu.co/api/"
#else
static NSString * const kArtistServiceUrl = @"http://api.jiazu.co/api/";
#endif

@interface ArtistService : NetworkService

@end
