//
//  PRSecureTextFieldCell.m
//  iRecovery
//
//  Created by mac on 15-10-15.
//  Copyright (c) 2015年 Cisdem. All rights reserved.
//

#import "PRSecureTextFieldCell.h"

@implementation PRSecureTextFieldCell
#define _boundary_space_    8

{
    NSButton *_btn;
}
- (void)awakeFromNib
{
    [self addLoadButton];
    [self setUsesSingleLineMode:YES];
    [self setLineBreakMode:NSLineBreakByTruncatingHead];
    [self setDrawsBackground:YES];
    [self setBackgroundColor:[NSColor grayColor ]];
    
}

- (NSRect)loadButtonFrame
{
    NSRect rect = self.controlView.bounds;
    NSRect frame = NSZeroRect;
    frame.size.width = MIN(NSHeight(rect), NSWidth(rect)) * 0.6;
    frame.size.height = NSWidth(frame);
    frame.origin.x = NSWidth(rect) - _boundary_space_ - NSWidth(frame);
    frame.origin.y =  (NSHeight(rect) - NSHeight(frame)) * 0.5;
    return frame;
}



- (void)addLoadButton
{
    _btn = [[NSButton alloc] initWithFrame:[self loadButtonFrame]];
    [[self controlView] addSubview:_btn];
    [_btn setTarget:self];
    [_btn setTitle: @""];
    [_btn setButtonType:NSMomentaryChangeButton];
    [_btn setBezelStyle:NSRoundRectBezelStyle];
    [_btn setBordered:NO];
    [_btn setEnabled:YES];
    
    [_btn setAction:@selector(getPassword:)];
}
- (NSRect)drawingRectForBounds:(NSRect)theRect
{
    
    NSRect newRec = [super drawingRectForBounds:theRect];
    newRec.size.width = NSMinX([self loadButtonFrame]) - _boundary_space_;
    newRec.origin.y = (NSHeight(newRec) - [self stringSize].height) * 0.5;
    return newRec;
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
//    if (_btn == nil ) {
//        [self addLoadButton];
//    }
    [[NSColor grayColor]set];
    NSRectFill(cellFrame);
    if ([self.title length]>0) {
        [_btn setImage:[NSImage imageNamed:@"iCloudLoginBtn_down"]];
        [_btn setEnabled:YES];
    }else{
        [_btn setImage:[NSImage imageNamed:@"iCloudLoginBtn_dis"]];
        [_btn setEnabled:NO];
        
    }
    [_btn setNeedsDisplay];
}

- (NSSize)stringSize
{
    return self.attributedStringValue.size;
}

- (void)getPassword:(id)sender
{
    NSLog(@"%@",self.title);
}

@end
