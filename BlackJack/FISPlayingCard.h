//
//  FISPlayingCard.h
//  BlackJack
//
//  Created by Wo Jun Feng on 10/2/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISPlayingCard : NSObject

@property (nonatomic, strong)NSNumber *rank;
@property (nonatomic, strong)NSString *suit;

- (instancetype)init;
- (instancetype)initWithSuit:(NSString *)suit
                        rank:(NSNumber *)rank;
- (BOOL)validSuit:(NSString *)suit;
- (BOOL)validRank:(NSNumber *)rank;
- (void)setSuit:(NSString *)newSuit;
- (void)setRank:(NSNumber *)newRank;

@end
