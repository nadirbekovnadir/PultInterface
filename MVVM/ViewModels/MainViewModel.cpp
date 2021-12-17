#include "MainViewModel.h"

MainViewModel::MainViewModel(
        TopScreenViewModel *topScreenViewModel,
        BotScreenViewModel *botScreenViewModel)
    : _topScreenViewModel(topScreenViewModel),
      _botScreenViewModel(botScreenViewModel)
{

}
