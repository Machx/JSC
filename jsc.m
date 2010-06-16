#import <Foundation/Foundation.h>
#import "JSCInterpreter.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	if(argc == 1){
		NSLog(@"Usage: jsc /path/to/javascript/script.js");
	}
	
	if(argc == 2){
		NSFileManager *fileMgr = [NSFileManager defaultManager];
		
		BOOL fileAtPath = [fileMgr fileExistsAtPath:[NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding]];
		
		if(fileAtPath == NO){
			NSLog(@"Error: the Javascript file you specified doesn't exist");
		} else {
			NSString *jsFile = [NSString stringWithContentsOfFile:[NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding]
														 encoding:NSUTF8StringEncoding
															error:nil];
			
			NSLog(@"Running the following Javascript...\n%@",jsFile);
			
			NSString *scriptResult = nil;
			
			scriptResult = [JSCInterpreter evaluateJavaScript:jsFile];
			
			if(scriptResult != nil){
				NSLog(@"Result:%@",scriptResult);
			}
		}
	}
    
    [pool drain];
    return 0;
}
