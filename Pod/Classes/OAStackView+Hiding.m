//
//  OAStackView+Hiding.m
//  Pods
//
//  Created by Omar Abdelhafith on 15/06/2015.
//
//

#import "OAStackView+Hiding.h"

@implementation OAStackView (Hiding)

- (void)addObserverForView:(UIView*)view {
  [view addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)removeObserverForView:(UIView*)view {
  [view removeObserver:self forKeyPath:@"hidden"];
}

- (void)addObserverForViews:(NSArray*)views {
  for (UIView *view in views) {
    [self addObserverForView:view];
  }
}

- (void)removeObserverForViews:(NSArray *)views {
  for (UIView *view in views) {
    [self removeObserverForView:view];
  }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  BOOL isHidden = [change[NSKeyValueChangeNewKey] boolValue];
  
  if (isHidden) {
    [self hideView:object];
  } else {
    [self unHideView:object];
  }
  
}

@end