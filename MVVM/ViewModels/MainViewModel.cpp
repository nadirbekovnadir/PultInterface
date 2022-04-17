#include "MainViewModel.h"

#include <QDebug>

MainViewModel::MainViewModel(
    shared_ptr<TopScreenViewModel> topScreenViewModel,
    shared_ptr<BotScreenViewModel> botScreenViewModel)
        : _topScreenViewModel(topScreenViewModel),
          _botScreenViewModel(botScreenViewModel)
{

}

MainViewModel::~MainViewModel()
{
    qDebug() << "MainViewModel destroyd";
}
