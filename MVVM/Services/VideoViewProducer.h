#pragma once

#include <QObject>
#include <QVideoFrame>

#include "BaseDataHandler.h"

#include "Domain/Video/IDataProvider.h"
#include "Domain/Video/IDataProcessor.h"

#include "../ViewModels/VideoViewModel.h"

class VideoViewProducer : public QObject, public BaseDataHandler<int, float, VideoViewModel>
{
    Q_OBJECT

public:
    VideoViewProducer(
        std::shared_ptr<IDataProvider<int>> provider,
        std::shared_ptr<IDataProcessor<int, float>> processor);
    virtual ~VideoViewProducer() = default;

protected:
    bool convertProcessedToOutput(const float &data, VideoViewModel &result) override;
    bool convertInputToOutput(const int &data, VideoViewModel &result) override;
};
