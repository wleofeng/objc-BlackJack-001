//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by Wo Jun Feng on 10/4/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCardDeck.h"

@interface FISBlackjackGame : FISPlayingCardDeck

@property (strong, nonatomic) FISPlayingCardDeck *playingCardDeck; // the playingCardDeck in use
@property (strong, nonatomic) NSNumber *handScore; // returns the total value of cards in the hand. Remember: Aces can be 1 or 11 !!!
@property (strong, nonatomic) NSMutableArray *hand; //returns the cards in the hand
@property (nonatomic) BOOL isBusted; // returns YES if handScore is more than 21
@property (nonatomic) BOOL isBlackjack; // returns YES if handScore is 21

- (instancetype)init; // should initialize playingCardDeck with a new deck, set handScore and isBusted to default values
- (void)deal; // should deal 2 new cards and add those cards to the hand.
- (void)hit; // should deal one additional card and add it card to the hand.
- (NSUInteger)calculateScoreWithHand:(NSMutableArray *)hand;
- (void)setHand:(NSMutableArray *)hand;

@end
