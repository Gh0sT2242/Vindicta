#define OOP_ERROR
#include "..\OOP_Light\OOP_Light.h"

/*
Executed in unscheduled when ACE Cargo is unloaded
*/

#define pr private

// We post messege to the main thread
CALLM2(gMessageLoopMainManager, "postMethodAsync", "EH_aceCargoUnloaded", _this);