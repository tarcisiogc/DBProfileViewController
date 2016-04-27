//
//  DBProfileDefines.h
//  Pods
//
//  Created by Devon Boyer on 2016-04-26.
//
//

#pragma once

#define DBProfileSuppressPerformSelectorWarning(PerformCall) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
PerformCall; \
_Pragma("clang diagnostic pop") \
} while (0)