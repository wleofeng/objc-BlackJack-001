//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Wo Jun Feng on 10/4/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

// should initialize playingCardDeck with a new deck, set handScore and isBusted to default values
- (instancetype)init{
    self = [super init];
    if (self) {
        _playingCardDeck = [[FISPlayingCardDeck alloc]init];
        _hand = [[NSMutableArray alloc]init];
        _handScore = @0;
        _isBusted = NO;
    }
    return self;
}

// should deal 2 new cards and add those cards to the hand.
- (void)deal{
    for (NSInteger i = 0 ; i < 2; i ++) {
        [self.hand addObject:[self drawRandomCard]];
    }
    
    [self checkForBlackjack];
}

// should deal one additional card and add it card to the hand.
- (void)hit{
    if ([self.hand count] >= 2 && !self.isBusted && !self.isBlackjack){
        [self.hand addObject:[self drawRandomCard]];
    }
    
    [self checkForBusted];
    [self checkForBlackjack];
}

- (void)setHand:(NSMutableArray *)hand{
    _hand = hand;
    _isBusted = [self checkForBusted];
    _isBlackjack = [self checkForBlackjack];
    _handScore = @([self calculateScoreWithHand:hand]);
}

- (BOOL)checkForBusted{
    self.isBusted = [self calculateScoreWithHand:self.hand] > 21;
    return self.isBusted;
}

- (BOOL)checkForBlackjack{
    self.isBlackjack = [self calculateScoreWithHand:self.hand] == 21;
    return self.isBlackjack;
}

- (NSUInteger)calculateScoreWithHand:(NSMutableArray *)hand{
    NSInteger total = 0;
    NSSortDescriptor *sortByRankDesc = [NSSortDescriptor sortDescriptorWithKey:@"self.rank" ascending:NO];
    NSArray *sortedHand = [hand sortedArrayUsingDescriptors:@[sortByRankDesc]];
    
    for (FISPlayingCard *card in sortedHand) {
        if ([card.rank  isEqual: @(11)] ||
            [card.rank  isEqual: @(12)] ||
            [card.rank  isEqual: @(13)]) {
            card.rank  = @(10);
        }
        //should use ace as 11 whenever possible, but use ace as 1 if using it as an 11 would make the handscore greater than 21"
        // only one Ace can be = 11
        // 9+1+1+1
        // 9+11+1+1
        // 10+1+1
        // 10+10+1+1 ok
        // 8+1+1+1
        // 7+5+1+1
        // 2+1+1
        if ([card.rank  isEqual: @(1)] && card == sortedHand[[sortedHand count]-1]) {
            if (total+11 > 21) {
                total += 1;
            } else {
                total += 11;
            }
            continue;
        }
        
        total += [card.rank integerValue];
    }
    
    return total;
}
@end
