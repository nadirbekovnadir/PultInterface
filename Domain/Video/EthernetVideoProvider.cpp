#include "EthernetVideoProvider.h"

#include <chrono>
#include <thread>

bool EthernetVideoProvider::tryGet(int &data)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(10));

    data = testCounter++;
    return true;
}
