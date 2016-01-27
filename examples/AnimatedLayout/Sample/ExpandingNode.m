//
//  ExpandingNode.m
//  Sample
//
//  Created by Levi McCallum on 1/26/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ExpandingNode.h"

@interface ExpandingNode () {
  ASDisplayNode *_node;
}

@end

@implementation ExpandingNode

- (instancetype)init
{
  self = [super init];

  if (self != nil) {
    _node = [[ASDisplayNode alloc] init];
    _node.backgroundColor = [UIColor blueColor];
    [self addSubnode:_node];
  }
  
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
  UIEdgeInsets insets = self.isExpanded ? UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) : UIEdgeInsetsMake(50.0, 50.0, 50.0, 50.0) ;
  return [ASInsetLayoutSpec insetLayoutSpecWithInsets:insets child:_node];
}

@end
