#include "ObjectDetectionProcessor.h"

#include <chrono>
#include <thread>

bool ObjectDetectionProcessor::run(const int &data, float &result)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(20));

    result = data * 10;

    return true;
}
