//
//  DYFMWK.m
//  DYFMWK
//
//  Created by Max Rozdobudko on 05.01.2020.
//  Copyright © 2020 Max Rozdobudko. All rights reserved.
//

#import "DYFMWK.h"
#import "FlashRuntimeExtensions.h"
#import <TheFramework/TheFramework.h>

@implementation DYFMWK

@end

#pragma mark - API

FREObject DYFMWKIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]) {
    NSLog(@"DYFMWKIsSupported");
    FREObject returnValue;
    if (FRENewObjectFromBool((uint32_t) 1, &returnValue) != FRE_OK) {
        return NULL;
    }
    return returnValue;
}

#pragma mark - ContextInitialize/ContextFinalizer

void DYFMWKContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {
    NSLog(@"DYFMWKContextInitializer");

    *numFunctionsToSet = 1;

    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToSet));

    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &DYFMWKIsSupported;

    *functionsToSet = func;
}

void DYFMWKContextFinalizer(FREContext ctx){
    NSLog(@"DYFMWKContextFinalizer");
}

#pragma mark - Initializer/Finalizer

void DYFMWKInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    NSLog(@"DYFMWKInitializer");

    *extDataToSet = NULL;

    *ctxInitializerToSet = &DYFMWKContextInitializer;
    *ctxFinalizerToSet = &DYFMWKContextFinalizer;
}

void DYFMWKFinalizer(void* extData) {
    NSLog(@"DYFMWKFinalizer");
}
