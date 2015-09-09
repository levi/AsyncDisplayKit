//
//  ViewController.m
//  Sample
//
//  Created by Nelson on 12/11/27.
//  Copyright (c) 2012年 Nelson. All rights reserved.
//

#import "ViewController.h"
#import "KittenNode.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewWaterfallFooter.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"

@interface ViewController ()
@property (nonatomic, strong) ASCollectionView *collectionView;
@property (nonatomic, strong) NSArray *cellSizes;
@end

@implementation ViewController

- (instancetype)init
{
  self = [super init];
  if (self) {
    _cellSizes = @[
      [NSValue valueWithCGSize:CGSizeMake(400, 550)],
      [NSValue valueWithCGSize:CGSizeMake(1000, 665)],
      [NSValue valueWithCGSize:CGSizeMake(1024, 689)],
      [NSValue valueWithCGSize:CGSizeMake(640, 427)]
    ];
  }
  return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
  layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
  layout.minimumColumnSpacing = 20;
  layout.minimumInteritemSpacing = 30;
  
  _collectionView = [[ASCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
  _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  _collectionView.asyncDataSource = self;
  _collectionView.asyncDelegate = self;
  _collectionView.backgroundColor = [UIColor whiteColor];
//  [_collectionView registerClass:[CHTCollectionViewWaterfallCell class]
//      forCellWithReuseIdentifier:CELL_IDENTIFIER];
//  [_collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
//      forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
//             withReuseIdentifier:HEADER_IDENTIFIER];
//  [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
//      forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
//             withReuseIdentifier:FOOTER_IDENTIFIER];
//  
  [self.view addSubview:_collectionView];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self updateLayoutForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self updateLayoutForOrientation:toInterfaceOrientation];
}

- (void)updateLayoutForOrientation:(UIInterfaceOrientation)orientation {
  CHTCollectionViewWaterfallLayout *layout =
  (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
  layout.columnCount = UIInterfaceOrientationIsPortrait(orientation) ? 2 : 3;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return CELL_COUNT;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 2;
}

- (ASCellNode *)collectionView:(ASCollectionView *)collectionView nodeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  KittenNode *node = [[KittenNode alloc] initWithKittenOfSize:[self.cellSizes[indexPath.item % 4] CGSizeValue]];
  return node;
}

@end
