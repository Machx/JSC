//
//  JSCInterpreter.h
//  jsc
//
//  Created by Colin Wheeler on 6/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface JSCInterpreter : NSObject {

}
+(NSString *)evaluateJavaScript:(NSString *)jscript;
@end
