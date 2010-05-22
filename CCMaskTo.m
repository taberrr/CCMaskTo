//
//  CCMaskTo.m
//
//  Created by georgejcook
//

#import "CCMaskTo.h"

@implementation CCMaskTo

+(id) actionWithDuration: (ccTime)t rect: (CGRect)r {
  return [[[self alloc] initWithDuration:t rect:r ] autorelease];
}

-(id) initWithDuration: (ccTime)t rect: (CGRect)r {
  if(!(self = [super initWithDuration: t]))
    return nil;

  endRect = r;
  return self;
}

-(void) startWithTarget:(id)aTarget {	
  DLog(@"target:::::::: %@", aTarget);
  [super startWithTarget:aTarget];
	
  startRect = [target textureRect];
  CGPoint endXY = ccp(endRect.origin.x, endRect.origin.y);
  CGPoint endWH = ccp(endRect.size.width, endRect.size.height);

  CGPoint startXY = ccp(startRect.origin.x, startRect.origin.y);
  CGPoint startWH = ccp(startRect.size.width, startRect.size.height);

  CGPoint deltaXY = ccpSub( endXY, startXY );
  CGPoint deltaWH = ccpSub( endWH, startWH );
  delta = CGRectMake(deltaXY.x, deltaXY.y, deltaWH.x, deltaWH.y);
}

-(id) copyWithZone: (NSZone *)zone {
  CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration: [self duration] rect: endRect];
  return copy;
}

-(void) update: (ccTime)t {
  CGRect newTextureRect = CGRectMake(
    (startRect.origin.x + delta.origin.x * t ), (startRect.origin.y + delta.origin.y * t ),
    (startRect.size.width + delta.size.width * t ), (startRect.size.height + delta.size.height * t )
  );
  [target setTextureRect: newTextureRect];
}

@end
