#pragma once

#include "IDataProcessor.h"

//Пока это все затычка
class ObjectDetectionProcessor final : public IDataProcessor<int, float>
{
    int testCounter = 0;
public:
    bool run(const int &data, float &result) override;
};
