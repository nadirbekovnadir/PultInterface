#include "EthernetVideoProvider.h"

#include <chrono>
#include <thread>

void EthernetVideoProvider::open()
{
    _isOpened = true;
}

void EthernetVideoProvider::close()
{
    _isOpened = false;
}

bool EthernetVideoProvider::isOpened()
{
    return _isOpened;
}

bool EthernetVideoProvider::tryGet(int &data)
{
    if (!_isOpened)
        return false;

    std::this_thread::sleep_for(std::chrono::milliseconds(10));

    data = _testCounter++;
    return true;
}
