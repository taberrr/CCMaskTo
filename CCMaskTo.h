//
//  CCMaskTo.h
//
//  Created by georgejcook
//

#import "cocos2d.h"

@interface CCMaskTo : CCIntervalAction <NSCopying>
{
  CGRect endRect;
  CGRect startRect;
  CGRect delta;
}

+(id) actionWithDuration:(ccTime)duration rect:(CGRect)rect;
-(id) initWithDuration:(ccTime)duration rect:(CGRect)rect;

@end
