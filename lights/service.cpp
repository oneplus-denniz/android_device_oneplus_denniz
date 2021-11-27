#define LOG_TAG "android.hardware.light@2.0-service.OP515BL1"

#include <android-base/logging.h>
#include <hidl/HidlTransportSupport.h>

#include "Light.h"

using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;

using android::hardware::light::V2_0::ILight;
using android::hardware::light::V2_0::implementation::Light;

using android::OK;
using android::status_t;

int main() {
    android::sp<ILight> service = new Light();

    configureRpcThreadpool(1, true);

    status_t status = service->registerAsService();
    if (status != OK) {
        LOG(ERROR) << "Cannot register Light HAL service.";
        return 1;
    }

    LOG(INFO) << "Light HAL service ready.";

    joinRpcThreadpool();

    LOG(ERROR) << "Light HAL service failed to join thread pool.";
    return 1;
}
