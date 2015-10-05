//
//  FISPlayingCardDeck.h
//  BlackJack
//
//  Created by Wo Jun Feng on 10/4/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCard.h"

@interface FISPlayingCardDeck : FISPlayingCard

@property (nonatomic, strong, readonly) NSMutableArray *cards;

- (FISPlayingCard *)drawRandomCard;
- (instancetype)init;

@end
