#pragma once

#include <QObject>

#include "TopScreenViewModel.h"
#include "BotScreenViewModel.h"

using namespace std;

class MainViewModel : public  QObject
{
    Q_OBJECT

    Q_PROPERTY(TopScreenViewModel *topScreenViewModel READ topScreenViewModel CONSTANT)
    Q_PROPERTY(BotScreenViewModel *botScreenViewModel READ botScreenViewModel CONSTANT)

private:
    shared_ptr<TopScreenViewModel> _topScreenViewModel;
    shared_ptr<BotScreenViewModel> _botScreenViewModel;

public:
    TopScreenViewModel* topScreenViewModel() const { return _topScreenViewModel.get(); }
    BotScreenViewModel* botScreenViewModel() const { return _botScreenViewModel.get(); }

public:
    MainViewModel(
        shared_ptr<TopScreenViewModel> topScreenViewModel,
        shared_ptr<BotScreenViewModel> botScreenViewModel);
    virtual ~MainViewModel();
};
