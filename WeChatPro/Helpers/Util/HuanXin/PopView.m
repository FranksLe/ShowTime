//
//  PopView.m
//  YRJJApp
//
//  Created by panbin on 15/1/31.
//  Copyright (c) 2015年 luwelong. All rights reserved.
//

#import "PopView.h"
#import "IconsModel.h"
#import "BtnTextView.h"
#import "MessageMacro.h"
#import "MessageCountModel.h"

@interface PopView()

@property (nonatomic, strong) NSMutableArray *btnTextViewArray;

@end

@implementation PopView

- (NSMutableArray *)btnTextViewArray
{
    if (_btnTextViewArray == nil) {
        _btnTextViewArray = [[NSMutableArray alloc] init];
    }
    
    return _btnTextViewArray;
}

- (id)initWithFrame:(CGRect)frame withNumArray:(NSArray *)items
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //add bg
        UIImage *orgImage = [UIImage imageNamed:@"top_rect_view"];
        
        UIImage *resizeImage = [orgImage resizableImageWithCapInsets:UIEdgeInsetsMake(orgImage.size.height/2 - 1, orgImage.size.width/2 - 1, orgImage.size.height/2, orgImage.size.width/2) resizingMode:UIImageResizingModeStretch];
        
        UIImageView *backGroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width + 5, TEXT_VIEW_HEIGHT)];
        backGroundView.backgroundColor = [UIColor clearColor];
        [backGroundView setImage:resizeImage];
        [self addSubview:backGroundView];
        
        CGFloat tranX = (frame.size.width - TRAN_VIEW_WITH)/2;
        
        
        UIImageView *tranImageView = [[UIImageView alloc] initWithFrame:CGRectMake(tranX, TEXT_VIEW_HEIGHT - 1, TRAN_VIEW_WITH, TRAN_VIEW_HEIGHT)];
        tranImageView.backgroundColor = [UIColor clearColor];
        [tranImageView setImage:[UIImage imageNamed:@"it_tract"]];
        [self addSubview:tranImageView];
        
        
        NSInteger numItems = [items count];
        
        for (int i = 0; i < numItems; i++) {
            
            IconsModel *model = [items objectAtIndex:i];
            
            CGFloat with = frame.size.width / numItems;
            
            CGRect textViewRect = CGRectMake(i*with + 8, 0, with, TEXT_VIEW_HEIGHT);
            
            BtnTextView *textView = [[BtnTextView alloc] initWithFrame:textViewRect withIconName:model.iconName withNumTitle:model.iconTitle];
            
            textView.tag = i;
            
            //save
            [self.btnTextViewArray addObject:textView];
            
            [textView addTarget:self action:@selector(doTextViewClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:textView];
        }
    }
    
    return self;
}

- (void)fillWithObject:(NSArray *)object
{
    for (int i = 0; i < [object count]; i++) {
        
        BtnTextView *textView = [self.btnTextViewArray objectAtIndex:i];
        
        [textView fillWithObject:[object objectAtIndex:i]];
    }
}

- (void)doTextViewClicked:(id)sender
{
    BtnTextView *textView = (BtnTextView *)sender;
    
    if ((_delegate) && [_delegate respondsToSelector:@selector(popView:btnClicked:)]) {
        [_delegate popView:self btnClicked:textView.tag];
    }
    
}

@end