//
//  FISPlayingCardDeck.m
//  BlackJack
//
//  Created by Wo Jun Feng on 10/4/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "FISPlayingCardDeck.h"


@interface FISPlayingCardDeck ()

@property (nonatomic, strong, readwrite) NSMutableArray *cards;

@end

@implementation FISPlayingCardDeck
- (FISPlayingCard *)drawRandomCard{
    FISPlayingCard *card = self.cards[arc4random_uniform([self.cards count])];
    [self.cards removeObject:card];
    return card;
}

- (instancetype)init{
    //13 ranks 4 suits
    NSArray *suits = @[@"♥", @"♠", @"♣", @"♦"];
    _cards  = [[NSMutableArray alloc]init];
    
    for (NSUInteger rank = 1; rank <= 13; rank ++) {
        for (NSString *suit in suits) {
            FISPlayingCard *card = [[FISPlayingCard alloc]initWithSuit:suit rank:@(rank)];
            [_cards addObject:card];
        }
    }

    return self;
}
@end
