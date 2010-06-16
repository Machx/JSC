//
//  JSCInterpreter.m
//  jsc
//
//  Created by Colin Wheeler on 6/15/10.
//  Copyright 2010. All rights reserved.
//

#import "JSCInterpreter.h"


@implementation JSCInterpreter

+(NSString *)evaluateJavaScript:(NSString *)jscript
{
	//Create the Javascript context & JSStringRef to run the Javascript in
	JSGlobalContextRef context = JSGlobalContextCreate(NULL);
	JSStringRef script = JSStringCreateWithCFString((CFStringRef)jscript);
	
	//Run the script
	JSValueRef scriptResult = JSEvaluateScript(context, script, NULL, NULL, 0, NULL);
	
	//tidy up
	JSStringRelease(script);
	
	//convert the value to NSString (CFString)
	CFStringRef result = NULL;
	if(scriptResult){
		JSStringRef jsResultString = JSValueToStringCopy(context, scriptResult, NULL);
		result = JSStringCopyCFString(kCFAllocatorDefault, jsResultString);
		
		JSStringRelease(jsResultString);
	}
	else{
		result = nil;
	}
	
	NSLog(@"Script result is %@",(NSString *)result);

	//Final Cleanup
	JSGlobalContextRelease(context);
	
	return [(NSString *)result autorelease];
}

@end
