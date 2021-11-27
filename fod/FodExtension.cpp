#include <compositionengine/FodExtension.h>

uint32_t getFodZOrder(uint32_t z, bool touched) {
    return touched ? 1090519091 : z;
}

uint64_t getFodUsageBits(uint64_t usageBits, bool) {
    return usageBits;
}
