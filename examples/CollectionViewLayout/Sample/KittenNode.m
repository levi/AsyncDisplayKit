//
//  UICollectionViewWaterfallCell.m
//  Sample
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "KittenNode.h"

@implementation KittenNode {
  CGSize _kittenSize;
  ASNetworkImageNode *_imageNode;
}

- (id)initWithKittenOfSize:(CGSize)size {
  self = [super init];
  if (self != nil) {
    _kittenSize = size;
    _imageNode = [[ASNetworkImageNode alloc] init];
    _imageNode.backgroundColor = ASDisplayNodeDefaultPlaceholderColor();
    _imageNode.URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://ssl.webpack.de/lorempixel.com/%zd/%zd/cats",
                                           (NSInteger)roundl(_kittenSize.width),
                                           (NSInteger)roundl(_kittenSize.height)]];
    [self addSubnode:_imageNode];
  }
  return self;
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
  CGFloat ratio = constrainedSize.width / _kittenSize.width;
  CGSize size = CGSizeMake(constrainedSize.width, ratio * _kittenSize.height);
  [_imageNode measure:size];
  return size;
}

- (void)layout
{
  NSLog(@"Calculated size: %@", NSStringFromCGSize(self.calculatedSize));
  _imageNode.frame = CGRectMake(0, 0, self.calculatedSize.width, self.calculatedSize.height);
}

@end
